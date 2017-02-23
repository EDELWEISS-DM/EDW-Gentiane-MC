==============================================================
 How to generate a very simple sample geometry configuration
==============================================================


From the ``resources/config`` directory:

.. code:: sh

   $ cd resources/config
..

Bayeux geomtools skeleton generator:

.. code:: sh

   $ bxgeomtools_mkskelcfg --setup-label gentiane --registered-module edwgentiane
   $ LANG=C tree
   .
   `-- gentiane
       `-- geometry
           `-- 0.1
	       |-- README.rst
               |-- manager.conf
               |-- mapping
               |   `-- categories.lis
               |-- models
               |   |-- detector.geom
               |   |-- source.geom
               |   `-- world.geom
               `-- plugins
                   |-- mappings.conf
                   |-- material_aliases.def
                   `-- materials.conf
..

.. code:: sh

   $ bxgeomtools_mkskelcfg \
	  --setup-label gentiane \
	  --setup-version 0.2 \
	  --registered-module edwgentiane
..
