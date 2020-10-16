Cloudmesh Database
==================

Cloudmesh stores its status in a database so that you can easily
remember which services you used where and have an accurate account of
them. We use as a database mongoDB to store this information. To use
cloudmesh you simply need to create and start the database service.

We install a separate version of mongo in your `~/.cloudmesh` directory. Use the command::

    cms admin mongo install

On windows you need to do this very carefully as there is one installation
box that you need to ignore to make this possible.

First you need to change the password for mongo in the ``cloudmesh.yaml`` file
Now you can create an empty database with

you can initialize it with

.. code:: bash

    cms gui quick
    cms init
