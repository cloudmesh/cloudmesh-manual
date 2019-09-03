# Contributions

This section is highly incomplete as many have contributed to cloudmesh over
the years. Contributors can be located from the different versions and packages in the 

at:

* <https://github.com/cloudmesh>


In Summer 2019 we started to put this section into it to make sure we do not
forget contributions and to allow better communication to others what was
achieved by the individual contributors. In future we may change this to
topical sections here we focus on the technology. 

* Gregor von Laszewski

* Fugang Wang

## Summer 2019

* Vafa Andalibi

   * Implemented atuomated aws registration in browser, i.e. `cms register aws yaml` command, tested successfully on Linux, MacOS and Windows. 

   * Implemented `image()` and `images()` for aws provider

   * Implemented `@DatabaseImportAsJson` decorator to import data to database using `mongoimport` which significantly improved the bulk database import, e.g. in `cms image list --cloud=aws --refresh` the import time was improved from roughly 1 hour to 20 seconds. 

   * Fixing `key upload/delete` for aws provider

   * Implemented `ssh()` for aws provider, as well as testing/debugging it on  `cms ssh` and `cms vm ssh`, addressing [#224](https://github.com/cloudmesh/cloudmesh-cloud/issues/224)

   * Re-implemented `set_server_metadata()` and `get_server_metadata()` (collaboration with Prof. von Laszewski) for aws provider

   * Several patches on `create()` method for aws provider, i.e. key assignment, metadata set/get and  returned `dict` to be saved in the database 

   * Fixes on `update_dict()` for `key` and `image`

   * Implementing `find_all_by_name()` for mongodb

   * Added patches to improve database utilization, used in `cms start/stop` and other commands  addressing [#222](https://github.com/cloudmesh/cloudmesh-cloud/issues/222), [#223](https://github.com/cloudmesh/cloudmesh-cloud/issues/223) and [#225](https://github.com/cloudmesh/cloudmesh-cloud/issues/225)

   * Implemented `run2()` in `Shell` in `Common3` to address the file-system redirection issue on windows when running subprocesses using python 

   * Updated `output` dict for `image` and `vm` on aws provider

     


* Sriman ?Lastname

  Write what you have done

* Saurabh ?Lastname

  Write what you have done

* Alex Axthelm

  Write what you have done

* Joaquin Avila Eggleton

  Write what you have done

* Moeen Arshad

