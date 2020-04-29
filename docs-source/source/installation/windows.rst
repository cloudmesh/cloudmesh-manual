Windows 10
==========

Make sure to close all windows and programs and editors that relate to
cloudmesh or the ENV3 directory.

::

   rmdir /s ENV3
   python -m venv ENV3

   python --version
   # Python 3.8.2
   ENV3/Scripts/activate
   mkdir cm
   cd cm
   pip install pip -U
   pip install-cloudmesh-installer
   cloudmesh-installer get openstack


