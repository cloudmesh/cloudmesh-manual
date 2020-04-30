Prerequisites for macOS
=======================

.. mermaid::

   graph TD
      A(Prerequits) --> python(Python 3.7 or 3.8)
      python --> venv(venv)
      venv --> pip(pip >20.0)
      key --> install
      A --> xcode(X code)
      xcode --> keygen(ssh keygen)
      keygen -->key[fa:fa-key Key]
      install --> I(pip install cloudmesh-openstack)
      I --> cms(cms help)

     click Xcode "https://cloudmesh.github.io/cloudmesh-manual/installation/install-macos.html#xcode"


Xcode
-----

You want a number of useful tools on your macOS. They are not installed by
default, but are available via Xcode. First you need to install xcode from

* https://apps.apple.com/us/app/xcode/id497799835

You need to install macOS xcode command line tools

.. code-block:: bash

   xcode-select --install

Next you want to install a python version. You can either chose the installation
from python.org or from homebrew.


Python
------

.. todo:: tbd, already described elsewhere

Key
---

.. todo:: tbd, already described elsewhere


