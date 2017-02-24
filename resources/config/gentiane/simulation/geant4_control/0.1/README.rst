Geant4 simulation setup ``gentiane`` (version ``0.1``)
==============================================================================

The Geant4 session manager is a high-level object responsible of the
full simulation process. It uses the geometry model provided by the
Bayeux geometry manager, a vertex generator provided by the
Bayeux vertex generator manager and a primary event generator provided
by the Bayeux primary event generator manager.
It adds functionalities specific to the Geant4 API: management of
sensitive detectors, physics lists or constructors, and embedded
random number generators...
It also uses a specific data model to save the simulated hits.

Files
-----

 * ``README.rst`` : This file.
 * ``manager.conf`` : The main configuration file for the Geant4 manager.
 * ``hits`` : This folder contains configuration files for hit generation and processing

   * ``step_hit_processors.conf`` : Contains the definition of step hit processors.

 * ``physics`` : This folder contains configuration files for physics lists

   * ``particles.conf`` : Particle definitions
   * ``em.conf`` : Electromagnetic processes

Using the Bayeux/Geant4 simulation production program
---------------------------------------------

1. Run the Bayeux/mctools Geant4 simulation production program in batch
    mode.

    Shoot Tl208 decay events from the sample bulk volume:

.. code:: sh

   $ brewsh
   $ bayeux_dev_setup
   $ cd {EDW-Gentiane-MC source dir}/resources/
   $ bxg4_production \
       --datatools::resource-path "edwgentiane@$(pwd)" \
       --config "@edwgentiane:config/gentiane/simulation/geant4_control/0.1/manager.conf" \
    --batch                  \
      --using-time-statistics  \
      --vertex-generator-name "sample.sample_bulk.vg"  \
      --vertex-generator-seed 0 \
      --event-generator-name "Tl208" \
      --event-generator-seed 0 \
      --g4-manager-seed 0      \
      --shpf-seed 0            \
      --output-prng-seeds-file "g4_mc_Tl208.seeds"   \
      --output-prng-states-file "g4_mc_Tl208.states" \
      --number-of-events 10     \
       --output-data-file "g4_mc_Tl208.xml"
      ...
..


2. Run the Bayeux/mctools Geant4 simulation production program in interactive
   mode.

   *not working on macOS for now*

   $ bxg4_production \
       --datatools::resource-path "edwgentiane@$(pwd)" \
       --config "@edwgentiane:config/gentiane/simulation/geant4_control/0.1/manager.conf" \
      --interactive   \
      --using-time-statistics  \
      --vertex-generator-name "sample.sample_bulk.vg"  \
      --vertex-generator-seed 0 \
      --event-generator-name "Tl208" \
      --event-generator-seed 0 \
      --g4-manager-seed 0      \
      --shpf-seed 0            \
      --output-prng-seeds-file "g4_mc_Tl208.seeds"   \
      --output-prng-states-file "g4_mc_Tl208.states" \
      --output-data-file "g4_mc_Tl208.xml" \
      --g4-visu \
      --g4-macro "@edwgentiane:config/gentiane/simulation/geant4_control/0.1/visu/geant4_visualization.mac"
      ...
..


.. end
