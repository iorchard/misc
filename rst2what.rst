rst2what.sh
============

This is a script to convert a rst(restructured text) file to the other
formatted file like docx, pdf, etc.

Prerequisites
--------------

Install these packages to use this script on debian 9 (stretch).::

    $ sudo apt install -y pandoc texlive texlive-xetex fonts-nanum

How to use
-----------

Usage)::

    Usage: ./rst2what.sh [-h] -f <infile> -t [pdf|docx|...] [-o <outfile>] 
        Description
            -h: help message
            -f: input file (should be rst format.)
            -t: output file type (see 'man pandoc')
            -o: output file full path (default: ./<infile>.<type>)


Here are some examples.

Convert a.rst to a.pdf.::

     $ ./rst2what.sh -f a.rst -t pdf

Convert b.rst to my.pdf.::

     $ ./rst2what.sh -f b.rst -t pdf -o my.pdf

Convert c.rst to c.docx.::

     $ ./rst2what.sh -f c.rst -t docx 

