Prerequisites for Ubuntu 18.04
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
