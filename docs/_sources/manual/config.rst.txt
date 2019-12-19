config
======

.. parsed-literal::

   Usage:
     config  -h | --help
     config cat [less]
     config check
     config secinit
     config security add (--secret=REGEXP | --exception=REGEXP )
     config security rmv (--secret=REGEXP | --exception=REGEXP )
     config security list
     config encrypt 
     config decrypt [--nopass]
     config edit [ATTRIBUTE]
     config set ATTRIBUTE=VALUE
     config get ATTRIBUTE [--output=OUTPUT]
     config value ATTRIBUTE
     config cloud verify NAME [KIND]
     config cloud edit [NAME] [KIND]
     config cloud list NAME [KIND] [--secrets]


   Arguments:
     SOURCE           the file to encrypted or decrypted.
                      an .enc is added to the filename or removed form it
                      dependent of if you encrypt or decrypt
     ATTRIBUTE=VALUE  sets the attribute with . notation in the
                      configuration file.
     ATTRIBUTE        reads the attribute from the container and sets it
                      in the configuration file
                      If the attribute is a password, * is written instead
                      of the character included
     REGEXP           python regular expression

   Options:
      --secret=REGEXP       ensures all attributes within cloudmesh.yaml 
                            whose dot path matches REGEXP are not encrypted
                            (even if listed in secrets)
      --exception=REGEXP    ensures attributes within cloudmesh.yaml whose 
                            dot path matches REGEXP are encrypted
      --name=KEYNAME        The name of a key
      --nopass              Indicates if private key is password protected
      --output=OUTPUT       The output format [default: yaml]
      --secrets             Print the secrets. Use carefully.

   Description:

     config check
        checks if the ssh key ~/.ssh/id_rsa has a password. Verifies it
        through entering the passphrase

     Key generation

        Keys can be generated with 

            cms key gen (ssh | pem) 

        Key validity and password can be verified with

            cms key verify (ssh | pem) 

     key verify (ssh | pem) [--filename=FILENAME] [--pub]

        ssh-add

        cms config encrypt 
            Encrypts the config data at-rest. This means that the data
            is encrypted when not in use. This command is reliant upon
            the cloudmesh.security.secrets attribute and the
            cloudmesh.security.exceptions attribute within the
            cloudmesh.yaml file. Note, that the encrypted data is not 
            encrypted upon request/query to the attribute. This means 
            you must decrypt the config when needed in use and
            re-encrypt when not using the file, or delivering the file.

                1. cloudmesh.security.secrets:
                    This attribute will hold a list of python regular
                    expressions that detail which attributes will be 
                    encrypted by the command. 
                    ex) .*: will encrypt all attributes
                    ex) .*mdbpwd.*: will encrypt all paths with mdbpwd

                2. cloudmesh.security.exceptions:
                    This attribute will hold a list of python regular
                    expressions that detail which attributes will not
                    be encrypted by the command. 
                    ex) .*pubkey.*: ensures no pubkey path is encrypted 

        security add --secret=REGEXP 
            Adds valid REGEXP to the cloudmesh.security.secrets section

        security rmv --secret=REGEXP 
            Removes REGEXP from the cloudmesh.security.secrets section

        security add --exception=REGEXP
            Adds valid REGEXP to cloudmesh.security.exceptions section

        security rmv --exception=REGEXP
            Removes REGEXP from cloudmesh.security.exceptions section

        security list
            Prints a list of all the attribute dot-paths that are 
            referenced by cms config encryption and decryption commands

        cms config decrypt 
            Decrypts the config data that was held in rest. This 
            command decrypts and attributes that were encrypted
            using the sister `cms config encrypt` command. 

        config set ATTRIBUTE=VALUE

            config set profile.name=Gregor

        In case the ATTRIBUTE is the name of a cloud defined under
        cloudmesh.cloud, the value will be written into the credentials
        attributes for that cloud this way you can safe a lot of
        typing. An example is

            cms config set aws.AWS_TEST=Gregor

        which would write the AWS_TEST attribute in the credentials
        of the cloud aws. This can naturally be used to set for
        example username and password.
