man
===

.. parsed-literal::

    Usage:
        man readme [-p] --toc [--file=FILE]
        man readme [-p] [--tag=TAG] [--file=FILE] --include=INCLUDE
        man readme [-p] [--tag=TAG] [--file=FILE] --command=COMMAND
        man [--dir=DIR] [--format=FORMAT] [--noheader]
        man COMMANDS... [--dir=DIR] [--format=FORMAT]

    Options:
        --toc        adds a table of content between the TOC tag
        -p           replacement in the file instead of stdout
        --noheader   no rst header
        --tag=TAG    the tag used to embed the manual
                     page [default: MANUAL]
        --file=FILE  the file for the replacement between the
                     tags [default: README.md]

    Arguments:
        COMMANDS   the command manual pages to be printed

    Description:
        man
            Prints out the help pages
        man COMMAND
            Prints out the help page for a specific command
