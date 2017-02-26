====================================================
The EDW-Gentiane-MC Simulation Production Program
====================================================

Introduction
------------

The ``edw-gentiane-mc-run`` program  is a Bash script  which wraps the
``bxg4_production``  generic   application  from   the  Bayeux/mctools
library module.

``edw-gentiane-mc-run`` accepts the  ``--help`` command line switch to
display its usage:

.. code:: sh

   $ edw-gentiane-mc-run --help
..

Simulation configuration
------------------------

The  configuration of  a given  simulation  run is  defined through  a
collection  of files,  provided by  the EDW-Gentiane-MC  project.  The
files  are published  from  the  ``resources`` installation  directory
(located  via  the ``edw-gentiane-mc-query  --resourcedir``  command).
All      files     use      the     ``datatools::properties``      and
``datatools::multi_properties``    ASCII    human   readable    format
(Bayeux/datatools API).

The simulation setup includes:

* a  virtual  geometry model  (from  the  Bayeux/geomtools API)  which
  describes the  experimental setup (laboratory,  shielding, detector,
  measured sample),
* a  vertex generator  manager (from  the Bayeux/genvtx  API) used  to
  randomly  shoot the  location  of radioactive  decays  in the  setup
  (sample, lead shield walls...),
* a primary  event generator manager (from  the Bayeux/genbb_help API)
  used  to  randomly shoot  the  decaying  particles associated  to  a
  specific decay channel (Co-60, Tl-208...),
* a simulation manager (from the Bayeux/mctools Geant4 plugin library)
  which defines all  the required software components to  run a Geant4
  session and generate  simulated *physics hits* before  to store them
  in an output file.

See the ``$(edw-gentiane-mc-query --resourcedir)/config/gentiane/``
directory to explore the configuration files.


Simulation output
-----------------

Each simulation run produces a working directory where several files
are stored:

* the metadata file  (ASCII format) which records a  set of parameters
  of interest about the simulation session (run identifier, version of
  the geometry  model, vertex  generator, event generator,  version of
  the simulation setup, number of generated events...). The file can be
  easily parsed by external data analysis programs.
* configuration file(s): seeds for embedded random number generators.
* log  files (standard/error  outputs, final  states of  random number
  generators).
* the  output data  file  which records  the  collection of  simulated
  events (*truth hits* produced by Geant4).

The working directory can be optionaly turned into a ``tar`` archive.

The   output   data  file   uses   an   I/O   format  based   on   the
Boost/Serialization library.   The file  contains one  Boost *archive*
per event (gzip compressed portable binary archive).  It can be parsed
from a  C++ client  software through  a reader  class provided  by the
Bayeux/datatools  and/or  Bayeux/mctools   library  modules  (see  for
example the ``mctools/simulated_data_reader`` class).

Each  simulated  event  is  represented  by an  instance  of  the  C++
``mctools::simulated_data``  class (from  the Bayeux/mctools  API).  A
``mctools::simulated_data``  object  contains  collections  of  *truth
hits*  which are  instances of  the ``mctools::base_step_hit``  class.
The  Bayeux/mctools API  provides  tools to  navigate  in and  extract
physics informations from these data structures.
