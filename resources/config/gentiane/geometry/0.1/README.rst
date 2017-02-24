Virtual geometry setup ``gentiane`` (version ``0.1``)
==============================================================================

The geometry  manager (class  ``geomtools::manager``) is  a high-level
object  responsible  of the  hierarchical  geometry  modelling of  the
experimental  setup.  It  contains  several  components  with  special
responsibilities:

* a  *geometry  model  factory* which  instantiates,  initializes  and
  finally  destroys geometry  models, associated  logical volumes  and
  physical volumes,
* a  *geometry   identifier  manager*  which  describes   the  various
  categories  of volumes  in the  geometry hierarchy  and relationship
  between them,
* a *geometry mapping dictionary*  which associate physical volumes of
  interest which unique geometry identifiers (GID)
* a *plugin manager* which embeds various plugin components related to
  the   geometry  modelling.   Example:  the   *material*  plugin   is
  responsible  of  the  description  of  all  isotopes,  elements  and
  materials used in the virtual geometry.

This  directory  contains  the  description  of  the  Bayeux/geomtools
virtual geometry for gentiane HPGe detector.


Files
-----

 * ``README.rst`` : This file.
 * ``manager.conf``  : The  main configuration  file for  the geometry
   manager.
 * Folders:

   * ``mapping`` : Contains the files that are used by GID mapping.

     * ``categories.lis``  :  Contains   the  definition  of  geometry
       categories  used  by the  automated  numbering  scheme for  the
       mapping  of  geometry   volumes  through  geometry  identifiers
       (GIDs).

   * ``models`` : Contains the files that describe geometry models.

     * ``source.geom`` : The definition of a source geometry model.
     * ``detector.geom``  :  The  definition of  a  detector  geometry
       model.
     * ``world.geom``  :  The  definition of  the  top-level  geometry
       volume (world)  and its  daughter physical volumes  (source and
       detectors).

   * ``plugins`` :  Contains the files  that describe plugins  for the
     geometry manager.

     * ``mappings.conf``  : The  definition of  plugins for  dedicated
       geometry mapping.
     * ``materials.conf`` :  The definition  of a plugin  dedicated to
       the description of the materials  of which the geometry volumes
       are made of.
     * ``material_aliases.def`` : The definition of a material aliases
       used by the material plugin.

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
