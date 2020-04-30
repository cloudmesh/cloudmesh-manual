Installation
============


Cloudmesh is easy to install. Dependent on your preferences you can choose an
install from

* pip if you are a Cloudmesh user
* source install if you are a developer
* an instalation in containers

Please read the installation section in this manual completely, and understand
the items explained before you install. Do not just paste and copy text in
your terminal and execute it as it could have unexpected consequences.
This also helps to decide which instalation method is best suited for you.


.. mermaid::

   graph LR
     os{OS}

    subgraph .
    Native
    end

    subgraph .
    Native
    end


     Linux-->Native
     Linux-->Docker
     Linux-->cmsd

     macOS-->Native
     macOS-->Docker
     macOS-->cmsd

     Windows-->Native
     Windows-->Docker
     Windows-->cmsd
     Raspbian-->Native


     os-->Raspbian
     os-->macOS
     os-->Windows
     os-->Linux

     subgraph IoT
     Raspbian
     end

     subgraph  OS
     Linux
     macOS
     Windows
     end

     subgraph Container
     Docker
     cmsd
     end

     click Linux "http://www.github.com" "This is a tooltip for a link"

.. mermaid::

   graph TD
      A(Prerequits) --> python(Python 3.7 or 3.8)
      python --> pip(pip >20.0)
      pip --> venv(venv)
      venv --> install
      key --> install
      A --> xcode(X code)
      xcode --> keygen(ssh keygen)
      keygen -->key[fa:fa-key Key]
      install --> I(pip install openstack)



Installation of cloudmesh with Docker
-------------------------------------

The easiest way to install cloudmesh is to use docker containers. This
instalation can be conducted on all OSes on which docker and python 3.8.2 is
installed. Cloudmesh can also be installed with a specialized `cloudmesh-cmsd`
command that is distributed as source and on PyPi.

See  :doc:`../cmsd` for more information.

In the next sections we discuss the native install of cludmesh on

* Linux
* Windows
* maxOS

We start with some elementary requirements that are typically already fulfilled
if you are a developer on that platform.


Prerequisites for other Installs
--------------------------------

.. note::

          Before you install make sure that you have an up to date version of
          python installed. We recommend you use 3.8.2 or newer. Python can be
          downloaded and installed from https://www.python.org/downloads/. On
          Windows you may also need to install the C++ commandline build tools
          as some cryptographic libraries need to be recompiled in 3.8.2. This
          only applies if you like to use cloudmesh-encrypt.

          Likely the code will work with earlier versions starting from 3.7.4.
          We know that Python 3.6 has bugs and should not be used. Although
          cloudmesh previously was supported in Python 2.7 and newer, we have
          removed Python 2 as supported platform.

.. note::

          We recommend that you use  Python `venv` to isolate the system Python
          form the user python. For simplicity we assime and document on how to
          set up a virtual environment in the home directory under the
          directory `ENV3`.



If you have an older version of Ubuntu please follow the instructions for

* :doc:`Ubuntu 19.10 <../installation/install-ubuntu-19.10>`
* :doc:`Ubuntu 18.04 <../installation/install-ubuntu-18-04>`


Prerequisites for Windows 10
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On Windows 10 you can install cloudmesh by either using

* a Windows native installation,
* a Linux Subsystem installation,
* a Docker instalation,

approach. We recommend that you use the Professional or the
Educational version of Windows, as the Home edition is very limited.
Alternatively, you can also use the docker version of cloudmesh.
We explain the various methods.


