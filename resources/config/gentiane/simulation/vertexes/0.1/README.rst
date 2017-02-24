Primary vertex generation setup ``gentiane`` (version ``0.1``)
==============================================================================

The  vertex   generator  manager  (class  ``genvtx::manager``)   is  a
high-level   factory   object   responsible  of   the   instantiation,
initialization  and  destruction  of  vertex  generator  objects.  The
manager is associated  to the geometry manager  describing the virtual
geometry of the experimental setup.


Files
-----

 * ``README.rst`` : This file.
 * ``manager.conf`` : The main configuration file for the vertex generation manager.
 * ``generators/.../*.def`` :  Contains the definitions of various primary vertex generators.
   Files use the ``datatools::multi_properties`` format:

.. code::

   #@description The list of primary vertex generators
   #@key_label  "name"
   #@meta_label "type"

   # First vertex generator:
   [name="generator-name-1" type="generator-class-identifier-1"]
   #@config Title 1

   # List of configuration properties
   key-1 : type-1 = value-1
   key-2 : type-2 = value-2
   # More properties ...

   # Second vertex generator:
   [name="generator-name-2" type="generator-class-identifier-2"]
   #@config Title 2

   # List of configuration properties
   key-1 : type-1 = value-1
   key-2 : type-2 = value-2
   # More properties ...

   # More vertex generators...
..


Definition of a vertex generator
--------------------------------

Generator names are unique for a given setup.  By convention, the name
of a vertex  generator has the ``.vg`` suffix. We  also use a specific
prefix  for  each vertex  generator  category  of interest.   Example:
``shielding.core_int_lead_block_bulk.vg``.

Several types/classes of vertex generators are available natively from
the Bayeux/genvtx  module.  They must  be associated to  some specific
collections of physical volumes in the virtual geometry.

* ``genvtx::spot_vertex_generator`` : vertex generator on a fixed single spot (not randomized)

  Generate/browse documentation with :

.. code:: sh

   $ bxocd_manual --action show genvtx::spot_vertex_generator > genvtx-spot_vertex_generator.rst
   $ rst2html  genvtx-spot_vertex_generator.rst > genvtx-spot_vertex_generator.html
   $ xdg-open genvtx-spot_vertex_generator.html &
..

* ``genvtx::box_model_vg`` : vertex generator associated to identical box physical volumes

  Generate/browse documentation with :

.. code:: sh

   $ bxocd_manual --action show genvtx::box_model_vg > genvtx-box_model_vg.rst
   $ rst2html  genvtx-box_model_vg.rst > genvtx-box_model_vg.html
   $ xdg-open genvtx-box_model_vg.html &
..

* ``genvtx::cylinder_model_vg`` : vertex generator associated to identical cylinder physical volumes
* ``genvtx::polycone_model_vg`` : vertex generator associated to identical polycone physical volumes
* ``genvtx::sphere_model_vg`` : vertex generator associated to identical spherical physical volumes
* ``genvtx::combined_vg`` : Combine several vertex generators using a specific weighting policy


Using the Bayeux/genvtx inspector/production program
----------------------------------------------------

1. List the available generators from the Bayeux/genbb_help manager:

.. code:: sh

   $ brewsh
   $ bayeux_dev_setup
   $ cd {EDW-Gentiane-MC source dir}/resources/
   $ bxgenvtx_production \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --geometry-manager         "@edwgentiane:config/gentiane/geometry/0.1/manager.conf" \
	  --vertex-generator-manager "@edwgentiane:config/gentiane/simulation/vertexes/0.1/manager.conf" \
	  --list
   ...
..

2. Generate 10000 events from one specific vertex generator picked up from the available list
   in the Bayeux/genvtx manager. Generate an output ASCII file for testing
   the output generated vertexes and display a fraction of the generated vertex:

.. code:: sh

   $ bxgenvtx_production \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --geometry-manager         "@edwgentiane:config/gentiane/geometry/0.1/manager.conf" \
	  --vertex-generator-manager "@edwgentiane:config/gentiane/simulation/vertexes/0.1/manager.conf" \
	  --shoot \
	  --vertex-generator "lab.ceiling_surface.vg" \
	  --prng-seed 314159 \
	  --number-of-vertices 10000 \
	  --vertex-modulo 1000 \
	  --output-file "genvtx_test.data" \
	  --visu \
	  --visu-max-counts 1000 \
	  --visu-spot-size "5.0 mm" \
	  --visu-spot-color "magenta" \
	  --visu-object "[0:0]"
..

The ``genvtx_test.data`` file use a 3 columns (X,Y,Z) ASCII format with leading metadata.
It can easily be used by an external program (Gnuplot, Excel, Python...).

3. Yet another example:

.. code:: sh

   $ bxgenvtx_production \
	  --datatools::resource-path "edwgentiane@$(pwd)" \
	  --geometry-manager         "@edwgentiane:config/gentiane/geometry/0.1/manager.conf" \
	  --vertex-generator-manager "@edwgentiane:config/gentiane/simulation/vertexes/0.1/manager.conf" \
	  --shoot \
	  --vertex-generator "shielding.core_int_lead_block_bulk.vg" \
	  --prng-seed 314159 \
	  --number-of-vertices 10000 \
	  --vertex-modulo 1000 \
	  --output-file "genvtx_test.data" \
	  --visu \
	  --visu-max-counts 5000 \
	  --visu-spot-size "1.0 mm" \
	  --visu-spot-color "magenta" \
	  --visu-object "[0:0]"
..
