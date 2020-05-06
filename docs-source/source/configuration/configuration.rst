Configuration
=============

The Configuration of Cloudmesh is controlled with a YAML file that is
placed in `~/.cloudmesh/cloudmesh.yaml`. It is created automatically
from the template located at

-  https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/etc/cloudmesh.yaml

upon first calling `cms help`. You can customize the file while editing it or add new
providers.

you can use the command `cms register` to find out what you need to specify.

.. todo:: As the register command is new not each cloud is yet having a sample

An example would be::

    register list sample --service=compute --kind=openstack



.. list-table:: Configuration Samples for Compute
   :widths: 20 20 20 20 20
   :header-rows: 1

   * - Provider
     - Account
     - Compute
     - Volume
     - Storage
   * - AWS
     - :doc:`Integrate <../accounts/aws>`
     - :doc:`AWS <../register/compute-aws>`
     - :doc:`AWS <../register/volume-aws>`
     - :doc:`AWS <../register/storage-awss3>`
   * - Azure
     - :doc:`Integrate <../accounts/azure>`
     - :doc:`Azure <../register/compute-azure>`
     - :doc:`Azure <../register/volume-azure>`
     - :doc:`Azure <../register/storage-azureblob>`, :doc:`Multipass <../register/storage-parallelazureblob>`
   * - Google
     - :doc:`Integrate <../accounts/google/index>`
     - :doc:`Google <../register/compute-google>`
     - :doc:`Google <../register/volume-google>`
     - :doc:`G-Drive <../register/storage-parallelgdrive>`
   * - Oracle
     -
     - :doc:`Oracle <../register/compute-oracle>`
     - :doc:`Oracle <../register/volume-oracle>`
     - :doc:`Oracle <../register/storage-oracle>`
   * - OpenStack
     -
     - :doc:`OpenStack <../register/compute-openstack>`
     - :doc:`OpenStack <../register/volume-openstack>`
     - :doc:`OpenStack <../register/storage-openstack>`
   * - Multipass
     -
     - :doc:`Multipass <../register/compute-multipass>`
     - :doc:`Multipass <../register/volume-multipass>`
     - :doc:`Multipass <../register/storage-multipass>`
   * - Box
     -
     -
     -
     - :doc:`Box <../register/storage-box>`
   * - Local
     -
     -
     -
     - :doc:`Local <../register/storage-local>`



Cloudmesh Yaml File Object definitions
--------------------------------------

In addition to the register command, the YAML file can easily be controlled
form the command line with the `config` command.

Getting Values
--------------

We implemented a convenient get method in case you need to look up
some values in the configuration file. For example::

    cms config get cloudmesh.profile
    cms config get cloudmesh.profile.firstname


print information out. While the first points to a dict, it
prints out all the values form that dict, the last is an
attribute and just prints out the attribute and its value.

Setting values
--------------

In addition, if you need to set a value quickly in the configuration
file you can do this with::

    cms config set cloudmesh.profile.firstname=Gregor

Will set the firstname in the profiles to Gregor

This command at this time does not work on dicts, so you need to define each attribute.


Editing Values
--------------

In case the values in the yaml file have a TBD the can also be
edited with our built-in command that requires you
to specify the dict in which such values occur.

For example, let us assume the value in cloudmesh.profile.firstname
is TBD then, the command::

    cms config edit cloudmesh.profile

can be used to change it.

Advanced Yaml Variables
-----------------------

One of the features of the Cloudmesh YAML file is that it allows you to
use previously defined attributes in the YAML file itself. Thus if an
attribute value contains for example  `"{cloudmesh.attribute}"` or any
environment variable, it finds the value for this dict entry in the YAML
file and replace it
with its value. For example. let us assume the YAML file contains::

    cloudmesh:
      profile:
        name: Gregor
      cloud:
        aws:
          username: "{cloudmesh.profile.name}"
          key: ~/.ssh/id_rsa
          dir: $HOME
          current: .

cloudmesh will replace the will result be transformed with::

    cloudmesh:
      profile:
        name: Gregor
      cloud:
        aws:
          username: "Gregor"
          key: /home/gregor/.ssh/id_rsa
          dir: /home/gregor
          current: /home/gregor/github/cm

