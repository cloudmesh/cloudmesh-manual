Instalation on Raspbian
^^^^^^^^^^^^^^^^^^^^^^^

Setup with curl
---------------

As Rasperry runs on Linux, you can use the same install istructions for
cloudmesh as on other operating systems via the cloudmesh-installer.
However you will need to install a number of packages to make the RaspbianOS
more complete.

To assit yo in doing so, we are providing a simple culr script for installing
Cloudmesh on RaspbianOS.


.. mermaid::

   graph TD
      keygen(ssh-keygen fa:fa-key)
      curl("curl -Ls http://cloudmesh.github.io/get/pi | sh")
      pip(pip install cloudmesh-openstack)
      cms(cms help)
      start(Start) --> keygen --> curl --> pip --> cms

      style start stroke:#333,stroke-width:4px
      style cms stroke:#333,stroke-width:4px

Use Cloudmesh to set up a cluster of PIs
----------------------------------------

We have provided a comprehensive manual on how to use Cloudmesh in a PI
cluster. This manual is avalable  at

* https://github.com/cloudmesh/cloudmesh-pi-burn/blob/main/README.md
