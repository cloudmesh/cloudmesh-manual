register list sample --service=storage --kind=parallelazureblob

Configuration for Cloud=parallelazureblob Service=storage
---------------------------------------------------------


.. note:: This Documentation was generated automatically with::

              cms register list sample --service=compute --kind=openstack

           please do not change the manual page, change the code if things to not look ok.


::

    cloudmesh:
      storage:
        {name}:
          cm:
            active: false
            heading: Azure
            host: azure.microsoft.com
            label: azure_blob
            kind: parallelazureblob
            version: TBD
            service: storage
          default:
            resource_group: cloudmesh
            location: Central US
          credentials:
            account_name: {account_name}
            account_key: {account_key}
            container: {container}
            AZURE_TENANT_ID: {azure_tenant_id}
            AZURE_SUBSCRIPTION_ID: {azure_subscription_id}
            AZURE_APPLICATION_ID: {azure_application_id}
            AZURE_SECRET_KEY: {azure_secret_key}
            AZURE_REGION: Central US

To register this service the following parameter ned to be defined::

    account_key
    account_name
    azure_application_id
    azure_secret_key
    azure_subscription_id
    azure_tenant_id
    container
    name