This feature is naturally handy for creating templates for users.


Profile
-------

The profile defines simple information about you::

  profile:
    firstname: TBD
    lastname: TBD
    email: TBD@sample.edu
    user: TBD
    github: TBD
    publickey: ~/.ssh/id_rsa.pub


Default
-------

The variable default is used to identify information about your
experiments and groups that are used throughout your
interaction with Cloudmesh.

  default:
    group: cloudmesh
    experiment: base
    cloud: azure
    cluster: clustera

The values can be set with the default command.

.. todo:: implement the default command and set values in it. This may
          already be done. we may need to add the dot notation for
          that command so we have one command that can set the general
          default, but also the default for named services.

          a link to the manual page should come here



General Service Attributes
--------------------------

Each Cloudmesh service must have an attribute ``cm`` with the
following fields. If an attribute contains the value `TBD`
it needs to be updated. You only have to update the providers
you like to use, you can delete the others if you like.

cm
~~

In the `cm` portion, we define elementary information that identifies
the service. This includes the following information

active

    if set to True, this cloud is going to be used in Cloudmesh,
    if it is set to False it is not activated.
    This has the advantage that you do not have to remove
    the service from the YAML file if you do not use it

heading

    This field is currently not used but in future releases this
    field will be used in table or GUIs to be printed when list
    functions are used

label

    This field is typically the same as the entry under which the cloud
    service is filed.  It is used as
    a convenient abbreviation that can be used in your programs.

kind

    This field is the most important field that identified what kind
    of service your cloud is, and it determines based on its name
    how to interact with the service.

    For compute services the following kinds are valid: ``aws``,
    ``azure``, ``google``, ``openstack``

    For storage services the following kinds are valid: ``aws``,
    ``azure``, ``google``, ``openstack``, ``box``
    
    For volume services the following kinds are valid: ``aws``,
    ``azure``, ``google``, ``multipass``, ``oracle``, ``openstack``

host

    This field is used to identify where to find information about the
    service provider

service

    The type of service. valid values are ``compute``, ``storage``,
    ``volume``.

::

    cm:
        active: False
        heading: AWS
        host: aws.amazon.com
        label: aws
        kind: aws
        version: 1.0
        service: compute


Adding Templates
----------------

New templates can be added with the register command.

The manual page to the rgister command is avalable here.

.. todo:: put the link here

Compute Cloud Providers
-----------------------

The default YAML file includes templates to configure various clouds.
You can change these defaults and provide access to your cloud
credentials to make the management of cloud virtual machines easier.
Templates for AWS, Azure, Google, OpenStack are provided. Specific
templates for Jetstream and Chameleon cloud are included in the example
`cloudmesh.yaml <https://github.com/cloudmesh/cloudmesh-cloud/blob/master/cloudmesh/etc/cloudmesh.yaml>`__.
We list each template next.

We explain in more detail the features of the configuration files for
cloud services.

First, all cloud services are listed under the key ``cloud``. You can
add arbitrary compute cloud services with a name you like. You can
even create multiple names that refer to the same cloud but may have
different parameters.  We like to focus on the example for ``aws`` and
explain this in a bit more detail.


The Cloudmesh entry for a compute service is divided into three portions:
``cm``, ``default``, and ``credentials``. The format of the ``cm``
is explained previously.


Default
~~~~~~~

The next category is defaults, that can be preset for each cloud.
However, defaults are overwritten by the Cloudmesh shell
variables. So they are only used once at startup if these defaults are not already defined by Cloudmesh shell. Typically
we use them to for example define values for images and sizes or
flavors of images

image

    The name of the default image

size

The size of the default image

credentials
~~~~~~~~~~~

The credentials are dependent on the kind of the cloud and include all
information needed for authenticating and use the cloud service.

As the information is sensitive the file in .cloudmesh holding
the information must be properly protected.

.. note:: We even have a project that encrypts the cloudmesh.yaml
          file, but it is not fully integrated yet.  Future versions
          of cloudmesh will encrypt the information by default.


Azure
~~~~~

