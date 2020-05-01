Prerequisites for Linux
^^^^^^^^^^^^^^^^^^^^^^^

You want a number of useful tools on your macOS. They are not installed by
default, but are available via Xcode. First you need to install xcode from

* https://apps.apple.com/us/app/xcode/id497799835

Next you want to install a python version. You can either chose the installation
from python.org or from homebrew.


.. mermaid::

   graph TD
      A(Prerequits) --> python(Python 3.7 or 3.8)
      python --> pip(pip >20.0)
      pip --> venv(venv)
      venv --> install
      key --> install
      xcode --> keygen(ssh keygen)
      keygen -->key[fa:fa-key Key]
      install --> I(pip install cloudmesh-openstack)
      I --> cms(cms help)


If you have an older version of Ubuntu please follow the instructions for

* :doc:`Ubuntu 19.10 <../installation/install-ubuntu-19.10>`
* :doc:`Ubuntu 18.04 <../installation/install-ubuntu-18-04>`
