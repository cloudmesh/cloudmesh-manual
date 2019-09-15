# Using windos instead of Linux

## Using bash

:o2: lease contribute

## Using gitbash

:o2: please contribute

## Using cmd

| Linux | Windows |
| ----- | ------- |
| which FILE | where FILE |
| rm -rf DIR | rmdir DIR /s /q |
| history | doskey /HISTORY |
| cat FILE | type FILE |
| mv FROM TO | move FROM TO |
| cp FROM TO | copy FROM TO |


Do not use notepad, but if nothing else is available

notepad FILE |

See also:

* <https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4
/html/Step_by_Step_Guide/ap-doslinux.html>

## EASY INSTALL

Make sure you have python3.7.4 installed from python.org

Place the following in your folder taht comes up when you start CMD.exe.

### ENV3.bat

```bash
pip install pip -U --user
ENV3\Scripts\activate.bat
```

### SETUP-ENV3.bat

```bash
rmdir ENV3 /s /q
python --version
python -m venv ENV3
echo "Start a new CMD.exe"
start cmd.exe /k "ENV3 & pip install pip -U --user"
exit
```

### CMS-CLONE.bat

````bash
mkdir cm
cd cm
pip install cloudmesh-installer
cloudmesh-installer git clone cms
cloudmesh-installer git pull cms
cloudmesh-installer install cms -e
cms help
```

### CMS-AAA.bat

```bash
rmdir e-cloudmesh-command /s /q
mkdir e-cloudmesh-command
cd e-cloudmesh-command
cms sys command generate aa
cd cloudmesh-aa
pip install -e .
cms help
cms aa list
```


