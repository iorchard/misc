rand_dir_file_gen.rst
======================

This is a script to create dirs and files with random size and random
content.

It is used for my cephfs lab.

It creates the sub directories with prefix 'tmp.' and files to 
the specified directory with option '-d' or the current directory.

It spreads files to the sub directories 

Prerequisites
--------------

It depends on dd command so dd should be installed. 
Most linux distros install it since it is included in coreutils package.

How to use
-----------

Usage)::

	./rand_dir_file_gen.sh [-h] [-n <num_files>] [-d <dir>] [-i <interval_sec>]
        Description
            -h: help message
            -n: the number of files to creates (default: 4)
            -d: the directory to create files (default: current directory)
            -i: the interval of creating files in seconds (default: 0)

Here are some examples.

Create 4 random files in the current directory.
In this case, no option needs to be specified.::

     $ ./rand_dir_file_gen.sh 

Create 10 random files in the current directory.::

     $ ./rand_dir_file_gen.sh -n 10

Create 25 random files in ~/rand directory.::

     $ ./rand_dir_file_gen.sh -n 25 -d ~/rand

Create 100 random files in ~/rand directory with 5 seconds interval.::

     $ ./rand_dir_file_gen.sh -n 100 -d ~/rand -i 5


