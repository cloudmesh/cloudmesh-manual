register
========

.. parsed-literal::

    Usage:
        register list kind --service=SERVICE
        register list sample --cloud=CLOUD [--service=SERVICE]
        register delete --cloud=CLOUD [--service=SERVICE]
        register update --cloud=CLOUD [--service=SERVICE] [--name=NAME] [--filename=FILENAME] [--keep] [ATTRIBUTES...] [--dryrun]


        This command adds the registration information in the cloudmesh
        yaml file. A FILENAME can be passed along that contains
        credential information downloaded from the cloud. The
        permissions of the FILENAME will also be changed. A y/n question
        will be asked if the file with the FILENAME should be deleted
        after integration. THis helps that all credential information
        could be managed with the cloudmesh.yaml file.

    Arguments:
        FILENAME    a filename in which the cloud credentials are stored
        ATTRIBUTES  Attribute list to replace if json file is not provided.
                    Note: Attributes will override the values from file
                    if both are used.

    Options:
        --keep               keeps the file with the filename.
        --dryrun             option to just display the formatted sample without
                             updating the cloudmesh.yaml file.
        --filename=FILENAME  json filename containing the details to be replaced
        --cloud=CLOUD        cloud provider e.g. aws, google, openstack, oracle etc.
        --service=SERVICE    service type e.g. storage, compute, volume
        --name=NAME          name for the new registration

    Examples:

        cms register google compute --name=west_region                     filename=~/.cloudmesh/google.json project_id=west1                     client_email=example@gmail.com

          In the last example the values for filename, project_id, and
          client_email will be changed to respective values from google
          compute sample. We assume you have downloaded the credentials
          form google and stored it in the file ~/.cloudmesh/google.json
