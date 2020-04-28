Windows 10
==========

C::raw-latex:`\Users`:raw-latex:`\USER`>

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
   cloudmesh-installer git clone cloud
   cloudmesh-installer install -e


