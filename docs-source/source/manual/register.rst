register
========

.. parsed-literal::

  Usage:
      register aws yaml
      register aws [FILENAME] [--keep]
      register azure [FILENAME] [--keep]
      register google [FILENAME] [--keep]
      register chameleon [FILENAME] [--keep]


  This command adds the registration information the th cloudmesh
  yaml file. The permissions of theFILENAME will also be changed.
  A y/n question will be asked if the files with the filename should
  be deleted after integration

  Arguments:
      FILENAME   a filename in which the cloud credentials are stored

  Options:
      --keep    keeps the file with the filename.

  Description:

    AWS

        AWS dependent on how you downloaded the credentials will either
        use the filename `credentials.csv` or `accessKey.csv`

        Our command is smart provides some convenience functionality.


        1. If either file is found in ~/Downloads, it is moved to
           ~/.cloudmesh and the permissions are changed
        2. If such a file already exists there it will ask if it should
           be overwritten in case the content is not the same
        3. The content of the file will be read to determine if it is
           likely to be an AWS credential
        4. The credential will be added to the cloudmesh yaml file

    Azure

        Prerequisites for Azure assume you have Azure CLI installed and an Azure
        account created. This command leverages the Azure CLI to extract
        specific account parameters and update the cloudmesh.yaml configuration
        file.


        1. When this command is run, the 'az login' Azure CLI command is executed,
           prompting you to login to your azure account via your default browser,
           which should then redirect you back to your CLI.
        2. The azure cli command for 'az account show' is then referenced to pull
           the account's subscription id and tenant id.
        3. Next, the following azure cli command is run, 'az ad sp create-for-rbac --name http://cloudmesh',
           which is then used to reference the application id and secret key.
           NOTE: If there is already a secret key reference in the cloudmesh.yaml file,
           it will be rendered useless once the new secret key is obtained; requiring you
           to ensure the key has been successfully applied in the next step to the configuration file
           and cms init is called.
        4. Lastly, the credentials will be added to the cloudmesh yaml configuration file.

    Google

        Is not yet implemented

    Chameleon Cloud

        is not yet implemented
