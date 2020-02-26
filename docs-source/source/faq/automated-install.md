# FAQ

## Cms Mostly automated install on macOS and Linux



If you di not understand line by line what this does you should not execute it
Verify correctnett works on linux and OSX, I have this not yet tested  on
gitbash, on windows you must remove the mongo install line and have cl, mongo,
gitbash previously installed.

You must have used ssh-keygen to generate the key before 

Install Python:

Save in file install-python.sh

```
#! /bin/sh -x
rm -rf ~/ENV3
rm -rf ~/cm/cloudmesh-common 
rm -rf ~/cm/cloudmesh-cmd5 
rm -rf ~/cm/cloudmesh-sys
rm -rf ~/cm/cloudmesh-configuration
rm -rf ~/cm/cloudmesh-test 
rm -rf ~/cm/cloudmesh-gui 
rm -rf ~/cm/cloudmesh-cloud 
rm -rf ~/cm/cloudmesh-openstack
rm -rf ~/cm/cloudmesh-inventory 
rm -rf ~/cm/cloudmesh-openstack
rm -rf ~/.cloudmesh
python3.8 -m venv ~/ENV3
echo "Please activate your Virtual Environment"
echo "    source ~/ENV3/bin/activate"
```

Save in file install-cms.sh and change values

```
#! /bin/sh -x
pip install pip -U

pip install cloudmesh-installer -U
mkdir cm
cd cm
cloudmesh-installer git clone openstack 
cloudmesh-installer git pull openstack
cloudmesh-installer install openstack
cms set cloud=chameleon
cms help 
cms debug off

#cms test # its in your responsiblity to fix this this test may not work yet properly

cms config set cloudmesh.data.mongo.MONGO_AUTOINSTALL=True

#cms config set cloudmesh.profile.email=TBD@gmail.com
#cms config set cloudmesh.profile.firstname=TBD
#cms config set cloudmesh.profile.lastname=TBD
#cms config set cloudmesh.profile.github=TBD
#cms config set cloudmesh.profile.user=TBD

#cms config set cloudmesh.cloud.chameleon.credentials.auth.username=TBD
#cms config set cloudmesh.cloud.chameleon.credentials.auth.password=TBD
cms config set cloudmesh.cloud.chameleon.credentials.auth.project_id=7767f9aac3c143de8b1f0e6acc70f159
cms config set cloudmesh.cloud.chameleon.default.network=e01ee12e-fd22-4b21-a050-d3e015f42bb1

cms config set cloudmesh.data.mongo.MONGO_PASSWORD=TBD
rm -rf ~/.cloudmesh/cloudmesh.yaml.bak.*

cms admin mongo install

#cms test

cms gui quick # Set your Mongo username = `admin` and password what you want.
sleep 2
cms init
sleep 2

# LET US NOW ASSUME YOU HAVE IN cloiudmes.profile.user=xyz

Replace xyz with what you have in profile
cms key delete xyz --cloud=chameleon
cms key upload xyz --cloud=chameleon
cms key list 
cms key list --cloud=chameleon

cms vm list --refresh
```

make the scripts executable

```
chmod a+x install-cms.sh install-python.sh
```

Now lest use it

```
./install-python.sh
```

Start your ENV with 

```
source ~/ENV3/bin/activate
```

Install cms

```
./install-cms.sh
```

Start a vm

```
cms vm boot
```



## Command that do not work on Windows 

```
cms admin mongo install
```

Instead you need to install Mongo form the MSI. but not select the service mode



