Installation
============

Cloudmesh is easy to install. Dependent on your preferences you can choose an
install from

* pip if you are a Cloudmesh user
* source install if you are a developer

Please read the installation section in this manual completely, and understand
the items explained before you install. Do not just paste and copy text in
your terminal and execute it as it could have unexpected consequences.

.. warning:: At this time we do not recommend the conda install, as the conda
             packages are outdated.

Prerequisites
-------------

.. note:: Before you install make sure that you have at minimum python 3.7.4
          installed. Likely the code will work with earlier versions, but we
          do the development in python 3.7.4. This version can be downloaded
          and installed from https://www.python.org/downloads/.
          See the below subsections for system-specific prerequisites.

Prerequisites for Ubuntu 19.04
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Python 3.7 is installed in ubuntu 19.04. Therefore, it already fulfills the
prerequisites. However we recommend that you update to the newest version of
python and pip. Please visit: https://www.python.org/downloads/

Additionally, Cloudmesh requires OpenSSL and Curl installed in the system.

.. code:: bash

    sudo apt -y update
    sudo apt -y install openssl curl

Prerequisites for macOS
^^^^^^^^^^^^^^^^^^^^^^^

Installation of XCode
"""""""""""""""""""""

You want a number of useful tool on your macOS. They are not installed by
default, but are available via Xcode. First you need to install xcode from

* https://apps.apple.com/us/app/xcode/id497799835

Next you need to install macOS xcode command line tools::

    xcode-select --install

Next you want to install a python version. You can either chose the instalation
from python.org or from homebrew.

Python Installation from python.org
"""""""""""""""""""""""""""""""""""

The easiest installation of Python for cloudmesh is to use the installation from
https://www.python.org/downloads. Please, visit the page and follow the
instructions. After this install you have `python3` available from the
command line.

