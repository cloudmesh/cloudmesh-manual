register list sample --service=compute --kind=google

Configuration for Cloud=google Service=cloud
--------------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      cloud:
        {name}:
          cm:
            active: true
            heading: {name}
            host: https://console.cloud.google.com/compute/instances?project={project_id}
            label: {name}
            kind: google
            version: v1
            service: compute
          default:
            image: ubuntu-1910
            image_project: ubuntu-os-cloud
            project_name: cloudmesh
            storage_bucket: cloudmesh-bucket
            zone: us-central1-a
            region: us-central1
            flavor: g1-small
            size: 10
            resource_group: cloudmesh-group
            network: global/networks/default
          credentials:
            type: {type}
            auth:
                json_file: {filename}
                project_id: {project_id}
                client_email: {client_email}

To register this service the following parameter ned to be defined::

    client_email
    filename
    name
    project_id
    type


