host
====

.. parsed-literal::

  Usage:
      host scp NAMES SOURCE DESTINATION [--dryrun]
      host ssh NAMES COMMAND [--dryrun]
      host key create NAMES [--dryrun]
      host key list NAMES [--dryrun]
      host key fix FILE [--dryrun]
      host key scp NAMES FILE [--dryrun]
      host key gather NAMES [FILE]
      host key scatter NAMES [FILE]
      host key generate NAMES

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

      host key create NAMES
        create a ~/.ssh/id_rsa and id_rsa.pub on all hosts specified
        Example:
            ssh key create red[01-10]

      host key list NAMES

        cats all id_rsa.pub keys from all hosts specifed
         Example:
             ssh key list red[01-10]

      host key fix FILE

        copies all keys from file FILE to authorized_keys on all hosts,
        but also makes sure that the users ~/.ssh/id_rsa.pub key is in
        the file.

        1) adds ~/.id_rsa.pub to the FILE only if its not already in it
        2) removes all duplicated keys

        Example:
            ssh key list red[01-10] > pubkeys.txt
            ssh key fix pubkeys.txt

      host key scp NAMES FILE

        copies all keys from file FILE to authorized_keys on all hosts
        but also makes sure that the users ~/.ssh/id_rsa.pub key is in
        the file and removes duplicates, e.g. it calls fix before upload

        Example:
            ssh key list red[01-10] > pubkeys.txt
            ssh key scp red[01-10] pubkeys.txt
