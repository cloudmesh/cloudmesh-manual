
## Python Google Drive API

### Step-by-step process

Before writing the Python interface for Google Drive, we need to setup
an email account, with that email account we will get a set of google
services and one of them is Google Drive with 15 GB overall storage.

After that we need to go through the Google Drive Quick start guide:

* <https://developers.google.com/drive/api/v3/quickstart/python>

There we can see Enable API option as shown in the next picture:

![Enable API](images/image1.png)

Once we enable that we will get credentials.json file where all of our
credentials are stored that can be used to communicate with our Google
Drive through Python Interface. After that, we will be redirected to a
page where we need to create our own project as shown in the next
picture:

![Create a project](images/image2.png)

As we see next we need to select Google Drive API from here

![Add credentials](images/image16.png)

After that, we need to obtain the client\_secret file as shown next:
(The file that is downloaded as `client_id.json` needs to be renamed as
`client_secret.json`)

![Rename the file](images/image18.png)

After this we need to click `Done` otherwise it would not set the Google
Drive API.

After this if we run Authentication.py we will be redirected to our
default browser to put our our login id and password and after that it
asks to authenticate our credentials. If we allow that as shown next:

![Grant permissions](images/image21.png)

We will get the screen something like given next (as the authentication
pipeline has bees completed).

![Authentication success](images/image23.png)

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

