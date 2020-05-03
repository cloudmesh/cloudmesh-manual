************
Google Drive
************

Google Drive is a file storing platform where an user can store all
his/her files in the google drive.  Here files can be of any form
ranging from documents to audio, video or image files. In free account
each user will be given around 15 GB of free data space to be
stored. We can create folders and subfolders in the Google Drive to
store our data.

Each file will be stored in Google cloud with a unique URL and it’s up
to the user to make the file sharable or not.  Google Drive is
reliable and if an user has different devices and if he/she wants to
access those files then Google Drive is needed in this case as he can
have access to his file as all his files are stored in the cloud.  The
user does not need to install any kind of software in order to view
these files.

Set up Credentials
##################

Go to `Google APIs <https://console.developers.google.com/>`_ website.  

Create a project
****************
To create a project, go to Dashboard in Google APIs console. In the **Select a Project** window, click **NEW PROJECT**.

.. TODO:: upload new images

.. figure:: images/image1.png
   :alt: Enable API

Enter a project name we want to use.  Click **CREATE**.

.. TODO:: upload new images

Enable APIs and Services
************************
In the APIs & Services Dashboard for the project we created, click **ENABLE APIS AND SERVICES**.

.. TODO:: upload new images

This leads to the **Welcome to the API Library** page.  

.. TODO:: upload new images

Search for "google drive api".

.. TODO:: upload new images

Click **ENABLE**.

.. TODO:: upload new images


Create Credentials
******************
At the Google Drive API Overview page, click **CREATE CREDENTIALS**.

.. TODO:: upload new images

Select the credentials you need.  Click **What credentials do I need?**.

.. TODO:: upload new images

At the **Set up OAuth consent screen**, click **SET UP CONSENT SCREEN**.

.. TODO:: upload new images

Select **External** user type.  Click **CREATE**.

.. TODO:: upload new images

Enter application name.  Enter the gmail account we use for the project.

.. TODO:: upload new images

Select scopes to **See, edit, create, and delete all of your Google Drive files**, and **See and download all your Google Drive files**.
Click **ADD**.

.. TODO:: upload new images

Click **Save**.

.. TODO:: upload new images

At the APIs & Services Credentials page, click **CREATE CREDENTIALS**, select **OAUTH client ID**.

.. TODO:: upload new images

Select **Other** for application type.  A default name "Other client 1" will be generated which we can keep.

.. TODO:: upload new images

This leads to **OAuth client created** screen.  Click **OK**.

.. TODO:: upload new images

Click the download button to download the credential file.

.. TODO:: upload new images

The default name of the file is something like "client_secret_xxxxxxxxxxxxxxxxxxxxxxxxxxpg2.apps.googleusercontent.com.json".
Rename it to "credentials.json", and place it in the directory specified in cloudmesh.yaml for key "credentials_json_path".

Authorization Flow
******************

In order to create the authorization flow, we also need to modify cloudmesh.yaml to store the paths of the files needed for
authentication, including path for `credentials.json` and path for `token.pickle`, which we will create next.  
Depending on our project, and cloud we are using, e.g. if project is cloudmesh-storage, cloud is
parallelgdrive, assuming we put `credentials.json` and `token.pickle`
in

.. todo:: this is absolutely wrong. a) no hardcoded path. it must go
          in ~/.cloudmesh, is there a programming bug related to this?

::
   
   C:/Users/sara/cm


these are the keys and values to put in the `credentials` section::

    parallelgdrive:
      cm:
        active: false
        heading: GDrive
        host: dgrive.google.com
        label: parallelgdrive
        kind: parallelgdrive
        version: TBD
        service: storage
      default:
        directory: TBD
      credentials:
        credentials_json_path: [put the path of credential.json here]
        token_path: [put the path of token.pickle here]

Now we are ready to create the authorization flow.  The codes for creating credentials for authorization is included 
in the Provider.py file. Here is the link:

.. todo:: read up on how to do links in rst (Sara updated)

`Provider.py <https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/parallelgdrive/Provider.py/>`_  

When we run the Provider.py for the first time, do so in the Terminal.

.. TODO:: upload new images

We will be redirected to the Sign in page.  Choose the Google account to continue to the project.

.. TODO:: upload new images

Click **Advanced**.

.. TODO:: upload new images

Click **Go to [your project name]**.

.. TODO:: upload new images

In the Grant permission page, click **Allow**.

.. TODO:: upload new images

Click **Allow** again to confirm.

.. TODO:: upload new images

Message will display that the authentication flow has been completed.

.. TODO:: upload new images

When the authentication flow complete, it will create a ``token.pickle`` file in our working directory on our computer. 
We need to place this file in the token_path specified in the `cloudmesh.yaml` file.

.. todo:: no hardcoded path, no one has access to your file. This
          location is absolutely wrong it must be in
          `~/.cloudmesh.yaml` (Sara updated)

This file can be used for future purposes so we do not need to login everytime. If we delete this file for any reason,
e.g. changing the permission scope, then the authorization process will again ask for login id and password, and again create
``token.pickle`` automatically.
