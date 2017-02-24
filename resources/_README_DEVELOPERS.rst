===============================
EDW-Gentiane-MC resource files
===============================

:Authors: François Mauger
:Date:    2017-02-24

.. contents::
   :depth: 3
..

Presentation
============

This is  the top  level directory  of all  resource files  provided by
EDW-Gentiane-MC package.

Files:

 * ``_README_DEVELOPERS.rst`` : this file (not published).
 * ``_BuildResourceList.sh``  (not published):  a shell  script
   which builds the list of resource  files for the CMake build system
   and stores it in  the  ``_resources.cmake``  file.  All  files  or
   directories (including this  script) of which the  name starts with
   an underscore character  will not be published and  thus will not be
   visible from the EDW-Gentiane-MC installation path.
 * ``_resources.cmake`` (not published): this CMake script defines the
   list of published resource files for the CMake build system through
   the  ``EDW_Gentiane_MC_RESOURCES``  variable. This file should be rebuilt
   by the ``_BuildResourceList.sh`` script each time this is it
   needed during the development cycle (adding or removing files).
   This rebuilding can be done by hand by running the script directly :

.. code:: sh

    $ ./_BuildResourceList.sh
    $ ls -1 _resources.cmake
    _resources.cmake
..

   or by running the script through your build tool via the
   ``edw_gentiane_mc_resources`` custom target :

.. code:: sh

   $ make edw_gentiane_mc_resources
..

 * ``config`` : the top directory for all official configuration files
   used   by  the   simulation,  reconstruction   and  data   analysis
   processing. See the ''README.rst'' file for details.
