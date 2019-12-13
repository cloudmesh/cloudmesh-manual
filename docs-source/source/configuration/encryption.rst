Cloudmesh Config File Encryption
================================

.. warning:: THIS SECTION IS UNDER DEVELOPMENT AND NOT FULLY INTEGRATED

.. todo:: Ensure compatible with Windows and Mac operating systems

.. todo:: Implement capabilities to query for value of encrypted attribute


The cloudmesh.yaml configuration file stores passwords and other secrets
to simplify accessing machines. By default **none** of the passwords are
encrypted. Encryption allows you to store your secrets within the file
and prevents the accidental exposure of your secrets (if you edit your
config while sharing a screen) and makes it harder for malicious users
to steal your passwords. This is all done through the
``cms config encrypt`` and ``cms config decrypt`` commands.

Installation
~~~~~~~~~~~~

You must be sure that cloudmesh is installed. The easiest way to install
cloudmseh is via pip. However, it is not yet released with the security
extensions we discuss below. If you would like to use them you need to
install cloudmesh-cloud from source. Which is discussed in the
`cloudmesh manual <https://cloudmesh.github.io/cloudmesh-manual/installation/install.html>`_.
To remind you how easy it is you can use the following steps.

.. code:: bash

        $ mkdir cm
        $ cd cm
        $ pip install cloudmesh-installer
        $ cloudmesh-installer git clone cloud
        $ cloudmesh-installer install cloud
        $ cms help

Please remember that after this you will have to configure your
``~/.cloudmesh/cloudmesh.yaml``

After the system has been installed cloudmesh will need to initialize its
security capabilities. If you wish to control where it is initialized
reference the `Additional Configuration Options`_ section below.
Otherwise, initialize the configuration capabilities by running the the
following.

.. code:: bash

        $ cms config secinit

Now that we have the proper system related properties initialized we need
an RSA public-private key pair to execute encryption and decryption of
the data. The public key is used to encrypt data and the private key is
used to decrypt. If you have previously generated an RSA key pair please
reference the `Additional Configuration Options`__ section below.
Otherwise run the following.

.. code:: bash

        $ cms key gen rsa --set_path

Now that we have the initialized system and RSA key pair we can encrypt
the config.

Encrypting the Config File
~~~~~~~~~~~~~~~~~~~~~~~~~~

The configuration file can be encrypted by running the following
command. By default the encryption command will encrypt everything
within the cloudmesh.yaml file that is not necessary for decryption. To
edit which attributes are encrypted or excluded from encryption
reference the `Additional Configuration Options`_ section below.

.. code:: bash

        $ cms config encrypt

After this command is completed all of the explicitly defined secrets
are encrypted at rest. This means that even if the data is exposed the
data should be secured by typical definitions of security. This also
means that any other cloudmesh command that references an encrypted
attribute will return an encrypted value. Thus, care should be taken to
not call commands that require encrypted attributes. To reference the
original values you must decrypt the config file.

Decrypting the Config File
~~~~~~~~~~~~~~~~~~~~~~~~~~

The configuration file can be decrypted by running the following
command.

.. code:: bash

        $ cms config decrypt

If the private key was password protected you must enter the password
when prompted. If the key has no password either hit enter immediately
after being prompted or run the following.

.. code:: bash

        $ cms config decrypt --nopass

.. _`Additional Configuration Options`:

Additional Configuration Options
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Changing the secinit Directory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The secinit directory controls where encryption related data is stored.
The default location is ~/.cloudmesh/security. If you wish to change
this location you must edit the ``cloudmesh.security.secpath``
attribute. For example, if you wish that cloudmesh secrets are stored
within ``~/.cloudmesh/.foosec`` run the following

.. code:: bash

        $ cms config set cloudmesh.security.secpath=~/.cloudmesh/.foosec
        $ cms config secinit

CMS Key Gen Options
^^^^^^^^^^^^^^^^^^^

Changing Key Names
''''''''''''''''''

The ``cms key gen`` command will automatically generate the key pair
into the default locations of ``~/.ssh/id_rsa`` and
``~/.ssh/id_rsa.pub``. If this key already exists or if you prefer a
different location use the --name=KEYNAME flag. Where KEYNAME is the
full path to the key you would like to generate. For example, if we
would like to have a keys called ``cms`` and ``cms.pub`` in the .ssh
directory execute

.. code:: bash

        $ cms key gen rsa --name=~/.ssh/cms

