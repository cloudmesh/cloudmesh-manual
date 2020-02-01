multipass
=========

.. parsed-literal::

  Usage:
        multipass list [--dryrun]
        multipass images [--dryrun]
        multipass start NAMES [--dryrun]
        multipass stop NAMES [--dryrun]
        multipass delete NAMES [--dryrun]
        multipass shell NAMES [--dryrun]
        multipass run COMMAND NAMES [--dryrun]

  Interface to multipass

  Arguments:
      NAMES   the names of the virtual machine

  Description:

      cms multipass start host[01-03]

         start multiple vms

      The NAMES can be a parameterized hostname