.. todo:: az arm provider this has to be verified. We will likely
          deprecate this for a more elaborate provider

To obtain an account on Azure you can follow our instructions at

:doc:`../accounts/azure`. The configuration file containes the following::


   cloudmesh:
     ...
     cloud:
       ...
       azure:
         cm:
           active: False
           heading: Azure
           host: azure.microsoft.com
           label: Azure
           kind: azure
           version: TBD
           service: compute
         default:
           image: 'Canonical:UbuntuServer:16.04-LTS:latest'
           size: 'Basic_A0'
           resource_group: 'cloudmesh'
           storage_account: 'cmdrive'
           network: 'cmnetwork'
           subnet: 'cmsubnet'
           blob_container: 'vhds'
         credentials:
           AZURE_TENANT_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_SUBSCRIPTION_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_APPLICATION_ID: 'xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
           AZURE_SECRET_KEY: TBD
           AZURE_REGION: 'northcentralus'

Google
~~~~~~

To obtain an account on Google you can follow our instructions at
:doc:`../accounts/google/index`. THe configuration file contains the
following::

   cloudmesh:
     ...
     cloud:
       ...
       google:
         cm:
           active: True
           heading: google
           host: google.cloud.com
           label: google
           kind: google
           version: TBD
           service: compute
         default:
           image: 'Image Name'
           size: 'n1-standard-4'
         credentials:
           datacenter: 'us-central1-a'
           client_email: '<service account>.iam.gserviceaccount.com'
           project: '<Project Name>'
           path_to_json_file: '~/.cloudmesh/<file with credentials>'

OpenStack
~~~~~~~~~

We provide an example of how to use an OpenStack based cloud in
Cloudmesh. Please, place the following to your ``cloudmesh.yaml`` file
and replace the values for ``TBD``. Our example uses `Chameleon Cloud
<https://www.chameleoncloud.org/>`__. This is a cloud for academic
research. Certainly, you can configure other clouds based on this
template. We have successfully used also clouds in Canada (Cybera),
Germany (KIT), Indiana University (jetstream). TO get started, you can
even install your local cloud with devstack and make adjustments.
Please remember you can have multiple clouds in the
``cloudmesh.yaml`` file so you could if you have access to them
integrate all of them.  You will need access to a project and add your
project number to. the credentials.  Example for chameleon cloud::

   cloudmesh:
     ...
     cloud:
       ...
       chameleon:
         cm:
           active: True
           heading: Chameleon
           host: chameleoncloud.org
           label: chameleon
           kind: openstack
           version: liberty
           service: compute
         credentials:
           OS_AUTH_URL: https://openstack.tacc.chameleoncloud.org:5000/v2.0
           OS_USERNAME: TBD
           OS_PASSWORD: TBD
           OS_TENANT_NAME: CH-819337
           OS_TENANT_ID: CH-819337
           OS_PROJECT_NAME: CH-819337
           OS_PROJECT_DOMAIN_ID: default
           OS_USER_DOMAIN_ID: default
           OS_VERSION: liberty
           OS_REGION_NAME: RegionOne
           OS_KEY_PATH: ~/.ssh/id_rsa.pub
         default:
           flavor: m1.small
           image: CC-Ubuntu16.04
           username: cc

Virtual Box
~~~~~~~~~~~

Virtualbox has at this time-limited functionality, but creation, ssh,
and the deletion of the virtual box is possible.

You can also integrate virtualbox as part of cloudmesh while providing
the following description::

   cloudmesh:
     ...
     cloud:
       ...
       vbox:
         cm:
           active: False
           heading: Vagrant
           host: localhost
           label: vbox
           kind: vagrant
           version: TBD
           service: compute
         default:
           path: ~/.cloudmesh/vagrant
           image: "generic/ubuntu1810"
         credentials:
           local: True
           hostname: localhost

Storage Providers
-----------------

General description for all storage providers, comment on the
``default:`` and what that does

AWS S3
~~~~~~

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
:doc:`../accounts/aws`.


