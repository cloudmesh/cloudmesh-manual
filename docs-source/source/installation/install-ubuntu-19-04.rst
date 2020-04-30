
Prerequisites for Ubuntu 19.10
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We recommend you swithc to Ubuntu 20.04. However if you can not do this please
follow these steps.

Python 3.8.2 is not yet installed in Ubuntu 19.10. The instalation is simple
and can be conducted with the following steps.

Additionally, Cloudmesh requires OpenSSL and Curl installed in the system.
Please download Python from:

* https://www.python.org/downloads

place the code in a directory and change to that directory. Than say


.. code-block:: bash

   sudo apt -y update
   sudo apt -y install openssl curl
   # sudo apt -y install libreadline-gplv2-dev libncursesw5-dev
   # sudo apt -y libssl-dev
   # sudo apt -y libsqlite3-dev tk-dev
   # sudo apt -y libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
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
