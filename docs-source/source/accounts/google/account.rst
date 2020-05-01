Google Account
==============

Prerequisits
------------

We assume you have the cloudmesh google provider installed. This can be
done with

.. code:: bash

   $ pip install cloudmesh-google

For developers the best way to install it is to use
``cloudmesh-installer``.

.. code:: bash

   $ mkdir cm
   $ cd cm
   $ pip install cloudmesh-installer
   $ cloudmesh-installer get google

Creating the Google account
---------------------------

A new google account can be created by following the information provided by
Google:

-  `Create your Google
   Account <https://accounts.google.com/signup/v2/webcreateaccount>`__

Activation Google Storage Service
---------------------------------

.. todo:: it is not clear for which cloudmesh service this is used if at all.

Google offers  you $300 in credits to use the google storage cloud service.
To apply for it you can use either of the follwoing links:

-  `Get Started for
   Free <https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE>`__
-  `Google Cloud Platform \| Google for
   Education <https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none>`__

Please chose the one that is most appropriate for you. For the
eductaional account you may need a verifiaction from your school or an
email that is registered as an educational insititution.

Create a Project
^^^^^^^^^^^^^^^^

Next, you will need to create a Google project. We recommend that you
simply use the name ``cloudmesh``. You can create such a project at
json
-  `Google Storage - Online Data Storage \| Cloud Storage \| Google
   Cloud <https://console.cloud.google.com/>`__

The three screenshots show the workflow on how to create a project:


Create a Service Account
^^^^^^^^^^^^^^^^^^^^^^^^


.. list-table:: Google account creation steps
   :widths: 10 40 50
   :header-rows: 1

   * - Step
     - Description
     - Screenshot
   * - 1
     - `Create a Service Account <https://console.cloud.google.com/apis/credentials/serviceaccountkey?project=cloudmesh-class&folder&organizationId>`__
     - |google-account-1|
   * - 2
     - `Select a project <https://cloud.google.com/docs/authentication/production>`__
     - |google-account-2|
   * - 3
     - `Create Service Account Key <https://console.cloud.google.com/apis/credentials/serviceaccountkey>`__
     - |google-account-3|


Next, download the key file `client_secret.json` and
`google-drive-credentials.json` To create and download new private key you will use to authenticate.
Select the JSON format and download the file and save it to ``~/.cloudmesh``

Make sure you keep the .cloudmesh directory  secure. This file will be used to
update the YAML entry in the file

``$ ~/.cloudmesh/cloudmesh.yaml``

As you may use also other clouds we recommend you rename the file to
``google.json`` when you save it, so it is clear to which cloud the json
file belongs.

If your yaml file doe snot yet have a configuartion for the Google service

.. todo:: which one exactly is unclear
pleas use the command::

   $ cms register google google.json

.. todo:: has this been implemented?

Update Cloudmesh with the Google Storage Account Information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. todo:: Now we have two commands. is the config command also working?

::

   $ cms google config add ~/.cloudmesh/google.json --service=google 

MOVE THE CONTENT FROM HERE INTO CONFIGURATION SECTION …

More details of the configuration can v=be looked up in the `Cloudmesh
Configuration Section <MISSING>`__


.. todo:: THE COMMANDS HAVE TO BE REVISITED

    ::

       $ cms google list # what does thsi do?

    THIS NEEDS TO BE RENAMED TO

    ::

       $ cms google config list  # logical
       $ cms google yaml list storage # somewhat logical

Using the Google Storage Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If a Google storage bucket is already created, you can list google storage
bucket using following command::

   $ cms google list

From the displayed list please pick bucket of your choice and add bucket
name to yaml file in the storage section for google provider

``storage > google > default > directory``.

If bucket doesnot exist use folling command to create new bucket:

::

   $ cms google create bucket --name=NAME --service=google

NAME: is new bucket name. Important note: Bucket name needs to be
globally unique, you may choose combinantion of your class ID and bucket
name. ``e.g. f19_516_xxx_bucket_name``

You are all set with account setup.


Links
-----

-  `New Google Account
   Introduction <https://myaccount.google.com/intro>`__
-  `Create a Google Account- Google Account
   Help <https://support.google.com/accounts/answer/27441>`__
-  `Authentication Overview \| Authentication \| Google
   Cloud <https://cloud.google.com/docs/authentication/>`__

.. |google-account-1| thumbnail:: images/MyAccount_01.png
.. |google-account-2| thumbnail:: images/MyAccount_02.png
.. |google-account-3| thumbnail:: images/CreateKey_01.png

.. todo:: it is unclear which images are korret and whic are not.
          We nee dto remove the old images so there is no confusion