In the ``cloudmesh.yaml`` file, the ‘aws’ section under ‘storage’
describes an example configuration or a AWS S3 storage provider. In
the credentials section under aws, specify the access key id and
secret access key which is available in the AWS console under AWS
IAM ``service`` -> ``Users`` -> ``Security Credentials``. Container is
the default Bucket which is used to store the files in AWS
S3. The region is the geographic area like ``us-east-1`` which contains
the bucket.  The region is required to get a connection handle on the S3
Client or resource for that geographic area. Here is a sample::

   cloudmesh:
     ...
     storage:
       aws:
         cm:
           heading: aws
           host: amazon.aws.com
           label: aws
           kind: awsS3
           version: TBD
           service: storage
         default:
           directory: /
         credentials:
           access_key_id: *********
           secret_access_key: *******
           container: name of bucket that you want user to be contained in.
           region: us-east-1

.. todo:: Make credentials more uniform between compute and data


.. todo:: in azure we had these explanations, maybe we need more info
	  in the sample
   

	  Configuration settings for credentials in the yaml file can be
	  obtained from Azure portal.

	  TODO: More information via a pointer to a documentation you create needs
	  to be added here

	  In the YAML file the following values have to be changed

	  -  ``account_name`` - This is the name of the Azure blob storage
	     account.
	  -  ``account_key`` - This can be found under ‘Access Keys’ after
	     navigating to the storage account on the Azure portal.
	  -  ``container`` - This can be set to a default container created under
	     the Azure blob storage account.
	     

Google drive 
~~~~~~~~~~~~

.. todo:: to be deleted once integrated in table
   
Due to bugs in the requirements of the google driver code, we have not
yet included it in the Provider code. This needs to be fixed before we
can do this.

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
.

The ``cloudmesh.yaml`` file needs to be set up as follows for the
‘gdrive’ section under ‘storage’::

   cloudmesh:
     ...
     storge:
       gdrive:
         cm:
           heading: GDrive
           host: gdrive.google.com
           kind: gdrive
           label: GDrive
           version: TBD
           service: storage
         credentials:
           auth_host_name: localhost
           auth_host_port:
             - ****
             - ****
           auth_provider_x509_cert_url: "https://www.googleapis.com/oauth2/v1/certs"
           auth_uri: "https://accounts.google.com/o/oauth2/auth"
           client_id: *******************
           client_secret: ************
           project_id: ************
           redirect_uris:
             - "urn:ietf:wg:oauth:2.0:oob"
             - "http://localhost"
           token_uri: "https://oauth2.googleapis.com/token"
         default:
           directory: TBD

Google Cloud Storage
~~~~~~~~~~~~~~~~~~~~

::

    cloudmesh:
      ...

      storage:
        ...
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
              ...
              ***********************************************************

              -----END PRIVATE KEY-----

              '
            client_email: user@imposing-coast-123456.iam.gserviceaccount.com
            client_id: '1234567******23456'
            auth_uri: https://accounts.google.com/o/oauth2/auth
            token_uri: https://oauth2.googleapis.com/token
            auth_provider_x509_cert_url: https://www.googleapis.com/oauth2/v1/certs
            client_x509_cert_url: https://www.googleapis.com/robot/v1/metadata/x509/user%40imposing-coast-12345.iam.gserviceaccount.com


Box
~~~

It is beyond the scope of this manual to discuss how to get an account
on Google. However, we do provide a convenient documentation at
:doc:`../accounts/box`.


In the ``cloudmesh.yaml`` file, find the ‘box’ section under ‘storage’.
Under credentials, set ``config_path`` to the path of the configuration
file you created as described in the Box chapter::

   cloudmesh:
     ...
     box:
       cm:
         heading: Box
         host: box.com
         label: Box
         kind: box
         version: TBD
         service: storage
       default:
         directory: /
       credentials:
         config_path: ******************************

Volume Cloud Providers
-----------------------

Cloud providers that offer compute services usually have functions for managing
block volumes which can be attached to virtual machine instances.
Documentation on using cloudmesh to manage block volumes can be found in the
`cloudmesh-volume
<https://github.com/cloudmesh/cloudmesh-volume/blob/master/README.md>`_
package.  The credentials needed in the volume configurations are typically 
the same as those needed for the compute configuration.  The default,
which varies by provider, allows the user to create volumes from a set 
default values such as volume type and size.

