register list sample --service=storage --kind=awss3

Configuration for Cloud=awss3 Service=storage
---------------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      storage:
        {name}:
          cm:
            active: true
            heading: homedir
            host: aws.com
            label: home-dir
            kind: awss3
            version: latest
            service: storage
          default:
            directory: /
          credentials:
            name: {username}
            bucket: {container_name}
            container: {container_name}
            access_key_id: {aws_access_key_id}
            secret_access_key: {aws_secret_access_key}
            region: {region_name}

To register this service the following parameter ned to be defined::

    aws_access_key_id
    aws_secret_access_key
    container_name
    name
    region_name
    username


