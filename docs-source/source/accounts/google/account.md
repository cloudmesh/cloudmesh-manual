# Google Account

## Prerequisits

We assume you have the cloudmesh google provider installed. This can be done with 

```bash
$ pip install cloudmesh-google
```

For developers the best way to install it is to use `cloudmesh-installer`. 

```bash
$ mkdir cm
$ cd cm
$ pip install cloudmesh-installer
$ cloudmesh-installer git clone google
$ cloudmesh-installer git install google
```

## Creating the Google account

A new google account can be created using following information:

* [Create your Google Account](https://accounts.google.com/signup/v2/webcreateaccount)
 

## Activation Google Storage Service

Google allows you to apply for an account offering you $300 in credits to use
google storage cloud. To apply for it you can use either of the follwoing links:

* [Get Started for Free](https://console.cloud.google.com/freetrial?_ga=2.36435558.-733144975.1575249772&_gac=1.216762084.1575249889.CjwKCAiA5o3vBRBUEiwA9PVzavyytvYEKObpJV-GtriRXXj9JCtqPkm3TEpyZ6pDgOHWgDXuqZ7tFBoCjacQAvD_BwE)
* [Google Cloud Platform | Google for Education](https://edu.google.com/products/google-cloud-platform/?utm_source=google&utm_medium=cpc&utm_campaign=na-US-all-en-dr-bkws-all-all-trial-b-dr-1007179&utm_content=text-ad-none-any-DEV_c-CRE_182323152622-ADGP_Hybrid%20%7C%20AW%20SEM%20%7C%20SKWS%20%7C%20US%20%7C%20en%20%7C%20Multi%20~%20Student-KWID_43700018304461092-kwd-285517564251&utm_term=KW_%2Bstudent%20%2Bcloud-ST_%2BStudent%20%2BCloud&gclid=EAIaIQobChMI07zC9eeV5gIVhMBkCh2yMwA2EAAYASAAEgKmHfD_BwE&modal_active=none)

Please chose the one that is most appropriate for you. For the eductaional
account you may need a verifiaction from your school or an email that is
registered as an educational insititution.

#### Create a Project

Next, you will need to create a Google project. We recommend that you simply
use the name `cloudmesh`. You can create such a project at
  
* [Google Storage - Online Data Storage | Cloud Storage | Google Cloud](<https://console.cloud.google.com/>)
  
The three screenshots show the workflow on how to create a project:
   
![Create first account_01](https://github.com/cloudmesh-community/sp20-516-235/blob/master/images/create1.png)
![Create first account_02](https://github.com/cloudmesh-community/sp20-516-235/blob/master/images/create2.png)
![Create first account_03](https://github.com/cloudmesh-community/sp20-516-235/blob/master/images/create3.png)
   
#### Create a Service Account

Now you need to also create a service account by clicking the follwoing link:
  
  [Create a Service Account](https://console.cloud.google.com/apis/credentials/serviceaccountkey?project=cloudmesh-class&folder&organizationId)
  
To create it you need to select the newly created project and go to 

* [Create service account page](https://cloud.google.com/docs/authentication/production)
   
   ![Create service account_01](https://github.com/cloudmesh-community/sp20-516-235/blob/master/images/create4.png)

   * Go to section :Creating a service account 
   
  Following is the direct link to generate credentials from google :
  
    [Create Service Account Key](https://console.cloud.google.com/apis/credentials/serviceaccountkey)
    
    ![Create service key](images/CreateServiceKey_01.png)

      Sample files:
       `client_secret.json` 
       `google-drive-credentials.json`

To create and download new private key you will use to authenticate. Select the
JSON format and download the file and save it to 


`~/.cloudmesh`

Make sure you keep that directory secure.

todo:: in future we want a link to a security section here

This file will be used to update the YAML  entry in the file

`~/.cloudmesh/cloudmesh.yaml`

We recommend that you rename the downloaded file to `google.json` when you save
it.

IMPLEMNET:

```
$ cms register google google.json
```



#### Update Cloudmesh with the Google Storage Account Information



```
$ cms google config add ~/.cloudmesh/google.json --service=google 
```


MOVE THE CONTENT FROM HERE INTO CONFIGURATION SECTION ...


Mor details of the configuration can v=be looked up in the [Cloudmesh  Configuration Section](MISSING)

THE COMMANDS HAVE TO BE REVISITED

```
$ cms google list # what does thsi do?
```

THIS NEEDS TO BE RENAMED TO 

```
$ cms google config list  # logical
$ cms google yaml list storage # somewhat logical

```



### Using the Google Storage


If google storage bucket is alredy created, you can list google storage bucket
using following command:

```
$ cms google list 
```

From the displayed list please pick bucket of your choice and add bucket name
to yaml file in the storage section for google provider

`storage > google > default > directory`.

If bucket doesnot exist use folling command to create new bucket:

```
$ cms google create bucket --name=NAME --service=google
```

NAME: is new bucket name.
Important note: Bucket name needs to be globally unique, you may choose combinantion
of your class ID and bucket name. 
`e.g. f19_516_xxx_bucket_name`

You are all set with account setup.

#### JUNK

-----------------

For google cloud storage cloudmesh services `cms` provides command line
interface which is part of part of cloudmesh-google storage application.


Various available operations using cms are file operations for put to upload, get to download,
list, delete `object/blob`, create directory. First, we need to create an
account as follows:


You can certainly do it by hand ::::::

* `IAM & Admin -> Service Accounts -> Create service account`

 to create a new service account. Select 
 
* `Furnish a new private key` 

--------------------

## Links

* [New Google Account Introduction](https://myaccount.google.com/intro)
* [Create a Google Account- Google Account Help](<https://support.google.com/accounts/answer/27441>)
* [Authentication Overview | Authentication | Google Cloud](https://cloud.google.com/docs/authentication/)