AWS
~~~~~~

In the AWS volume configuration, the ``region_name`` refers to the AWS region
e.g. ``us-east-2``, while the ``region`` refers to the AWS availability zone
e.g. ``us-east-2a``.  Other defaults that can be changed by the user for
creating a volume include the volume type, size, input/output operations per
second ``iops``, whether the volume is encrypted, or a snapshot to create the
volume from. ::

   cloudmesh:
     ...
     volume:
       aws:
         cm:
           heading: aws
           host: amazon.aws.com
           label: aws
           kind: awsS3
           version: TBD
           service: volume
         default:
           volume_type: gp2
           size: 2
           iops: 1000
           encrypted: False
           region_name: TBD
           region: TBD
           multi_attach_enabled: True
           snapshot: "None"
         credentials:
           EC2_SECURITY_GROUP: default
           EC2_ACCESS_ID: TBD
           EC2_SECRET_KEY: TBD
           EC2_PRIVATE_KEY_FILE_PATH: ~/.ssh/id_rsa
           EC2_PRIVATE_KEY_FILE_NAME: aws_cert

Azure
~~~~~~

::

   cloudmesh:
     ...
     volume:
       aws:
         cm:
           active: true
           heading: Azure
           host: azure.microsoft.com
           label: Azure
           kind: azure
           version: latest
           service: volume
         default:
           volume_type: _DEFAULT_
           size: Basic_A0
           group: default
         credentials:
           AZURE_TENANT_ID: TBD
           AZURE_SUBSCRIPTION_ID: TBD
           AZURE_APPLICATION_ID: TBD
           AZURE_SECRET_KEY: TBD
           AZURE_REGION: TBD

Google
~~~~~~

The default volume ``type`` in the Google configuration takes a url as a value.
The url should look like this:
``projects/project_id/zones/zone/diskTypes/pd-standard``, where ``project_id``
is the project ID for your project and ``zone`` is the zone in which the volume
is located.

::

   cloudmesh:
     ...
     volume:
       google:
         cm:
           active: true
           heading: Google
           host: cloud.google.com
           label: Google
           kind: google
           version: v1
           service: volume
         default:
           zone: TBD
           type: TBD
           sizeGb: 10
         credentials:
           project_id: TBD
           path_to_service_account_json: TBD

Multipass
~~~~~~~~~~

The default ``path`` designates the location on the user's computer where the
multipass volumes will be created.  For Windows users, the path should use
``/`` instead of ``\``. ::

   cloudmesh:
     ...
     volume:
       multipass:
         cm:
           active: '1'
           heading: multipass
           host: TBD
           kind: multipass
           version: TBD
           service: volume
         default:
           path: TBD

Oracle
~~~~~~~~~~

::

   cloudmesh:
     ...
     volume:
       oracle:
         cm:
            active: true
            heading: {name}
            host: TBD
            label: {name}
            kind: oracle
            version: TBD
            service: volume
         credentials:
            version: TBD
            user: TBD
            fingerprint: TBD
            key_file: ~/.oci/oci_api_key.pem
            pass_phrase: TBD
            tenancy: TBD
            compartment_id: TBD
            region: TBD
            availability_domain: TBD

Openstack
~~~~~~~~~~

::

   cloudmesh:
     ...
     volume:
       openstack:
         cm:
            active: true
            heading: Chameleon
            host: chameleoncloud.org
            label: chameleon
            kind: openstack
            version: train
            service: volume
         credentials:
            auth:
              username: TBD
              password: TBD
              auth_url: https://kvm.tacc.chameleoncloud.org:5000/v3
              project_id: TBD
              project_name: cloudmesh
              user_domain_name: Default
            region_name: KVM@TACC
            interface: public
            identity_api_version: '3'
            key_path:  ~/.ssh/id_rsa
         default:
            size: 1
            volume_type: __DEFAULT__

Log File
--------

.. note::  Previous versions of cloudmesh had a sophisticated logging feature.
           This version has this feature not yet made available. Implement it
           and make available. At this time, it is not our highest priority.

Log files are stored by default in ``~/.cloudmesh/log`` The directory
can be specified in the yaml file.


