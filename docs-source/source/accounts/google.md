# Google Storage Providers

## Google Drive

Google Drive is a file storing platform where an user can store all
his/her files in the google drive. Here files can be of any form
ranging from documents to audio, video or image files. In free account
each user will be given around 15 GB of free data space to be
stored. We can create folders and subfolders in the Google Drive to
store our data.

Each file will be stored in Google cloud with a unique URL and it's up
to the user to make the file sharable or not. Google Drive is reliable
and if an user has different devices and if he/she wants to access
those files then Google Drive is needed in this case as he can have
access to his file as all his files are stored in the cloud. The user
does not need to install any kind of software in order to view these
files.

## Google Docs

Google docs is especially designed for viewing or editing or sharing
the documents like Docs, Sheets, Slides, Forms. No need to install any
software to access or edit these. And google doc can be sharable with
editable option. There is an automatic mechanism to convert Microsoft
documents to Google Docs.

* **Google Docs:** Google docs is a broader term for Google sheets,
  Google slides and Google forms.
* **Google Sheets:** Just like Microsoft excel sheet Google sheets has
  almost all of the functionality. Google sheets can be shared with
  other people and can concurrently work on it and can edit it. We can
  change the font size, type as we want. We can use the formulas to
  calculate some mathematical expressions. This can be readily
  transformed to `.csv` or `.xlsx` format.
* **Google Slides:** Just like Microsoft PowerPoint presentation,
  Google has Googleslides. We can do small animations,
  transformations of slides. This can be shared with other people to
  edit this on real time basis.
  We can change the font size, type of these as we want.
* **Google Forms:** Out of all Google docs this is the most powerful
  tool when anyone wants to collect data from other people. One can
  make a Google form and can share it via the link. The one who opens
  this link will see a form to fill. We can add many different types
  of survey questions with multiple choice or Multiple options, or
  text entries or date entries or choose from a list entry. This
  google forms can be used to conduct surveys within a close group
  like teachers, students or employees.

In a broader sense Google docs is just a subset of Google Drive.


## [Google Cloud Platform](https://cloud.google.com/)

Google Cloud Platform (GCP), offered by Google, is a suite of cloud
computing services that runs on the same infrastructure that Google
uses internally for its end-user products, such as Google Search and
YouTube. Alongside a set of management tools, it provides a series of
modular cloud services including computing, data storage, data
analytics and machine learning. Within cloudmesh, we develop services
through taht support some of these these
products.

### [Google Compute Engine](https://cloud.google.com/products/compute/)

Google Compute Engine delivers virtual machines running in
Google's innovative data centers and worldwide fiber network. Compute
Engine's tooling and workflow support enable scaling from single
instances to global, load-balanced cloud computing. Compute Engine's
VMs boot quickly, come with high-performance persistent and local disk
options, and deliver consistent performance. Our virtual servers are
available in many configurations, including predefined sizes, and
options to create Custom Machine Types optimized for your specific
needs. Flexible pricing and automatic sustained use discounts make
Compute Engine the leader in price/performance.

Next we provide a a step-by-step guide on how to create an Google account
and a service account through the Google webpage.

### [Google Cloud Storage](<https://cloud.google.com/products/storage/>)

Google cloud platform provides varity of storage products which are simple, reliable, and secure solutions for your media, analytics, and application data. Cloudmesh services(cms) provides command line cloud to cloud storage and transfer servicies for google cloud storage part of cloudmesh-google storage application. At this time it supports google cloud platform "object or blob storage". Various available operations using cms are put(file upload), get(file downlod), list, delete object/blob, create directory.

<B>Following are avalable google cloud storage products :<B>

#### 1. OBJECT OR BLOB STORAGE [Storage Type: Cloud Storage](https://cloud.google.com/storage/) 
#### 2. BLOCK STORAGE [Storage Type: Persistent Disk](https://cloud.google.com/persistent-disk/)
#### 3. ARCHIVAL STORAGE [Storage Type: Cloud Storage](https://cloud.google.com/storage/)
#### 4. FILE STORAGE [Storage Type: Cloud Filestore](https://cloud.google.com/filestore/)
#### 5. MOBILE APPLICATION [Storage Type: Cloud Storage for Firebase](https://firebase.google.com/products/storage/)
#### 6. DATA TRANSFER [Storage Type: Data Transfer Services](https://cloud.google.com/products/data-transfer/)
#### 7. COLLABORATION [Storage Type: Drive enterprise](https://cloud.google.com/drive-enterprise/)