Python Installation from python.org
"""""""""""""""""""""""""""""""""""

The easiest installation of Python for cloudmesh is to use the installation from
https://www.python.org/downloads. Please, visit the page and follow the
instructions. After this install you have `python3` available from the
command line.

.. code-block:: bash

   python3 -m venv ~/ENV3
   source ~/ENV3/bin/activate


Prerequisites for venv (ENV3)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _Use a venv:

VirtualEnv (or ``venv``) allows the creation of an isolated Python environment.
Using a venv is highly recommended to ensure cloudmesh and cloudmesh-related
installations do not interfere with a system-level installation of python.

.. warning:: Not using a `venv` could have catastrophic consequences and
  result in the destruction of operating system tools which rely on
  Python.

Once `venv` has been created and activated, packages installed with venv will
be installed in this virtual environment and not in the global Python site packages.
This mitigates risks of global package installations.

For our purposes we assume that you use the venv directory::

    ~/ENV3

.. note:: In a Linux subsystem, `~/` is the default location, assumed
   to be the home directory.  In a windows system, this location is
   assumed to be under `C:\Users\USERNAME`.

venv Setup on Linux and macOS or Windows gitbash
""""""""""""""""""""""""""""""""""""""""""""""""

For the `venv` setup on Linux or macOs, run the following:

.. code-block:: bash

   python3 -m venv  ~/ENV3
   source ~/ENV3/bin/activate

You can add at the end of your `.bashrc` (ubuntu) or `.bash_profile`
(macOS) file the line so the environment is always loaded.

.. code-block:: bash

   source ~/ENV3/bin/activate

SSH key
-------

In order for you to use cloudmesh you will need an ssh key. This can be
created from the command line with

.. code-block:: bash

    ssh-keygen

Please make sure to use a passphrase with your key. Anyone telling you to use
a passwordless key is giving you a wrong advice.

Next you want to add a keyname that you use in your clouds to the cloudmesh
yaml file. You can do this by completing the profile or form the command line
with:

.. code-block:: bash

    cms config set cloudmesh.profile.user=YOURUSERNAME
    cms set key user=YOURUSERNAME

The `cms init` includes this automatically.
If ssh is not activated on windows please follwo the Microsoft instructions.


Installation of Cloudmesh (End User)
------------------------------------

.. note:: The end user installation steps assume you intend to use
   cloudmesh only as a user.  If you intend to utilize cloudmesh as a
   developer, you must skip ahead to the next section which
   lists the installation steps required for a source install.

The recommended installation approach for cloudmesh is handled through
pip.  Cloudmesh is distributed in different modules, so as an end
user, you only need to install the modules you desire.

Prior to beginning, be sure to activate your venv, e.g.``ENV3``. Then,
depending on your needs, you can install the cloudmesh `cloud` or
`storage`, and/or volume bundles with what packages you need:

.. code-block:: bash

   pip install cloudmesh-openstack
   pip install cloudmesh-aws
   pip install cloudmesh-google
   pip install cloudmesh-azure
   pip install cloudmesh-volume
   pip install cloudmesh-storage


Once installed, test the cloudmesh command and at the same time create
a configuration file. This is done by invoking the ``cms help`` command the first
time. Thus, just type the command


.. code-block:: bash

   cms help

in your terminal. It will create a directory `~/.cloudmesh`
in which you can find the configuration file::

    ~/.cloudmesh/cloudmesh.yaml


Anaconda and Conda
^^^^^^^^^^^^^^^^^^

Cloudmesh can be installed in anaconda with pip. Please follow our pip
instructions, but make sure you create your own virtualenv with conda and assure
you use python at least 3.7


Reinstallation
^^^^^^^^^^^^^^

In case you need to reinstall cloudmesh and you have used previously the
`cloudmesh-installer`, you can do it as follows (We assume you have used venv
and the `cloudmesh-installer` in the directory cm as documented previously):

.. code-block:: bash

    cd cm # the directory where your source locates
    cloudmesh-installer clean --dir=. --force
    cloudmesh-installer clean --ENV=~/ENV3 --force
    python3 -m venv ~/ENV3
    pip install pip -U
    pip install cloudmesh-installer
    cloudmesh-installer get openstack
    cms help


.cloudmesh directory
--------------------

All cloudmesh related configuration information is stored in the
`.cloudmesh` directory.  In case you want to start fresh, simply
delete that directory and its subdirectories. However, if you need
information from it make sure you make a backup.

Please note that in this file you have sensitive information and it
should never be backed up into GitHub, box, icloud, or other such services.
Keep it on your computer or back it up on an secure encrypted external hard
drive or storage media only you have access to.


Installation of MongoDB
-----------------------

Once you have installed cloudmesh it is easy to install MongoDB with
the build in MongoDB installer.



