Virtual geometry setup ``gentiane`` (version ``0.1``)
==============================================================================

This is the Bayeux/geomtools virtual geometry description of the gentiane HPGe detector.


Files
-----

 * ``README.rst`` : This file.
 * ``manager.conf`` : The main configuration file for the geometry manager.
 * Folders:

   * ``mapping`` : Contains the files that are used by GID mapping.

     * ``categories.lis`` : Contains the definition of geometry categories
       used by the automated numbering scheme for the mapping of geometry volumes
       through geometry identifiers (GIDs).

   * ``models`` : Contains the files that describe geometry models.

     * ``source.geom`` : The definition of a source geometry model.
     * ``detector.geom`` : The definition of a detector geometry model.
     * ``world.geom`` : The definition of the top-level geometry volume (world) and
       its daughter physical volumes (source and detectors).

   * ``plugins`` : Contains the files that describe plugins for the geometry manager.

     * ``mappings.conf`` : The definition of plugins for dedicated geometry mapping.
     * ``materials.conf`` : The definition of a plugin dedicated to the description
       of the materials of which the geometry volumes are made of.
     * ``material_aliases.def`` : The definition of a material aliases used by the material plugin.

Geometry inspector
------------------

Run the Bayeux/geomtools inspector program from the ``resources`` dir:

.. code:: sh

   $ cd ${HOME}/softs/EDELWEISS/EDELWEISS-DM/EDW-Gentiane-MC/resources
   $ bxgeomtools_inspector \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --manager-config "@edwgentiane:config/gentiane/geometry/0.1/manager.conf"
   geomtools> display

   Press [Enter] to continue...
   geomtools> help
   ...
   geomtools> quit
..
