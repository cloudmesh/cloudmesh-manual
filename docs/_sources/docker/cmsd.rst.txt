Cloudmesh Container
===================

Cloudmesh is also distributed via a docker container. However as the docker
command line interface is typically complex for users. Hence, we wrapped them
into a convenient command that can be installed with `pip`.


User installation
-----------------

.. warning:: The user installation is not yet working, use the
	     developers installation for now.


.. code:: bash

   $ pip install cloudmesh-cmsd
   $ cmsd help

Now modify the `~/.cloudmesh/cloudmesh.yaml` file as discussed in the
manual elsewhere.

To find the version you can say

.. code:: bash

   cmsd version

In case you need to update please use

.. code:: bash

   cmsd update


Developer installation
----------------------

At this time we have not yet released this on `PyPi` as we currently still
develop its features. However you can install it in a convenient fashion on
your system with (we recommend you use a python `venv` as not to create
side effects on your system).


.. code:: bash

    $ mkdir cm
    $ cd cm
    $ pip install pip -U
    $ pip install cloudmesh-installer -U
    $ cloudmesh-installer git clone docker
    $ cloudmesh-installer git install docker


Now you can use the command

.. code:: bash

    $ cmsd help

The command `cmsd` is supposed to be an in-place replacement of `cms`.

If you like in your shell to rather use cms, you can also set an alias
for `cms` that points to `cmsd`. The reason we did not do this
automatically is that developers may need to have `cmsd` and `cms` on
their systems at the same time.

Note that `cmsd` assumes you use `~/cloudmesh/.cloudmesh.yaml`

Developer installation Update
-----------------------------

If you used this method before an and you need to update it, you can
either do a git pull in the `cloudmesh-cmsd` directory or with

.. code:: bash

    $ cd cm
    $ cloudmesh-installer git pull docker


See Also
--------

MORE INFORMATION WILL BE PLACED HERE SHORTLY

* pointers to the manual
* page and api documentation.





