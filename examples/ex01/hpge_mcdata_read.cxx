// hpge_mcdata_read.cxx
//! \author Arnaud Chapon, François Mauger
//! \brief  Process simulated data from a HPGe detector
//
// Copyright (c) 2017 by Arnaud Chapon <achapon@cerap.fr>
//                       and François Mauger <mauger@lpccaen.in2p3.fr>
//
// This file is part of EDW-Gentiane-MC.
//
// EDW-Gentiane-MC is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// EDW-Gentiane-MC is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with EDW-Gentiane-MC. If not, see <http://www.gnu.org/licenses/>.

// Standard library:
#include <cstdlib>
#include <iostream>
#include <exception>
#include <string>

// Third party:
// - Boost:
#include <boost/filesystem.hpp>
#include <boost/program_options.hpp>
// - Bayeux:
#include <bayeux/bayeux.h>
// - Bayeux/datatools:
#include <datatools/logger.h>
#include <datatools/exception.h>
#include <datatools/kernel.h>
// - Bayeux/mctools:
#include <mctools/simulated_data.h>
#include <mctools/base_step_hit.h>
#include <mctools/simulated_data_reader.h>
// - Bayeux/geomtools:
#include <geomtools/geomtools_config.h>
// - ROOT:
#include <TFile.h>
#include <TTree.h>

//! \brief Application
struct app {
  //! Print application usage (supported options and arguments)
  static void usage(std::ostream & out_,
                    const boost::program_options::options_description & desc_);

  //! Print the application name
  static std::string name();

  //! Print application version
  static void version(std::ostream & out_);

  /// Return kernel initialization flags for this application
  static uint32_t kernel_init_flags();

  //! \brief Application configuration parameters
  struct config_params {
    //! Default constructor
    config_params();
    datatools::logger::priority logging; //!< Logging priority threshold (default value: FATAL)
    std::string input_filename;          //!< Name of the input simulation data file (default value: empty)
    std::size_t input_nevents;           //!< Force number of input events (default: 0 for 'all')
    std::string hit_category;            //!< Hit category (default value: "HPGe")
    std::string output_filename;         //!< Name of the output file (default value: empty)
    bool        dump_events;             //!< Flag to dump the simulated event
  };

  config_params cfg; //!< Configuration parameters
};

//! \brief HPGe event
struct event {
  int id;        //!< Event identifier
  double energy; //!< Deposited energy in keV
};