Setting Keys for Encryption Without Key Gen Command
'''''''''''''''''''''''''''''''''''''''''''''''''''

The path to the encryption and decryption keys are located in
``cloudmesh.security.pubickey`` and ``cloudmesh.security.privatekey``
respectively. When keys are generated with the ``--set_path`` argument
they set these attributes after the keys are generated.

If you already have RSA keys that are PEM encoded you can set the path
directly. For instance let us assume we already had ``~/.ssh/priv/cms``
and its public key pair ``~/.ssh/pub/cms.pub``

.. code:: bash

        $ cms config set cloudmesh.security.privatekey=~/.ssh/priv/cms
        $ cms config set cloudmesh.security.publickey=~/.ssh/pub/cms.pub

Note: the keys can be located anywhere since they are looked up before
encryption.

Generating a Key Without a Password
'''''''''''''''''''''''''''''''''''

Passwords for your RSA private key are recommended. It is much easier to
**lose all security guarantees** if you private key is not encrypted.
Unless you have a good reason, keep a password on your private file. If
you understand this and still wish to generate a key without a password
run

.. code:: bash

        $ cms key gen rsa --nopass

Selecting Attributes to Encrypt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Internally, Cloudmesh represents all attributes as the yaml dot path to
the attribute. The ``cloudmesh.security.secrets`` attribute takes a list
of python regular expressions that will be matched on the dot paths to
the attributes.

To learn the specifics about python regular expression please reference
the `python re documentation <https://docs.python.org/3.7/library/re.html>`_.

By default, the secrets section has ``.*`` which encrypts everything

If you wish to encrypt all ``AZURE_SECRET_KEY`` attributes you can
execute

.. code:: bash

        $ cms config security add --secrets=.*AZURE_SECRET_KEY

If you wish to encrypt a specific attribute you can provide the dot
path. For instance, to encrypt the mongo database ``MONGO_PASSWORD``

.. code:: bash

        $ cms config security add --secrets=cloudmesh.data.mongo.MONGO_PASSWORD

If you wish to remove any regular expressions from secrets run the
following.

.. code:: bash

        $ cms config security rmv --secrets=cloudmesh.data.mongo.MONGO_PASSWORD

Selecting Attributes to Exclude from Encryption
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``cloudmesh.security.exceptions`` section is intended to list
attributes that must **not** be encrypted. This section also explicitly
uses python regular expressions to capture the attribute dot paths. The
default exceptions included in the exceptions section are necessary for
the decryption of data.

Note that the exceptions section has priority over the secrets section.
If there is ever an attribute that is matched on both secrets and
exceptions regular expressions the attribute will **not** be encrypted.

For instance, if you wish to ensure that none of the
``AZURE_SECRET_KEY`` attributes are encrypted run the following.

.. code:: bash

        $ cms config security add --exceptions=.*AZURE_SECRET_KEY

If you wish to exclude a specific attribute give the dot path.

.. code:: bash

        $ cms config security add --exceptions=cloudmesh.data.mongo.MDB_PASSWORD

If you wish to remove any regular expressions within the exceptions
section run the ``cms config security rmv`` command. For instance to
remove the example exceptions.

.. code:: bash

        $ cms config security rmv --exceptions=.*AZURE_SECRET_KEY
        $ cms config security rmv --exceptions=cloudmesh.data.mongo.MDB_PASSWORD


Cloudmesh Integration
~~~~~~~~~~~~~~~~~~~~~

We have provided new classes to handle the foundation of security for cloudmesh.
All of the tools are located within `cloudmesh.configuration.security.encrypt <https://github.com/cloudmesh/cloudmesh-configuration/blob/master/cloudmesh/configuration/security/encrypt.py>`_.

CmsEncryptor
^^^^^^^^^^^^

The CmsEncryptor class is a general encryptor tool used for both symmetric and
asymmetric encryption schemes. Currently RSA and AES-GCM encryption schemes
are the only available schemes for encryption. This is used to take bytes of
data and return the encrypted bytes with other data if necessary. This can
also be used for full file encryption. Due however note that this particular
functionality has not been tested with arbitrarily large file sizes.

CmsHasher
^^^^^^^^^

The CmsHasher class is used for hashing techniques. Currently SHA256 and MD5
are supported. Note MD5 is an **insecure** hashing tool. It should only be
used when you are absolutely sure that the data being hashed does not need to
be kept secret. The default and recommended hashing tool is SHA256. The
Hasher is used hash the attribute dot paths that are encrypted and use the
hash as a base file name. MD5 is used in this instance since the security
of the secrets does not rely on hiding the path of the attribute that was
encrypted.

KeyLoader
^^^^^^^^^

The KeyLoader class is responsible for generating, writing, loading, and
verifying the encoding and format of a given key file. Some variety of keys
and formats are supported. Currently, private keys can have PKCS8 or OpenSSL
format and Public keys can have SubjectInfo or OpenSSH formats.
Both PEM and SSH encoding is supported. It can support both passwordless
and password-protected private key files.