Mongo
-----

The cache of Cloudmesh is managed in a mongo db database with various
collections. However, the user does not have to manage the collections
as this is done for the user through Cloudmesh. Before you can use it,
mongo does need to be installed.

If you have not installed mongo, you may try

.. code:: bash

   cms admin mongo install

However, to install it with cms, you must also make sure the following values are
installed in the cloudmesh yaml file::

    ...
    MONGO_PASSWORD: TBD
    ...
    MONGO_AUTOINSTALL: True

The value for the password must not be ``TBD``.

Next, you create the database template with authentication with

.. code:: bash

   cms admin mongo create

Now you are ready to use it in Cloudmesh. The mongo db can be started
and stopped with the command

.. code:: bash

   $ cms admin mongo start
   $ cms admin mongo stop

or simply

.. code:: bash

   $ cms start
   $ cms stop


The configuration details are included in the yaml file and looks like::

  cloudmesh:
    ...
    mongo:
      MONGO_AUTOINSTALL: False
      MONGO_BREWINSTALL: False
      LOCAL: ~/local
      MODE: native
      MONGO_DBNAME: 'cloudmesh'
      MONGO_HOST: '127.0.0.1'
      MONGO_PORT: '27017'
      MONGO_USERNAME: 'admin'
      MONGO_PASSWORD: TBD
      MONGO_DOWNLOAD:
        darwin:
          url: https://fastdl.mongodb.org/osx/mongodb-osx-ssl-x86_64-4.0.12.tgz
          MONGO_PATH: ~/.cloudmesh/mongodb
          MONGO_LOG: ~/.cloudmesh/mongodb/log
          MONGO_HOME: ~/local/mongo
        linux:
          url: https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.10.tgz
          MONGO_PATH: ~/.cloudmesh/mongodb
          MONGO_LOG: ~/.cloudmesh/mongodb/log
          MONGO_HOME: ~/local/mongo
        win32:
          url: https://fastdl.mongodb.org/win32/mongodb-win32-x86_64-2008plus-ssl-4.0.10-signed.msi
          MONGO_PATH: ~\.cloudmesh\mongodb-data
          MONGO_LOG: ~\.cloudmesh\mongodb-data\log
          MONGO_HOME: ~\.cloudmesh\mongo
        redhat:
          url: https://repo.mongodb.org/yum/redhat/7/mongodb-org/4.0/x86_64/RPMS/mongodb-org-server-4.0.10-1.el7.x86_64.rpm
          MONGO_PATH: ~/.cloudmesh/mongodb
          MONGO_LOG: ~/.cloudmesh/mongodb/log
          MONGO_HOME: ~/local/mongo

Mongo via Docker
~~~~~~~~~~~~~~~~

Mongo can also be easily deployed and run via docker for Cloudmesh. To achieve
this you have to set the `MODE` to `docker` either by editing the yaml file or using


.. code:: bash

   $ cms config set cloudmesh.data.mongo.MODE=docker


If you have not yet use the database in docker, you need to initialize it just
as in the native mode with

.. code:: bash

   $ cms mongo admin install
   $ cms mongo admin create

Then you can use as usual

.. code:: bash

   $ cms init
   $ cms start
   $ cms stop

to start and stop the DB.


.. note:: To set it back to a native install use

          .. code:: bash

             $ cms config set cloudmesh.data.mongo.MODE=native

          Naturally, you have to do the native setup also if you have never done it.

Config API
----------

Cloudmesh has a very easy to use interface to access the
configuration file programmatically. This is best demonstrated with the following example:

.. code:: python

    config = Config()
    print (config["cloudmesh.profile.name"])

Here we simply can use our dot notation to get that value of an attribute from
the configuration file. More advanced functions such as a search with regular
expressions such as searching for all compute clouds using OpenStack are also
possible.

.. code:: python

    clouds = config.search("cloudmesh.cloud.*.cm.kind", "opensatck")

This feature is even integrated into the variable or set functionality of `cms`
as demonstrated earlier. For more information about the API, please consult the
manual pages on

* cloudmesh.cmd5.var
* cloudmesh.configuration.Config




