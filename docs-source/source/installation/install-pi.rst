Prerequisites for Raspbian
^^^^^^^^^^^^^^^^^^^^^^^^^^

Setup with curl
---------------

.. todo:: integrate the curl command



.. mermaid::

   graph TD
      Prerequits --> keygen(ssh-keygen fa:fa-key)
      keygen --> curl(curl -Ls http://cloudmesh.github.io/get/pi | sh)
      curl --> I(pip install cloudmesh-openstack)
      I --> cms(cms help)
