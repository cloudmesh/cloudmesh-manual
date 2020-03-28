from __future__ import print_function
from cloudmesh.shell.command import command
from cloudmesh.shell.command import PluginCommand
from cloudmesh.common.console import Console
from cloudmesh.common.util import path_expand
from cloudmesh.common.util import banner
from pprint import pprint
from cloudmesh.common.debug import VERBOSE
from glob import glob
import os
from cloudmesh.common.Printer import Printer

class BookCommand(PluginCommand):

    # noinspection PyUnusedLocal
    @command
    def do_book(self, args, arguments):
        """
        ::

          Usage:
            book proceedings
            book lecture
            book cloud
            book pi
            book python
            book list [--dir=DIR]
            book make BOOK TARGET
            book view BOOK [-o]

          Command to view the books. This command must be executed in
          the cm directory.

          Arguments:
            BOOK   The name of the book

          Options:
            -o         open the location to find the online source
            --dir=DIR  The directory where the different bok dirs are
                       located.
                       [default: book/books]


        """

        VERBOSE(arguments)

        directory = arguments["--dir"]
        book = arguments["BOOK"]
        target = arguments["TARGET"]

        def list():
            found = {}
            books = glob(directory + "/**/*.yaml")
            for book in books:
                name = os.path.basename((book)).replace(".yaml", "")
                dirname = os.path.dirname((book)).split("/")[-1]
                found[name] = {
                    'name': name,
                    'dir': dirname,
                    'path': book
                }
            return found

        def make(book, target=""):
            books = list()
            _directory = os.path.dirname(books[book]["path"])
            if not os.path.isfile(f"{_directory}/Makeile"):
                Console.error("Makefile not found")
                return ""
            command = f"cd {_directory}; make {target}"
            banner(command)
            os.system(command)

        if arguments.list:

            books = glob(directory + "/**/*.yaml")
            books = list()
            print(Printer.write(books, order=['name', 'dir']))

        elif arguments.make:
            make (book, target)

        elif arguments.pi:
            make("pi")

        elif arguments.python:
            make("python")

        elif arguments.cloud:
            make("cloud")

        elif arguments.proceedings:
            make("e516-sp20-proceedings", "proceedings")

        elif arguments.lecture:
            make("e516-sp20-proceedings")

        return ""
