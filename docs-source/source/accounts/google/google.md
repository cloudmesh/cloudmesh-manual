# Google Account

A new google account can be created using following information:

* [New Google Account Introduction](https://myaccount.google.com/intro)
* [Create your Google Account](https://accounts.google.com/signup/v2/webcreateaccount?service=cloudconsole&continue=https%3A%2F%2Fcloud.google.com%2Fstorage%2F%3Frefresh%3D1&gmb=exp&biz=false&flowName=GlifWebSignIn&flowEntry=SignUp&nogm=true)
 
Additional reference link for account creation support page:
  
* [Create a Google Account- Google Account Help](<https://support.google.com/accounts/answer/27441>)

## Instaltion of Cloudmesh Google Providers

To install the cloudmesh google providers you can simply use (not yet supported):

```bash
$ pip install cloudmesh-google
```

For developers the best way to install it is to use `cloudmesh-installer`. 

```bash
mkdir cm
cd cm
pip install cloudmesh-installer
cloudmesh-installer git clone google
cloudmesh-installer git install google
```

Next you have to cerate a google account and integarte it into a configuration
file called `~/.cloudmesh/cloudmesh.yaml`

## Google Account for using Cloudmesh Storage Service

**TODO Introduction is missing 1 paragraph**


* ***Step 1 - Create Google Cloud Account*** Use the following link provided
by google to create a free google account. (This account can provide
you $300 in credits to use google cloud.)

  [Get Started for Free](https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE)

  After you click this option, you can choose you existing google account or
  create a new account using previously provided information.
  
 

  students also have option to use follwing option:
  
  [Google Cloud Platform | Google for Education](https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none)

  Limitation with for education method: You may need additional approvals and
  professor need to request for choosing this option, refer documentation in
  the mentioned link.
  
  Here is additinal reference link for account creation support page:
  
  [Create a Google Account- Google Account Help](<https://support.google.com/accounts/answer/27441>)



* ***Step 2 - Create Project***  
  Assuming you have created gogle account, go to Google Cloud Console using following link:
  
  [Google Storage - Online Data Storage | Cloud Storage | Google Cloud](<https://console.cloud.google.com/>)
  
   * From here create a new project or select an alredy created project as seen in the next three screenshots:
   
   ![Create first account_01](images/MyFirstAccount_01.png)
   ![Create first account_02](images/MyFirstAccount_02.png)
   ![Create first account_03](images/MyFirstAccount_03.png)
   
   After project is created, create a service account.
  * Note: There are many methods for authentication while working on google cloud. 
  For our needs we need service account authentication. 
  Here is the reference link for google authentication methods and comparision :
  
  [Authentication Overview | Authentication | Google Cloud](https://cloud.google.com/docs/authentication/)
  
* ***Step 3 - Create Service Account*** Select the newly created
project and go to IAM & Admin -> Service Accounts -> Create service
account to create a new service account. Select “Furnish a new private
key” to create and download new private key you will use to
authenticate. Opt for the new preferred JSON format, download the file
and save it to a secure location (e.g. ~/.cloudmesh). For google cloud storage 
this file will be used to update Yaml entry in ~/.cloudmesh/cloudmesh.yaml.
Also for gdrive storage option JSON file is referenced in the
cloudmesh4.yaml in parameter "path_to_json_file"

* Alternatively you can do this as follows:

   * Go to [create service account page](https://cloud.google.com/docs/authentication/production)
   
   ![Create service account_01](images/CreateServiceAccount_01.png)

   * Go to section :Creating a service account 
   
  Following is the direct link to generate credentials from google :
  
    [Create Service Account Key](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
    
    ![Create service key](images/CreateServiceKey_01.png)

      Sample files:
       `client_secret.json` 
       `google-drive-credentials.json`

* ***Step4 - Yaml entry for google storage Account*** 

* After you downlod the credentials in json format rename the same as
  `google.json` and move it to `~/.cloudmesh` directory.

* Run follwing cloudmesh command, for the first time and every time your
  credentials are modified :

```
cms google yaml add ~/.cloudmesh/google.json --service=google
```

* Once this command is successfully executed you can validate the entry in yaml file.
 Here is the sample yaml file entry for google storage :

  ```
   google:
      cm:
        name: google
        active: 'true'
        heading: GCP
        host: https://console.cloud.google.com/storage
        kind: google
        version: TBD
        service: storage
      default:
        directory: cloudmesh_gcp
        Location_type: Region
        Location: us - east1  
        Default_storage_class: Standard
        Access_control: Uniform
        Encryption: Google-managed
        Link_URL: https://console.cloud.google.com/storage/browser/cloudmesh_gcp
        Link_for_gsutil: gs://cloudmesh_gcp
      credentials:
        type: service_account
        project_id: imposing-coast-123456
        private_key_id: a1b2c3d4*********
        private_key: '-----BEGIN PRIVATE KEY-----

          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************
          ***********************************************************

          -----END PRIVATE KEY-----

          '
        client_email: user@imposing-coast-123456.iam.gserviceaccount.com
        client_id: '1234567******23456'
        auth_uri: https://accounts.google.com/o/oauth2/auth
        token_uri: https://oauth2.googleapis.com/token
        auth_provider_x509_cert_url: https://www.googleapis.com/oauth2/v1/certs
        client_x509_cert_url: https://www.googleapis.com/robot/v1/metadata/x509/user%40imposing-coast-12345.iam.gserviceaccount.com
   
   ```
* ***Step5 - list or create  google storage bucket and add to config file*** 

List google storage bucket using following command, if bucket exists list will be displayed. 
```
cms google list bucket
```
From the displayed list please pick bucket of your choice and add bucket name to yaml file in the storage section for google provider  `storage > google > default > directory`.

If bucket is not listed use folling command to create new bucket:

```
cms google create bucket --name=NAME --service=google

```
where NAME is new bucket name.
Note: Bucket name needs to be globally unique, you may choose combinantion of your class ID and bucket name. 
`e.g. f19_516_xxx_bucket_name`

### Getting the google json files

* [ ] TODO: Google account. the documentation on how to get the json
  files is missing


* [ ] TODO: Google account. A program that takes the json files and integrates them
  into [cloudmesh.yaml]{.title-ref}

* [ ] TODO: Google account. The documentation for getting access to
  google cloud is incomplete, see related entries.


* `client_secret.json`
* `google-drive-credentials.json`

If we run the Google Drive `Provider.py` for the **First time** then the
required keys, tokens are taken from the `cloudmesh.yaml` file and
creates a `client_secret.json` file in the following path
`~/.cloudmesh/gdrive/`

* [ ] TODO: The Authentication.py program was removed, so this can not work.


The `Authentication.py` creates a `.credentials` folder under the
following path `~/.cloudmesh/gdrive/` if it does not exist and creates a
`google-drive-credentials.json` file under the following folder
`~/.cloudmesh/gdrive/.credentials/`

So, for the **first time** browser will be opened up automatically and
asks for the Google Drive(gmail) credentials i.e., login email and
password. If you provide these 2 then the Authentication step is
completed and then it will create the `google-drive-credentials.json`
and place it in `~/.cloudmesh/gdrive/.credentials/` folder.

## Python Google Drive API

### Step-by-step process

Before writing the Python interface for Google Drive, we need to setup
an email account, with that email account we will get a set of google
services and one of them is Google Drive with 15 GB overall storage.

After that we need to go through the Google Drive Quick start guide:

* <https://developers.google.com/drive/api/v3/quickstart/python>

There we can see Enable API option as shown in the next picture:

![Enable API](images/gdrive/image1.png)

Once we enable that we will get credentials.json file where all of our
credentials are stored that can be used to communicate with our Google
Drive through Python Interface. After that, we will be redirected to a
page where we need to create our own project as shown in the next
picture:

![Create a project](images/gdrive/image2.png)

As we see next we need to select Google Drive API from here

![Add credentials](images/gdrive/image16.png)

After that, we need to obtain the client\_secret file as shown next:
(The file that is downloaded as `client_id.json` needs to be renamed as
`client_secret.json`)

![Rename the file](images/gdrive/image18.png)

After this we need to click `Done` otherwise it would not set the Google
Drive API.

After this if we run Authentication.py we will be redirected to our
default browser to put our our login id and password and after that it
asks to authenticate our credentials. If we allow that as shown next:

![Grant permissions](images/gdrive/image21.png)

We will get the screen something like given next (as the authentication
pipeline has bees completed).

![Authentication success](images/gdrive/image23.png)

.. todo:: Google account. This documentation is a bit unstructured and
   repetitive.  Yet errors such as references to Authentication.py are
   conducted which does not exist.


If the authentication flow is completed then the Authentication.py will
create a `google-drive-credentials.json` file in `.credentials` folder.
This file can be used for future purposes. If we delete this file then
the `Authentication.py` will again ask for login id and password and
again create that file automatically.

So, now with the

* `client_secret.json`,
* `google-drive-credentials.json`

we can now use

* [ ] TODO: Google account. This documentation is a bit unstructured and repetitive.
  Yet errors such as references to Authentication.py are conducted which
  does not exist.

* `Authentication.py` and `Provider.py`

* [ ] TODO: Google account. location of the file is missing

Once all these steps are done correctly, then we can use the Python
program interface to transfer the files between our Python program and
Google Drive.

