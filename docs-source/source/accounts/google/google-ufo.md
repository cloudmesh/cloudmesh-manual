# Google Account Creation Tutorial

Google Cloud Platform (GCP), offered by Google, is a suite of cloud
computing services that runs on the same infrastructure that Google
uses internally for its end-user products, such as Google Search and
YouTube. Alongside a set of management tools, it provides a series of
modular cloud services including computing, data storage, data
analytics and machine learning. Here at cloudmesh, we develop services
through providers to support your utilization of many of these
products.

* **Google Compute Engine** delivers virtual machines running in
Google's innovative data centers and worldwide fiber network. Compute
Engine's tooling and workflow support enable scaling from single
instances to global, load-balanced cloud computing. Compute Engine's
VMs boot quickly, come with high-performance persistent and local disk
options, and deliver consistent performance. Our virtual servers are
available in many configurations, including predefined sizes, and
options to create Custom Machine Types optimized for your specific
needs. Flexible pricing and automatic sustained use discounts make
Compute Engine the leader in price/performance.

This page is a step-by-step guide on how to create an Google account
and then service account through the Google webpage.

## Step-by-Step Guide

* ***Step 1 - Create Google Account*** Use the following link provided
by google to create a free google account. This account will provide
you $300 in credits to use google cloud.
https://support.google.com/accounts/answer/27441?hl=en

* ***Step 2 - Create Project***  Go to Google Cloud Console (https://console.cloud.google.com/) and create a new project.

* ***Step3 - Create Service Account*** Select the newly created
project and go to IAM & Admin -> Service Accounts -> Create service
account to create a new service account. Select “Furnish a new private
key” to create and download new private key you will use to
authenticate. Opt for the new preferred JSON format, download the file
and save it to a secure location. This file is referenced in the
cloudmesh4.yaml in parameter "path_to_json_file"


* `client_secret.json` 
* `google-drive-credentials.json`

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

## Note

The Google Drive API accepts these 2 files in the form of **.json file
format** and not in the form of a dictionary.

## Links

Link for additional information:

* <https://github.com/cloudmesh-community/sp19-516-130/blob/master/gdrive.md>

