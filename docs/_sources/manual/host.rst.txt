host
====

.. parsed-literal::

  Usage:
      host scp NAMES SOURCE DESTINATION [--dryrun]
      host ssh NAMES COMMAND [--dryrun]
      host key list NAMES [--dryrun]
      host key fix FILE [--dryrun]
      host key scp NAMES FILE [--dryrun]


  This command does some useful things.

  Arguments:
      FILE   a file name

  Options:
      --dryrun   shows what would be done but does not execute

  Description:

      host scp NAMES SOURCE DESTINATION


      host ssh NAMES COMMAND

        runs the command on all specified hosts
        Example:
             ssh red[01-10] "uname -a"

      host key list NAMES

        cats all id_rsa.pub keys from all hosts specifed
         Example:
             ssh key red[01-10] cat

      host key fix FILE

        not implemented yet

        copies all keys the file FILE to authorized_keys on all hosts
        but also makes sure the the users ~/.ssh/id_rsa.pub key is in
        the file.

        1) adds ~/.id_ras.pub to the FILE only if its not already in it
        2) removes all duplicated keys

      host key scp NAMES FILE

        not implemented yet

        copies all keys the file FILE to authorized_keys on all hosts
        but also makes sure the the users ~/.ssh/id_rsa.pub key is in
        the file, e.g. it calls fix before upload
