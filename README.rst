misc
====

This is a repo for trivial things while we work.

smtp_tls_send.py
------------------

This is a python script to test SMTP TLS(port 587) using smtplib.::

   $ python3 smtp_tls_send.py -s <smtp_server> -u <username>
   Enter user's password: 

k8s_v1.12.3_kubelet_pleg_deadlock.patch
-----------------------------------------

This is a patch file for kubelet PLEG deadlock bug in kubernetes version 1.12.3.

Go to kubernetes v1.12.3 source and patch this file.::

   $ cd /path/to/kubernetes-1.12.3
   $ patch -p1 < /path/to/this/patch/file
   patching file pkg/kubelet/metrics/metrics.go
   patching file pkg/kubelet/pleg/generic.go
   patching file pkg/kubelet/pleg/generic_test.go

Build the patched kubernetes source.::

   $ make quick-release

rbd_loc.sh
------------

List osds in which the objects of rbd image are.

rst2what.sh
------------

This is a script to convert a rst(restructured text) file to the other
formatted file like docx, pdf, etc.

For more information, refer to rst2what.rst.

rand_dir_file_gen.sh
---------------------

This is a script to generate random dirs/files with random size and 
random content.

For more information, refer to rand_dir_file_gen.rst.

