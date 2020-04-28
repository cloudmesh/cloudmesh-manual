FAQ for Windows
===============

Videos
------

Showcase the complete install of CMS in a video assumong you have done
the prerequisits as discussed later

-  https://iu.zoom.us/rec/share/yuZcE_Lg2DlLSKOd7hmEXaALRrbHaaa80yVK-aAOn0iCwnrZnokx6Rxwl91bIWqy
-  https://iu.zoom.us/rec/share/tJZUK5DJ_2BOa5WWwRzQd758Qav4aaa823NPqPcOy06Vcf-xaVmuyG3Bnq70OujX

Other:

-  https://www.youtube.com/watch?v=5GpwfSjM9Lg

-  Please Note that this video discusses cloudmesh-windows starting at
   around 23 minutes. However since then it was generalized and allows
   to be run on other OSes. To reflect this change it was renamed from
   cloudmesh-windows to cloudmesh-test. The command is now called

   ::

      $cms test

   as already documented elsewhere.

CMS restrictions
----------------

Command that do not work on Windows
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

   cms admin mongo install

Instead you need to install Mongo form the MSI. but not select the
service mode

Prerequisits
------------

All of the following commands must return a valid path. If not install
them

::

   where cls
   where mongod
   where ssh
   where ssh-keygen

You must use Python 3.8.2, 64 bit

::

   python --version

Now type in

::

   python

and see if you find 64 bit

Visual Studio Build Tools
-------------------------

You must have cl installed. For deatiled instruction on how to do this
see

-  https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019

After the install you must add its path to the environment variables. At
time of writing this was

::

   C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.24.28314\bin\Hostx64\x64

This is also extensively discussed in our regular install notes

MongoDB
-------

The instructions for MongoDB are provided at

-  https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/

Please make ssure to switch of all Mongo Services and uninstall all
previous versions of MongoDB. THan please install version 4.2.3.

However there are different ways to install Mongo. We **do not want** to
install Mongo as a service. When going to the doscumentation, you will
see two panels. One MongoDB Service (which we do not want to use) and
one MongoDB. The later containse the proper install instructions
including images.

Which version of Windows do I need to use multipass?
----------------------------------------------------

This is a reminder that you must make sure your OS is up to date. You
must use at least version 1903 or later. Please check the requirements
at their web site

You can use multipass in all version of windows fulfilling this
requirement.

f you use Windows 10 Home you must configure multipass to use
virtualbox.

However, to use hyper V windows 10 must be

-  the 64 bit version. you must check this.
-  be EDU or PRO

See https://multipass.run/

Instructions:

Multipass Installation on Windows Machine Prerequisite Windows 10 Pro or
EDU v1903 or above

multipass Hyper-V instalation on Windows
----------------------------------------

Go to https://multipass.run and download windows installer.

1. Run installer with default settings.
2. Ensure that Virtualization support is enabled in BIOS. If not, enable
   it.
3. Open PowerShell in admin mode by pressing windows+X and selecting
4. Window PowerShell(Admin) Option.
5. Enable Hyper-v Hypervisor by using following command in PowerShell.

::

   $ Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor 

6. Restart machine.
7. After reboot, run command to check multipass installation.

::

   $ multipass launch --name ubuntu-lts 

8. If Successful installation must launch a container.

General Windows Tips
~~~~~~~~~~~~~~~~~~~~

Where do I find the release numbers for Windows?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-  https://docs.microsoft.com/en-us/windows/release-information/

How can I get the EDU Version?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For IU students you follow

-  https://iuware.iu.edu/Windows/Title/2977

Issues with docker on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For anyone using Docker Desktop for Windows and seeing some insane error
with ``cmsd --setup``:

::

   E: Release file for http://... is not valid yet

Restart Docker Desktop. Evidently there’s a bug that causes Docker’s
clock to stop when your host computer sleeps, so the build engine gets
stuck in the past

Usernames in Windows must not have spaces
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you have a spce in your username, simply create a new Windows user
account without spaces.

What to do if windows still does not work for you?
--------------------------------------------------

First of all we have to say the issue is not with cloudmesh but your
computer. We as teacher should not be the system administrator fixing
your OS. Therfor you have several options. Here are just a view:

1. use a virtual machine on your computer (multipass or virtual box)
2. use a virtual machine on chameleon cloud
3. use an ubuntu container and install cloudmesh in the container
4. dual boot into ubuntu

Make sure you do backups.

How to install ssh on Windows
-----------------------------

-  https://winaero.com/blog/enable-openssh-server-windows-10/
-  https://ittutorials.net/microsoft/windows-10/enable-ssh-windows-10-command-prompt/
-  https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse
