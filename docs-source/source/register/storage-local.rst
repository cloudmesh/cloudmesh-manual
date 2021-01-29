register list sample --service=storage --kind=local

Configuration for Cloud=local Service=storage
---------------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      storage:
        {name}:
          cm:
            active: false
            heading: Storage A
            host: localhost
            label: local
            kind: local
            version: TBD
            service: storage
          default:
            directory: ~/a
          credentials:
            name: TBD
            key: ~/.ssh/id_rsa.pub

To register this service the following parameter ned to be defined::

    name


