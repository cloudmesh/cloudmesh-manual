multipass
=========

.. parsed-literal::

  Usage:
        multipass list [--output=OUTPUT] [--dryrun]
        multipass images [--output=OUTPUT] [--dryrun]
        multipass start NAMES [--output=OUTPUT] [--dryrun]
        multipass stop NAMES [--output=OUTPUT] [--dryrun]
        multipass delete NAMES [--output=OUTPUT][--dryrun]
        multipass shell NAMES [--dryrun]
        multipass run COMMAND NAMES [--output=OUTPUT] [--dryrun]

  Interface to multipass

  Options:
       --output=OUTPUT  the output format [default: table]

  Arguments:
      NAMES   the names of the virtual machine

  Description:

      cms multipass start host[01-03]

         start multiple vms

      The NAMES can be a parameterized hostname
