Top level directory for resource files of the EDW-Gentiane-MC package
==============================================================================

Contents
--------

* ``config`` : Top directory for configuration files (geometry, simulation)

Access to resource files
------------------------

Any published  resource file in the  EDW-Gentiane-MC installation path
can be  made locatable through the  EDW-Gentiane-MC registration label:
``edwgentiane``.

For  example,  the ``resource/config/gentiane/geometry/0.1/manager.conf``  file
can     be    addressed     through    the     following    path     :
``@edwgentiane:config/gentiane/geometry/0.1/manager.conf``.

This mechanism makes possible for the  users or client programs not to
remember  the  installation   path  on  a  given   system.   They  can
automatically  find   any  resource  file  relatively   to  this  base
installation path which is thus resolved through the Bayeux/datatools'
kernel path registration system.

In order  to register  the EDW-Gentiane-MC installation  resource base
directory,     Bayeux    applications     generally    provide     the
``--datatools::resource-path`` command line switch. Typical syntax is:

.. code:: sh
   bxdummyapp \
     --datatools::resource-path "edwgentiane@/path/to/EDW-Gentiane-MC/resources/installation/base/dir" \
     ...
..

Each time a character string representing a file path will starts with
the ``@edwgentiane:`` prefix, it will be resolved by locating the file
from the real EDW-Gentiane-MC resources installation base directory.

Some  typical  configuration  parameters representing  file  paths  of
interest from a ``datatools::properties`` formatted file could be:

.. code:: sh
   #@description The main configuration file for the geometry modelling manager
   config_file : string as path = "@edwgentiane:config/gentiane/geometry/0.1/manager.conf"

   #@description A calibration data file
   data_file : string as path = "@edwgentiane:data/calibration/0.1/run-2.data"
..

.. end