Python Installation from Homebrew
"""""""""""""""""""""""""""""""""

An alternative installation is provided from Homebrew. To use this install
method, you need to install Homebrew first. Start the process by installing
the python 3 using ``homebrew``. Install ``homebrew`` using the
instruction in their `web page <https://brew.sh/#install>`_:

.. code:: bash

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Then you should be able to install Python 3.7.4 using:

.. code:: bash

    brew install python


Prerequisites for Ubuntu 18.04
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. warning:: We recommend you update your ubuntu version to 19.04 and
             follow the instructions for that version instead, as it is
             significantly easier. If you however are not able to do so, the
             following instructions may be helpful.


We first need to make sure that the correct version of the Python3 is
installed. The default version of Python on Ubuntu 18.04 is 3.6. You can get
the version with::

    python3 --version

If the version is not 3.7.4 or newer, you can update it as follows:

.. code:: bash

    sudo apt-get update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get install python3.7 python3-dev python3.7-dev

You can then check the installed version
using ``python3.7 --version`` which should be ``3.7.4``.

Now we will create a new virtual environment:

.. code:: bash

    python3.7 -m venv --without-pip ~/ENV3

The edit the ``~/.bashrc`` file and add the following line at the end:

.. code:: bash

    alias ENV3="source ~/ENV3/bin/activate"
    ENV3

now activate the virtual environment using:

.. code:: bash

    source ~/.bashrc

now you can install the pip for the virtual environment without conflicting
with the native pip:

.. code:: bash

    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
    python get-pip.py
    rm get-pip.py


Please note that, Cloudmesh requires OpenSSL and Curl installed in the system.

.. code:: bash

    sudo apt -y update
    sudo apt -y install openssl curl


Prerequisites for Windows 10
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On Windows 10 you can install cloudmesh by either using a Windows System installation approach
or a Linux Subsystem installation approach. We recommend that you use the Professional or the Educational
version of Windows, as the Home edition is very limited.
Alternatively, you can also use the docker version of cloudmesh.

.. warning:: The docker version of cloudmesh is still under development.

.. warning:: We do not recommend or support other versions of Windows.

Windows System Installation Approach
""""""""""""""""""""""""""""""""""""

* Ensure that python 3.7 (or higher) has been installed.
  Python 3.7 can be installed on Windows 10 using: https://www.python.org/downloads/

* Create a venv. This step is not required, but highly recommended.
  See section on prerequisites for venv below for more details on setup instructions.

Linux Subsystem Installation Approach
"""""""""""""""""""""""""""""""""""""

To activate the Linux Subsystem, please follow the instructions at

* https://docs.microsoft.com/en-us/windows/wsl/install-win10

A suitable distribution would be

* https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab

However, as it uses an older version of python, you will be required to update it.

Prerequisites for venv (ENV3)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. _Use a venv:

VirtualEnv (or ``venv``) is a Python module which allows the creation of an isolated
Python environment. Implementing this step is highly recommended to ensure cloudmesh
and cloudmesh-related installations do not interfere with a system-level
installation of python.

.. warning:: Not using a venv could have catastrophic consequences and result in the
  destruction of operating system tools which rely on Python.

Once venv has been implemented, activation of the venv is very simple, and
will contain subsequent package installations within the virutalenv;
mitigating risks of global package installations.

For our purposes we assume that you use the directory::

    ~/ENV3

.. note:: In a Linux subsystem, '~/' is the default location, assumed to be the home directory.
   In a windows system, this location is assumed to be under 'C:\\Users\\<username>'.

**venv Setup on Linux and macOS**

For venv setup on Linux or macOs, run the following:

.. code:: bash

   python3 -m venv  ~/ENV3
   source ~/ENV3/bin/activate

You can add at the end of your .bashrc (ubuntu) or .bash_profile (macOS) file
the line so the environment is always loaded.

.. code:: bash

   source ~/ENV3/bin/activate

**venv Setup on Windows**

Similarly, for Windows, run the following while under the default directory of  under 'C:\\Users\\<username>':

.. code:: cmd

  python -m venv --without-pip ENV3

Next, create a Windows system variable named "ENV3" and update the
variable value to 'C:\\Users\\<username>\\ENV3\\Scripts\\activate'.
Then add the ENV3 variable name to the Path variable.

Lastly, to simplify the venv activation call, create a new .bat file under the
default directory, and add the following snippet of code to the file.

.. code:: cmd

  C:\Users\<username>\ENV3\Scripts\activate.bat

.. note:: The same can be done Windows Powershell by creating a ENV3.ps1 to
  reference the activate.ps1 command.


**Testing venv Activation**

In command prompt, simply type "ENV3" while under the default directory;
or if the bat file was not created, simply reference the system variable %ENV3%.

**Validate Python and Pip Version in venv**
Check if you have the right version of python installed with

.. code:: bash

   python --version

To make sure you have an up to date version of pip issue the command

.. code:: bash

   pip install pip -U

Now you are ready to install cloudmesh.

Installation of Cloudmesh (End User)
------------------------------------

.. note:: The installation steps below assume you intend to use cloudmesh only as a user.
   If you intend to utilize cloudmesh as a developer, we encourage you to skip ahead
   to the next section which lists the installation steps required for a source install.

The recommended installation approach for cloudmesh is handled through pip.
Cloudmesh is distributed in different modules, so as an end user, you only need
to install the modules you desire.

Prior to beginning, be sure to activate your venv, ``ENV3``. Then, depending on your
needs, you can install the cloudmesh `cloud` or `storage` bundle with:

.. code:: bash

   pip install cloudmesh-cloud

or

.. code:: bash

   pip install cloudmesh-storage # not yet supported

Please note that the storage bundle also includes `cloudmesh-cloud`
.Additional packages include but are not yet released:

.. code:: bash

   pip install cloudmesh-flow    # not yet supported
   pip install cloudmesh-emr     # not yet supported
   pip install cloudmesh-batch   # not yet supported
   pip install cloudmesh-openapi # not yet supported


Once installed, test the cloudmesh command and at the same time create
a configuration file. This is done by invoking the ``cms`` command the first
time. Thus, just type the command


.. code:: bash

   cms help

in your terminal. It will create a directory ``~/.cloudmesh``
in which you can find the configuration file:

::

    ~/.cloudmesh/cloudmesh.yaml


Anaconda and Conda
^^^^^^^^^^^^^^^^^^

.. warning:: At this time the conda install is not supported.

We also have the base packages available as conda packages on conda hub
in the chanel ``laszewski``. This includes

-  cloudmesh-common
-  cloudmesh-cmd5
-  cloudmesh-sys

Note that the conda packages will always be a behind the version you will
find in pypi. Therefore we recommend you use the pip based installation.


Installation of Cloudmesh (Source Install for Developers)
---------------------------------------------------------

If you are a developer, we highly recommend you use the source installation steps
listed below.

For this reason we wrote the ``cloudmesh-installer`` script that conveniently downloads the
needed repositories, installs and updates them on demand. More documentation
about it can be found at

-  https://github.com/cloudmesh/cloudmesh-installer

First make sure you have a python ``venv`` as described in the pip section
(see `Use a venv`_). Now you can install it with

.. code:: bash

   pip install cloudmesh-installer

Next, it is best to create an empty directory and decide which bundles to
install while listing them

.. code:: bash

   mkdir cm
   cd cm
   cloudmesh-installer bundles

Once you have decided which bundle to install you can proceed. If you only want
to use compute resources the bundle name ``cloud`` will be what you want.
If in addition you also like to work on storage, the bundle name ``storage``
needs to be used.

Let, us assume you chose ``cloud``, than you can install cloudmesh with

.. code:: bash

   cloudmesh-installer git clone cloud
   cloudmesh-installer install cloud -e

The `-e` option is very important as it compiles the code in place of the
downloaded directories and in case of changes in the directory automatically
makes them available to the installed version. This is naturally very
important. It will take a while to install. On newer machines 1 minute, on older
significant longer. Please watch your system information if the install
takes a long time. After the installation is complete, you can than test if you
successfully installed it by issuing the command

.. code:: bash

    cms help

You will see a list of commands. A directory ``~/.cloudmesh`` with some
default files will be installed, that you will need to modify at one point.


Updates
^^^^^^^

To update the source from github, simply use the `cloudmesh-installer` command
while making sure to specify the desired bundle name, let us assume you use
``cloud``

.. code:: bash

    cloudmesh-installer git pull cloud

If you see any conflicts make sure to resolve them.

Please note that in an update it could also be possible that the format of the
cloudmesh.yaml file may have changed. Thus we always recommend that you also
update the yaml file to the newest format. YOU can check the yaml file with

.. code:: bash

    cms config check


As developer sometimes it may be best to make a backup of the `cm` directory or
individual repositories in the cm directory. Then copy your changes into the
newest code. Make sure to remove all python artifacts created with the -e
option. See the command

.. code:: bash

    cd cm
    cloudmesh-installer local purge .


Reinstallation
^^^^^^^^^^^^^^

In case you need to reinstall cloudmesh and you have used previously the
cloudmesh-installer, you can do it as follows (We assume you have used venv
and the ``cloudmesh-installer`` in the directory cm as documented previously):

.. code:: bash

    cd cm # the directory where your source locates
    cloudmesh-installer local purge . --force
    rm -rf ~/ENV3
    python3 -m venv ~/ENV3
    pip install pip -U
    pip install cloudmesh-installer
    cloudmesh-installer install cloud -e
    cms help

Please note that this will not work if you did not use the -e option previously.
Make sure to delete the old version, wherever you installed them.

.cloudmesh directory
--------------------

All cloudmesh related information is stored in the ``.cloudmesh`` directory.
In case you want to start fresh, simply delete that directory and its
subdirectories. However, if you need information form it make sure you make a
backup. Please note that in this file you have sensitive information and it
should never be backed up into github, box, icloud, or other such services.
Keep it on your computer or back it up on an secure encrypted external hard
drive or storage media only you have access to.


Installation of MongoDB
-----------------------

Uninstall of MongoDB on Windows 10
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

On Windows 10 you may already have mongo installed. If so you certainly can use
this install. Just make sure to create an admin user with password.

However if you do not use MongoDB, you can also uninstall it and then follw our
easy install guide.

To uninstall, please terminate and delete the MongoDB service. Run as
administrator in cms

.. code:: bash

    sc delete MongoDB

Please google for details on how to uninstall, and communicate them to us so we
can include them into this manual. Typically, click on the `.msi` that you used to
install it and initiate the uninstall process.

MongoDB Installation Steps
^^^^^^^^^^^^^^^^^^^^^^^^^^

First, you will need to install a ``cloudmesh.yaml`` file, if you have not
done this before. If you do have mongo, you can safe this step. However,
make sure you do not expose mongo on the internet so that you keep your
information in mongo private. The easiest way to install mongo is with our
build in install script. You will need to set first permission to use this
install.  To do so start with the command

.. code:: bash

   cms help

Now you will need to edit the configuration file

.. code:: bash

    emacs ~/.cloudmesh/cloudmesh.yaml

and change the password of the mongo entry to something you like, e.g. change
the TBD to a real strong password::

   MONGO_PASSWORD: TBD

In case you do not have mongod installed, you can do so for macOS and Ubuntu
18.xx by setting the following variable::

   MONGO_AUTOINSTALL: True

Now you can run the ``admin mongo install`` command. It will not only install
mongo, but also add the path to your ``.bash_*`` file. In case
of windows platform, you will have to set the PATH variable manually. To
install it simply say.

Alternatively you can set these values form the command line without using an
editor with

.. code:: bash

    cms config set cloudmesh.data.mongo.MONGO_AUTOINSTALL=True
    cms config set cloudmesh.data.mongo.MONGO_PASSWORD=YOURPASSWORD

Make sure to set a good strong password for Mongo that you can remember

Now you can install mongo conveniently from cloudmesh if you have not
installed it. On macOS and ubuntu it will install it under::

    ~/local/mongo/bin.

Please make sure that this path is added to your PATH variable after the
install is complete. If you like to change that path you can do it in the yaml
file.

Next we need to install mongo with

.. code:: bash

   cms admin mongo install

As we password protect mongo, you will need to first run the command

.. code:: bash

    cms admin mongo create

Now you can start mongo for cloudmesh with

.. code:: bash

   cms admin mongo start

In case you need to stop it you can use the command

.. code:: bash

   cms admin mongo stop

Please remember that for cloudmesh to work properly you need to start
mongo. In case you need a different port you can configure that in the yaml
file.

Prerequisites for ssh key
-------------------------

In order for you to use cloudmesh you will need an ssh key. This can be
created from the command line with

.. code:: bash

    ssh-keygen

Please make sure to use a passphrase with your key. Anyone telling you to use
a passwordless key is giving you a wrong advice.

Next you want to add a keyname that you use in your clouds to the cloudmesh
yaml file. You can do this by completing the profile or form the command line
with:

.. code:: bash

    cms config set cloudmesh.profile.user=YOURUSERNAME
    cms set key user=YOURUSERNAME

The `cms init` includes this automatically.
