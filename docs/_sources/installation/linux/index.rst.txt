Instalation for for Linux
=========================

We describe here the various choces for the instalation of cloudmesh on linux. We focussed
on Ubuntu but useres were able to adopt them easily for other versions of Linux
including CentOS, RedHat, and Linux Mint.

If you have rerequisits for thes OSes, please send them to us and we include them here.

Please read the document first, before you copy and paste, as there are
differences between the installs fior regular users, container users and developers.

Prerequisites for Ubuntu 20.4
------------------------------

.. code-block:: bash

   python3 -m venv ~/ENV3
   source ~/ENV3/bin/activate
   pip install pip -U


Prerequisites for Ubuntu 19.10
-------------------------------

We recommend you swithc to Ubuntu 20.04. However if you can not do this please
follow these steps.

Python 3.8.2 is not yet installed in Ubuntu 19.10. The installation is simple
and can be conducted with the following steps. You can download python from

* https://www.python.org/downloads

.. code-block:: bash

   sudo apt -y update
   sudo apt -y install openssl curl
   # sudo apt -y install libreadline-gplv2-dev libncursesw5-dev
   sudo apt -y libssl-dev
   sudo apt -y libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
   tar -xvf Python-3.8.2.tgz
   cd Python-3.8.2
   ./configure
   make
   sudo make altinstall
   python3.8 --version
   python3 --version
   # Should be 3.8.2
   python3 -m venv ~/ENV3
   source ~/ENV3/bin/activate
   pip install pip -U


Prerequisites for Ubuntu 18.04
-------------------------------

We recommend you swithc to Ubuntu 20.04. However if you can not do this please
follow these steps.

We first need to make sure that the correct version of the Python3 is
installed. The default version of Python on Ubuntu 18.04 is 3.6. You can get
the new version with

.. code-block:: bash

   sudo apt-get -y update
   sudo apt-get -y install openssl curl
   sudo apt-get install software-properties-common
   sudo add-apt-repository ppa:deadsnakes/ppa
   sudo apt-get install python3.8 python3-dev python3.8-dev
   python3.8 -m venv --without-pip ~/ENV3
   source ~/ENV3/bin/activate
   curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
   python get-pip.py
   rm get-pip.py


.. include:: install-generic.rst

Installation Diagram
-------------------

We provide an easy to follow instalation diagram to showcase how simple the instalation for cloudesh is

.. mermaid::

   graph TD


      A(Prerequisite) --> python(Python 3.7 or 3.8)
      python --> venv
      venv --> pip(pip install pip -U)
      pip --> install(Prerequisite completed)
      key --> install
      A --> keygen(ssh keygen)
      keygen -->key[fa:fa-key Key]
      install --> chose

      chose-->cuser([Container User])
      chose-->nuser([Native User])
      chose-->duser([Developer])

      duser-->dev(pip install cloudmesh-installer<br/>cloudmesh-installer get openstack)
      nuser-->user(pip install cloudmesh-openstack)
      cuser--> idocker(Install Docker)
      idocker--> container(pip install cloudmesh-cmsd)

      setup(cms help<br/>cms admin mongo install<br/>cms --gui quick<br/>cms init)
      dev-->setup
      user-->setup
      container-->setupd(cmsd --setup)

      setup-->cms
      setupd-->cmsd

      style keygen fill:gainsboro,stroke:#333,stroke-width:2px
      style dev fill:gainsboro,stroke:#333,stroke-width:2px
      style user fill:gainsboro,stroke:#333,stroke-width:2px
      style container fill:gainsboro,stroke:#333,stroke-width:2px
      style setup fill:gainsboro,stroke:#333,stroke-width:2px
      style pip fill:gainsboro,stroke:#333,stroke-width:2px


