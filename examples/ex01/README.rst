===========================================================
EDW-Gentiane-MC example ex01 : Read simulated data
===========================================================

:Authors: - François Mauger, LPC Caen <mauger@lpccaen.in2p3.fr>
:Date: 2017-02-28

Build
------------

.. code:: sh

   $ brewsh
   {brewShell}$ bayeux_dev_setup
   {brewShell}$ mkdir _build.d
   {brewShell}$ cd _build.d/
   {brewShell}$ cmake -DCMAKE_INSTALL_PREFIX=../_install.d \
	  -DBayeux_DIR:PATH=$(bxquery --cmakedir) \
	  ..
   {brewShell}$ make
..

Usage
------------

.. code:: sh

   {brewShell}$ ./hpge_mcdata_read --help
   ...
..


Tests
-----

1. Read simulated events and generate  output data in a CSV file:

.. code:: sh


   {brewShell}$ ./hpge_mcdata_read \
	  --logging "notice" \
	  --input-file "../data/mctest_42/data/mctest_42.data.gz" \
	  --output-file "mctest_42.csv"
   {brewShell}$ gsl-histogram 0.0 2000.0 2000 < mctest_42.csv > mctest_42.histo
   {brewShell}$ gnuplot
   gnuplot> set grid
   gnuplot> set title "EDW-Gentiane-DM - Example ex01 - HPGe spectrocopy"
   gnuplot> set xlabel "Energy (keV)"
   gnuplot> set ylabel "Count (/keV)"
   gnuplot> set xrange [0.0:2000.0] # keV
   gnuplot> set yrange [0:8]       # Counts/keV
   gnuplot> plot "mctest_42.histo" using (0.5*(column(1)+column(2))):(column(3)) notitle with histeps
..

2. Read simulated events and generate output data in a ROOT file (tree):

.. code:: sh


   {brewShell}$ ./hpge_mcdata_read \
	  --logging "notice" \
	  --input-file "../data/mctest_42/data/mctest_42.data.gz" \
	  --output-file "mctest_42.root"
   {brewShell}$ root mctest_42.root
   root [0] TBrowser b; // Then browse the HPGe "energy" histogram
   root [1] .q
..


Installation
------------

.. code:: sh

   {brewShell}$ make install
..