//! Main program:
int main(int argc_, char * argv_[])
{
  bayeux::initialize(argc_, argv_, app::kernel_init_flags());
  int error_code = EXIT_SUCCESS;
  try {

    // The application configuration parameter set:
    app readerApp;

    // Describe command line arguments :
    namespace po = boost::program_options;

    // Variable map:
    po::variables_map vm;
    po::options_description all_opts;

    try {

      // Describe the allowed options for this application:
      po::options_description opts("Allowed options");
      opts.add_options()
        ("help,h", "Produce help message")

        ("version,v", "Print version")

        ("logging-priority,L",
         po::value<std::string>(),
         "Set the logging priority")

        ("input-file,i",
         po::value<std::string>(&readerApp.cfg.input_filename),
         "Set the name of the input simulated data file from which to load the Monte-Carlo data")

        ("input-nevents,n",
         po::value<std::size_t>(&readerApp.cfg.input_nevents),
         "Set the true total number of simulated events even if the input data file contains less events due to storage optimization (for normalization and/or efficiency estimation)")

        ("output-file,o",
         po::value<std::string>(&readerApp.cfg.output_filename),
         "Set the name of the output data file\n"
         "from which to store calorimetry data.\n"
         "Supported extensions are:\n"
         "  '.root': \tROOT tree\n"
         "  '.csv' : \tASCII CSV format"
         )

        ("dump-events,d",
         po::value<bool>(&readerApp.cfg.dump_events)
         ->zero_tokens()
         ->default_value(false),
         "Activate simulated events' raw print")

        ;

      // Describe positional arguments for this application:
      po::positional_options_description args;
      args.add("input-file", 1);
      args.add("output-file", 1);


      // Describe Bayeux/datatools kernel options:
      po::options_description kopts("Bayeux/datatools kernel options");
      datatools::kernel::param_type kparams;
      datatools::kernel::build_opt_desc(kopts, kparams, app::kernel_init_flags());

      // Collect all supported options in one container:
      all_opts.add(opts);
      all_opts.add(kopts);

      // Configure the parser:
      po::command_line_parser cl_parser(argc_, argv_);
      cl_parser.options(all_opts);
      cl_parser.positional(args);

      // Parse:
      po::parsed_options parsed = cl_parser.run();

      // Fill and notify a variable map:
      po::store(parsed, vm);
      po::notify(vm);
    } catch (std::exception & po_error) {
      app::usage(std::cerr, all_opts);
      throw;
    }

    // Use command line arguments :

    if (vm.count("help")) {
      // Print help message then quit:
      app::usage(std::cout, all_opts);
      return(error_code);
    }

    if (vm.count("version")) {
      // Print version then quit:
      app::version(std::cout);
      return(error_code);
    }

    // Fetch the verbosity level:
    if (vm.count("logging-priority")) {
      const std::string & logging_label = vm["logging-priority"].as<std::string>();
      readerApp.cfg.logging = datatools::logger::get_priority(logging_label);
      DT_THROW_IF(readerApp.cfg.logging == datatools::logger::PRIO_UNDEFINED, std::logic_error,
                  "Invalid logging priority label '" << logging_label << "' !");
    }

    // The simulated data reader :
    mctools::simulated_data_reader sd_reader;
    sd_reader.initialize(readerApp.cfg.input_filename);

    // Event
    event ev;

    std::unique_ptr<std::ofstream> fcsv_ptr;
    TFile * froot_ptr = nullptr;
    TTree * tree_ptr = nullptr;
    if (!readerApp.cfg.output_filename.empty()) {
      boost::filesystem::path opath = readerApp.cfg.output_filename;
      if (opath.extension() == ".csv") {
        // CSV output:
        fcsv_ptr.reset(new std::ofstream(opath.c_str()));
      } else if (opath.extension() == ".root") {
        // ROOT tree output:
        froot_ptr = new TFile(opath.c_str(), "RECREATE", "ROOT File for simulated events");
        froot_ptr->cd();
        std::ostringstream tree_name_oss;
        tree_name_oss << readerApp.cfg.hit_category << ".events";
        std::ostringstream tree_title_oss;
        tree_title_oss << readerApp.cfg.hit_category << " events";
        tree_ptr = new TTree(tree_name_oss.str().c_str(), tree_title_oss.str().c_str());
        tree_ptr->SetDirectory(froot_ptr);
        tree_ptr->Branch("id",     &ev.id);
        tree_ptr->Branch("energy", &ev.energy);
      } else {
        DT_THROW(std::logic_error, "Unsupported output file extension '" << opath.extension() << "'!");
      }
    }

    // The event loop:
    std::size_t event_counter = 0;
    std::size_t calo_hit_counter = 0;
    std::size_t calo_event_counter = 0;
    while (sd_reader.has_next()) {
      // The source Monte-Carlo data object to be loaded :
      mctools::simulated_data SD;

      // Load the simulated data object:
      sd_reader.load_next(SD);

      if (readerApp.cfg.dump_events) {
        SD.tree_dump(std::clog, "SD event: ");
      }

      if (SD.has_step_hits(readerApp.cfg.hit_category)) {
        double event_calo_energy = 0.0;
        for (std::size_t i = 0; i < SD.get_number_of_step_hits(readerApp.cfg.hit_category); i++) {
          // Extract a truth step hit from the target collection of hits:
          const mctools::base_step_hit & calo_hit = SD.get_step_hit(readerApp.cfg.hit_category, i);
          event_calo_energy += calo_hit.get_energy_deposit();
          calo_hit_counter++;
        }
        if (event_calo_energy > 0.0) {
          ev.id = event_counter;
          ev.energy = event_calo_energy / CLHEP::keV;
          if (fcsv_ptr) {
            *fcsv_ptr << ev.id << ' ' << ev.energy << std::endl;
          } else if (froot_ptr) {
            tree_ptr->Fill();
          }
          calo_event_counter++;
        }
      }

      event_counter++;
    }

    size_t total_event_counter = event_counter;
    if (readerApp.cfg.input_nevents != 0) {
      if (event_counter > readerApp.cfg.input_nevents) {
        DT_LOG_ERROR(datatools::logger::PRIO_ALWAYS, "Input number of events less than number of stored events");
      }
      total_event_counter = readerApp.cfg.input_nevents;
    }

    if (froot_ptr) {
      froot_ptr->Write();
      froot_ptr->Close();
    }
    if (fcsv_ptr) {
      fcsv_ptr.reset();
    }

    DT_LOG_NOTICE(readerApp.cfg.logging, "Number of Monte-Carlo events  : " << total_event_counter);
    DT_LOG_NOTICE(readerApp.cfg.logging, "Number of HPGe effective hits : " << calo_hit_counter);

  } catch (std::exception & error) {
    DT_LOG_FATAL(datatools::logger::PRIO_ALWAYS, error.what());
    error_code = EXIT_FAILURE;
  } catch (...) {
    DT_LOG_FATAL(datatools::logger::PRIO_ALWAYS, "Unexpected error!");
    error_code = EXIT_FAILURE;
  }
  bayeux::terminate();
  return error_code;
}

// Definitions of methods:

std::string app::name()
{
  return "hpge_mcdata_read";
}

void app::version(std::ostream & out_)
{
  out_ << app::name() << " 1.0" << std::endl;
  return;
}

void app::usage(std::ostream & out_,
                const boost::program_options::options_description & opts_)
{
  out_ << "Usage : " << std::endl;
  out_ << opts_ << std::endl;
  return;
}

app::config_params::config_params()
{
  logging       = datatools::logger::PRIO_FATAL;
  input_nevents = 0;
  hit_category  = "HPGe";
  dump_events   = false;
  return;
}

uint32_t app::kernel_init_flags()
{
  uint32_t kernel_init_flags = 0;
  kernel_init_flags |= datatools::kernel::init_no_help;
  kernel_init_flags |= datatools::kernel::init_no_logging;
  kernel_init_flags |= datatools::kernel::init_no_splash;
  kernel_init_flags |= datatools::kernel::init_no_inhibit_libinfo;
  kernel_init_flags |= datatools::kernel::init_no_libinfo_logging;
  kernel_init_flags |= datatools::kernel::init_no_variant;
  kernel_init_flags |= datatools::kernel::init_no_inhibit_variant;
  kernel_init_flags |= datatools::kernel::init_no_locale_category;
  kernel_init_flags |= datatools::kernel::init_no_inhibit_qt_gui;
  return kernel_init_flags;
}
