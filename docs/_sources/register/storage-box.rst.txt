register list sample --service=storage --kind=box

Configuration for Cloud=box Service=storage
-------------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      box:
        cm:
          active: false
          heading: Box
          host: box.com
          label: box
          kind: box
          version: TBD
          service: storage
        default:
          directory: /
        credentials:
          config_path: ~/.cloudmesh/box/{config}

To register this service the following parameter ned to be defined::

    config


