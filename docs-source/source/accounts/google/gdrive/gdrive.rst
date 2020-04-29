Google Drive is a file storing platform where an user can store all his/her files in the google drive. 
Here files can be of any form ranging from documents to audio, video or image files. In free account 
each user will be given around 15 GB of free data space to be stored. We can create folders and subfolders in the Google Drive 
to store our data.

Each file will be stored in Google cloud with a unique URL and it’s up to the user to make the file sharable or not. 
Google Drive is reliable and if an user has different devices and if he/she wants to access those files 
then Google Drive is needed in this case as he can have access to his file as all his files are stored in the cloud. 
The user does not need to install any kind of software in order to view these files.

Python Google Drive API
-----------------------

Step-by-step process
~~~~~~~~~~~~~~~~~~~~

Before writing the Python interface for Google Drive, we need to setup
an email account, with that email account we will get a set of google
services and one of them is Google Drive with 15 GB overall storage.

After that we need to go through the Google Drive Quick start guide:

-  https://developers.google.com/drive/api/v3/quickstart/python

Enable API

There we can see Enable API option as shown in the next picture:

.. figure:: images/image1.png
   :alt: Enable API

Once we enable that we will get credentials.json file where all of our
credentials are stored that can be used to communicate with our Google
Drive through Python Interface. 

Create a project

We will be redirected to a
page where we need to create our own project as shown in the next
picture:

.. figure:: images/image2.png
   :alt: Create a project

Add credentials

As we see next we need to select Google Drive API from here

.. figure:: images/image16.png
   :alt: Add credentials

After that, we need to obtain the file that stores client_id and client_secret as shown next: (The
file that is downloaded as ``client_id.json`` needs to be renamed as
``credentials.json``)

.. figure:: images/image18.png
   :alt: Rename the file

After this we need to click ``Done`` otherwise it would not complete the enabling of the
Google Drive API.

In order to create the authorization flow, we also need to modify cloudmesh.yaml to store the paths of the files needed
for authentication, including path for "credentials.json" and path for "token.pickle", which we will create next.  
Depending on our project, and cloud we are using, e.g. if project is cloudmesh-storage, cloud 
is parallelgdrive, assuming we put "credentials.json" and "token.pickle" in C:/Users/sara/cm, these are the keys and 
values to put in the "credentials" section::

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
        credentials_json_path: C:/Users/sara/cm
        token_path: C:/Users/sara/cm

Now we are ready to create the authorization flow.  The codes for creating credentials for authorization is included 
in the Provider.py file. Here is the link: 
<https://github.com/cloudmesh/cloudmesh-storage/blob/master/cloudmesh/storage/provider/parallelgdrive/Provider.py>

When we run the Provider.py for the first time, we will be redirected to the
default browser to put our login id and password and after that it
asks to authenticate our credentials. If we allow that as shown next:

.. figure:: images/image21.png
   :alt: Grant permissions

   Grant permissions

We will get the screen something like given next (as the authentication
pipeline has bees completed).

.. figure:: images/image23.png
   :alt: Authentication success

   Authentication success

If the authentication flow is completed then it will
create a ``token.pickle`` file in our working directory on our computer. We need to place this file in the token_path
specified in the cloudmesh.yaml file, in this example it is C:/Users/sara/cm directory.
This file can be used for future purposes so we do not need to login everytime. If we delete this file for any reason, 
e.g. changing the permission scope, then the authorization process will again ask for login id and
password and again create ``token.pickle`` automatically.

Once all these steps are done correctly, we can use the Python
program interface to transfer the files between our Python program and
Google Drive.