You can refer [google storage documentation](https://cloud.google.com/storage/docs/) for more details on google cloud storage documentation.
Cloudmesh currently supports [object/blob storage](https://cloud.google.com/storage/docs/how-to) in beta version. Users can follow instruction to configure google could platform described as part of this document.

### Step-by-Step Guide to create Google Cloud account

* ***Step 1 - Create Google Account*** Use the following link provided
by google to create a free google account. (This account can provide
you $300 in credits to use google cloud.)

  [Get Started for Free](https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE)

  After you click this option, you can choose you existing google account or create a new account using following link:
  
  [Create your Google Account](https://accounts.google.com/signup/v2/webcreateaccount?service=cloudconsole&continue=https%3A%2F%2Fcloud.google.com%2Fstorage%2F%3Frefresh%3D1&gmb=exp&biz=false&flowName=GlifWebSignIn&flowEntry=SignUp&nogm=true)

  students also have option to use follwing option:
  
  [Google Cloud Platform | Google for Education](https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none)

  Limitation with for education method: You may need additional approvals and professor need to request for choosing this option, refer documentation in the mentioned link.
  
  Here is additinal reference link for account creation support page:
  
  [Create a Google Account- Google Account Help](<https://support.google.com/accounts/answer/27441>)



* ***Step 2 - Create Project***  
  Assuming you have created gogle account, go to Google Cloud Console using following link:
  
  [Google Storage - Online Data Storage | Cloud Storage | Google Cloud](<https://console.cloud.google.com/>)
  
   * From here create a new project or select an alredy created project, following is the flow at goole console:
   
   ![Create first account_01](images/google/MyFirstAccount_01.png)
   ![Create first account_02](images/google/MyFirstAccount_02.png)
   ![Create first account_03](images/google/MyFirstAccount_03.png)
   
   After project is created, create a service account.
  * Note: There are many methods for authentication while working on google cloud. 
  For our needs we need service account authentication. 
  Here is the reference link for google authentication methods and comparision :
  
  [Authentication Overview | Authentication | Google Cloud](https://cloud.google.com/docs/authentication/)
  
* ***Step3 - Create Service Account*** Select the newly created
project and go to IAM & Admin -> Service Accounts -> Create service
account to create a new service account. Select “Furnish a new private
key” to create and download new private key you will use to
authenticate. Opt for the new preferred JSON format, download the file
and save it to a secure location (e.g. ~/.cloudmesh). For google cloud storage 
this file will be used to update Yaml entry in ~/.cloudmesh/cloudmesh.yaml.
Also for gdrive storage option JSON file is referenced in the
cloudmesh4.yaml in parameter "path_to_json_file"

* Alternatively :

   ** Go to: [create service account page](https://cloud.google.com/docs/authentication/production)
   ![Create service account_01](images/google/CreateServiceAccount_01.png)

   ** Go to section :Creating a service account 
   
  Following is the direct link to generate credentials from google :
  
    [Create Service Account Key](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
    ![Create service key](images/google/CreateServiceKey_01.png)


* `client_secret.json` 
* `google-drive-credentials.json`

* ***Step4 - Yaml entry for google storage Account*** 

* After you downlod the credentials in json format rename the same as google.json and move it to ~/.cloudmesh directory.
* Run follwing cloudmesh command, for the first time and every time your credentials are modified :
```
cms google yaml write ~/.cloudmesh/google.json
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


### Google Drive authentication additional steps and procedure

If we run the Google Drive `Provider.py` for the **First time** then
the required keys, tokens are taken from the `cloudmesh4.yaml` file
and creates a `client_secret.json` file in the follwing path
`~/.cloudmesh/gdrive/`

The `Authentication.py` creates a `.credentials` folder under the
following path `~/.cloudmesh/gdrive/` if it doesn't exist and creates
a `google-drive-credentials.json` file under the following folder
`~/.cloudmesh/gdrive/.credentials/`


So, for the **First time** browser will be opened up automatically and
asks for the Google Drive(gmail) credentials i.e., login email and
password. If you provide these 2 then the Authentication step is
completed and then it will create the `google-drive-credentials.json`
and place it in `~/.cloudmesh/gdrive/.credentials/` folder.
 
These steps are to be followed for the first time or initial run. Once
it is done then our program is set. After these steps then the program
will run automatically by using these credentials stored in the
respective files.

### Note

The Google Drive API accepts these 2 files in the form of **.json file
format** and not in the form of a dictionary.

### Links

Link for additional information:

* <https://github.com/cloudmesh-community/sp19-516-130/blob/master/gdrive.md>


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

## References

For additional information, please visit:

* <https://www.cloudwards.net/how-does-google-drive-work/>
* <https://whatis.techtarget.com/definition/Google-Docs>
* <https://www.techopedia.com/definition/13626/google-docs>
* <https://www.technokids.com/blog/apps/reasons-to-use-google-forms-with-your-students/>
* <https://developers.google.com/drive/api/v3/quickstart/python>
* <https://github.com/samlopezf/google-drive-api-tutorial>
* <https://developers.google.com/drive/api/v3/manage-uploads>
