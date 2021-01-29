register list sample --service=compute --kind=aws

Configuration for Cloud=aws Service=cloud
-----------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      cloud:
        {name}:
          cm:
            active: true
            heading: AWS
            host: TBD
            label: {name}
            kind: aws
            version: TBD
            service: compute
          default:
            image: ami-0c929bde1796e1484
            size: t2.medium
            username: ec2-user
          credentials:
            region: {region}
            EC2_SECURITY_GROUP: cloudmesh
            EC2_ACCESS_ID: {EC2_ACCESS_ID}
            EC2_SECRET_KEY: {EC2_SECRET_KEY}
            EC2_PRIVATE_KEY_FILE_PATH: ~/.cloudmesh/aws_cert.pem
            EC2_PRIVATE_KEY_FILE_NAME: aws_cert

To register this service the following parameter ned to be defined::

    EC2_ACCESS_ID
    EC2_SECRET_KEY
    name
    region


