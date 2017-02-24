Geant4 simulation setup ``gentiane`` (version ``0.1``)
==============================================================================

Files
-----

 * ``README.rst`` : This file.
 * ``manager.conf`` : The main configuration file for the vertex generation manager.
 * ``hits`` : This folder contains configuration files for hit generation and processing

   * ``step_hit_processors.conf`` : Contains the definition of step hit processors.

 * ``physics`` : This folder contains configuration files for physics lists

   * ``particles.conf`` : Particle definitions
   * ``em.conf`` : Electromagnetic processes

Geant4 production
-----------------

Run the Bayeux/mctools Geant4 simulation production program: ::

  $ bxg4_production \
      --datatools::resource-path toto@config \
      --batch                  \
      --using-time-statistics  \
      --vertex-generator-name "source0_bulk.vg"  \
      --vertex-generator-seed 0 \
      --event-generator-name "Co60" \
      --event-generator-seed 0 \
      --g4-manager-seed 0      \
      --shpf-seed 0            \
      --output-prng-seeds-file g4_mc_Co60.seeds   \
      --output-prng-states-file g4_mc_Co60.states \
      --number-of-events 10     \
      --config config/gentiane/simulation/geant4_control/0.1/manager.conf \
      --output-data-file g4_mc_Co60.xml
