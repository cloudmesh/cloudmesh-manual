

Prerequisites for Windows 10
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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


The easiest installation of Python for cloudmesh is to use the installation from
https://www.python.org/downloads. Please, visit the page and follow the
instructions. After this install you have `python3` available from the
command line.

Pleas use the 64 bit version. By default whne you are not carefull python.org ill point you to the 32 bit version. So please locate it.




On Windows 10 you can install cloudmesh by either using

* a Windows native installation,
* a Linux Subsystem installation,
* a Docker installation,

approach. We recommend that you use the Professional or the
Educational version of Windows, as the Home edition is very limited.
Alternatively, you can also use the docker version of cloudmesh.
We explain the various methods.



Windows native Installation Approach
""""""""""""""""""""""""""""""""""""

* Ensure that Python 3.8.2 (or higher) has been installed. Python 3.8 can be
  installed on Windows 10 using:

  * https://www.python.org/downloads/

  Make sure
  you download the 64 bit version. Unfortunately, the default version is teh 32
  bit version.
* Create a `venv`. See section on prerequisites for venv provides more details.
* Some Python librarier may need to be compiled. In order for you to complete
  your Python instalation you want to install th *VC C++ command line Build Tools*.
  This is mostly needed for cryptography libraries.
  You can find them at:

  * https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019

  Once you run the installer
  you need to check on the choices as shown in the next image.

  .. figure:: images/VSprintscreen.PNG
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: select the commandline (CLI) build tools


* You will also have to add the following path to the PATH variable::

     C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64\

  If you have a newer version, please update the Path accordingly. The next two
  images show screenshots on what you need to change. You will naturally have a
  different username.

  .. figure:: images/EnvironmentVariables.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: add the build tool path to the PATH variable

  .. figure:: images/windowsbuildtoolspath.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: add the build tool path to the PATH variable



Windows Container Approach
""""""""""""""""""""""""""

The user container for cloudmesh shell is called cmsd (cloudmesh shell docker).
It can be installed with pip as follows

.. code-block:: bash

    pip install cloudmesh-cmsd

Please note that in order for you do develop cloudmesh you need to do this
within the container However we do recommend that Windows developer use the
Windows native cloudmesh approach. However regular user will have a very
transparent acces to cloudmesh as most commands ar just passed along to the
container.

The manual page for cmsd is located at :doc:`../cmsd`




Linux Subsystem Installation Approach
"""""""""""""""""""""""""""""""""""""

.. warning:: MongoDB reports that mongo is not yet working on Linux
	         Subsystem. As cloudmesh uses mongo, please do not yet use
	         the Linux Subsystem install.

To activate the Linux Subsystem, please follow the instructions at

* https://docs.microsoft.com/en-us/windows/wsl/install-win10

A suitable distribution would be

* https://www.microsoft.com/en-us/p/ubuntu-1804-lts/9n9tngvndl3q?activetab=pivot:overviewtab

However, as it uses an older version of python, you will be required to update it.


venv Setup on Windows CMD.EXE
"""""""""""""""""""""""""""""

On Windows, you run the following command from your home directory at
`C:\Users\USERNAME`:

.. code-block:: bash

  python -m venv ENV3
  source ENV3\Scripts\activate
  python -m pip install --upgrade pip

Next, create a Windows system variable named `ENV3` and update the
variable value to `C:\Users\USERNAME\ENV3\Scripts\activate`.

.. figure:: images/ENV3variable.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: Setting the ENV3 variable


Then add the `ENV3` variable name to the Path variable.

.. figure:: images/ENV3addedtoPath.png
     :width: 200px
     :align: center
     :height: 100px
     :alt: alternate text
     :figclass: align-center

     Figure: Add the variable to the path


Lastly, to simplify the `venv` activation call, create a new `ENV3.bat`
file under the default directory, and add the following content to the
file.

.. code-block:: bash

  C:\Users\USERNAME\ENV3\Scripts\activate.bat

.. note:: The same can be done in Windows Powershell by creating a `ENV3.ps1` to
          reference the activation command.

**Test the venv activation**

We recommend  that you test the venv activation. In a command prompt, type
`ENV3` while under the home directory; or if the bat file was not created,
simply reference the system variable %ENV3%.

Example using bat file activation:

.. code-block:: bash

   C:\Users\USERNAME> ENV3

   ...

   (ENV3) C:\Users\USERNAME>


Example using Windows environment variable:

.. code-block:: bash

   C:\Users\USERNAME> %ENV3%

   (ENV3) C:\Users\USERNAME>

In both cases you will see the command prompt starting with `(ENV3)`.

**Validate Python and Pip Version in venv**

Check if you have the right version of python and pip installed with

.. code-block:: bash

   python --version
   pip --version

Now you are ready to install cloudmesh.
