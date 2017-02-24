Primary event generation setup ``gentiane`` (version ``0.1``)
==============================================================================

The primary  event generator  manager (class ``genbb::manager``)  is a
high-level   factory   object   responsible  of   the   instantiation,
initialization and destruction of primary event generator objects.

Files
-----

* ``README.rst`` : This file.
* ``manager.conf`` : The main configuration file for the primary event generators manager.
* ``generators/.../*.def`` :  Contains the definitions of various primary event generators.
  Files use the ``datatools::multi_properties`` format:

.. code::

   #@description The list of primary events generators
   #@key_label  "name"
   #@meta_label "type"

   # First generator:
   [name="generator-name-1" type="generator-class-identifier-1"]
   #@config Title 1

   # List of configuration properties
   key-1 : type-1 = value-1
   key-2 : type-2 = value-2
   # More properties ...

   # Second generator:
   [name="generator-name-2" type="generator-class-identifier-2"]
   #@config Title 2

   # List of configuration properties
   key-1 : type-1 = value-1
   key-2 : type-2 = value-2
   # More properties ...

   # More generators...
..


Definition of a primary event generator
---------------------------------------

Generator names are unique for a given setup.

Several  types/classes  of  primary  event  generators  are  available
natively from the Bayeux/genbb_help module:


* ``genbb::single_particle_generator`` : Generate an arbitrary particle (e+/e-/gamma/alpha/neutron/proton/mu+/mu-)

  Generate/browse documentation with :

.. code:: sh

   $ bxocd_manual --action show genbb::single_particle_generator > genbb-single_particle_generator.rst
   $ rst2html  genbb-single_particle_generator.rst > genbb-single_particle_generator.html
   $ xdg-open genbb-single_particle_generator.html &
..

* ``genbb::wdecay0`` : C++ port of the legacy Genbb/Decay0 original FORTRAN generator

  Generate/browse documentation with :

.. code:: sh

   $ bxocd_manual --action show genbb::wdecay0 > genbb-wdecay0.rst
   $ rst2html  genbb-wdecay0.rst > genbb-wdecay0.html
   $ xdg-open genbb-wdecay0.html &
..

* ``genbb::combined_particle_generator`` : Generator which combines several generators

  Generate/browse documentation with :

.. code:: sh

   $ bxocd_manual --action show genbb::combined_particle_generator > genbb-combined_particle_generator.rst
   $ rst2html  genbb-combined_particle_generator.rst > genbb-combined_particle_generator.html
   $ xdg-open genbb-combined_particle_generator.html &
..

* ``genbb::nuclear_decay_generator`` : Experimental (but promising!)


Using the Bayeux/genbb_help inspector program
---------------------------------------------

1. List the available generators from the Bayeux/genbb_help manager:

.. code:: sh

   $ brewsh
   $ bayeux_dev_setup
   $ cd {EDW-Gentiane-MC source dir}/resources/
   $ bxgenbb_inspector \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --configuration "@edwgentiane:config/gentiane/simulation/primary_events/0.1/manager.conf" \
	  --action "list"
   ...
..

2. Generate 100000 events from one specific generator picked up from the available list
   in the Bayeux/genbb_help manager. Generate a histogram file in Root format for testing
   the output generated events (multiplicity and kinematics):

.. code:: sh

   $ bxgenbb_inspector  \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --configuration "@edwgentiane:config/gentiane/simulation/primary_events/0.1/manager.conf" \
	  --action "shoot" \
	  --generator "bkg_model_test" \
	  --prng-seed 314159 \
	  --number-of-events 100000 \
	  --modulo 1000 \
	  --histo-def "@genbb_help:inspector/config/le_nuphy-1.0/inspector_histos_prompt.conf" \
	  --histo-def "@genbb_help:inspector/config/le_nuphy-1.0/inspector_histos_delayed.conf" \
	  --prompt-time-limit 1 \
	  --prompt \
	  --delayed \
	  --title-prefix "Background model test" \
	  --output-file "histos_test.root"
..

   Browse the output histograms:

.. code:: sh

   $ root histos_test.root
   ...
   root [1] TBrowser b; // Browser the  "histos_test.root" file from the ROOT Files folder in the ROOT Object Browser...
   root [2] .q
..


3. Generate 100000 events from one specific generator picked up from the available list
   in the Bayeux/genbb_help manager. Generate an XML output file with generated events
   of type ``genbb::primary_event`̀ and readable using a ``datatools::data_reader`` object:

.. code:: sh

   $ bxgenbb_inspector  \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --configuration "@edwgentiane:config/gentiane/simulation/primary_events/0.1/manager.conf" \
	  --action "shoot" \
	  --generator "bkg_model_test" \
	  --prng-seed 314159 \
	  --number-of-events 100000 \
	  --modulo 1000 \
	  --output-mode "plain" \
	  --output-file "histos_test.xml"
..

4. Change  ``"histos_test.xml"`` to  ``"histos_test.data.gz"`` for a compressed binary format:

.. code:: sh

   $ bxgenbb_inspector  \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --configuration "@edwgentiane:config/gentiane/simulation/primary_events/0.1/manager.conf" \
	  --action "shoot" \
	  --generator "bkg_model_test" \
	  --prng-seed 314159 \
	  --number-of-events 100000 \
	  --modulo 1000 \
	  --output-mode "plain" \
	  --output-file "histos_test.data.gz"
..
