package=manual
UNAME=$(shell uname)
VERSION=`head -1 VERSION`
SHELL := /bin/bash
VENV=
PYTHON_VERSION=3.9.2

.PHONY: watch manual

GIT=https://github.com/cloudmesh
COMMUNITY=$(GIT)-community

HERCULES=docker run --rm srcd/hercules hercules
LABOURS=docker run --rm -i -v $(pwd):/io srcd/hercules labours
SOURCE=docs-source/source
API=docs-source/source/api
REGISTER=docs-source/source/register

ifeq ($(UNAME),Linux)
    OPEN=gopen
else
    OPEN=open
endif

define banner
	@echo
	@echo "###################################"
	@echo $(1)
	@echo "###################################"
endef

help:
	@echo "1. Install Python $(PYTHON_VERSION) from source"
	@echo "      make python"
	@echo
	@echo "2. Create venv ~/MANUAL"
	@echo "      make venv"
	@echo
	@echo "3. activate  ~/MANUAL"
	@echo "      source ~/MANUAL/bin/activate"
	@echo
	@echo "4. deploy"
	@echo "      make deploy"
	@echo
	@echo "5. manual"
	@echo "      make manual"


all:
	make -f Makefile manual
	cms debug off

checkenv:
ifneq (${VIRTUAL_ENV}, "${HOME}/MANUAL")
	@echo "Please make sure you created the env MANUAL with before running the make"
	@echo
	@echo "python -m venv ~/MANUAL"
	@echo "source ~/MANUAL/bin/activate"
	@echo
	@exit
endif

deploy:
	pip install pip -U
	pip install -r requirements.txt
	pip install cloudmesh-installer -U
	rm -rf docs-source/source/cm
	mkdir -p cm
	cd docs-source/source/cm; cloudmesh-installer get cms cmsd gui compute pi
	cms help

watch:
	find docs-source/ | entr -s 'make; make view'

install:
	cd ..; cloudmesh-installer new manual

python:
	sudo apt update
	sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev
	sudo apt install libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev
	wget https://www.python.org/ftp/python/$(PYTHON_VERSION)/Python-$(PYTHON_VERSION).tgz
	mkdir -p ~/local
	mv Python-$(PYTHON_VERSION).tgz $(HOME)/local
	cd $(HOME)/local; tar -xf Python-$(PYTHON_VERSION).tgz
	cd $(HOME)/local/Python-$(PYTHON_VERSION); ./configure --enable-optimizations
	cd $(HOME)/local/Python-$(PYTHON_VERSION); make -j 16
	cd $(HOME)/local/Python-$(PYTHON_VERSION); sudo make altinstall
	python3.9 --version

env:
	rm -rf ~/MANUAL
	python3.9 -m venv ~/MANUAL
	@echo
	@echo "Now copy and execute the following"
	@echo
	@echo "source ~/MANUAL/bin/activate"

dest/gitinspector/gitinspector.py:
	mkdir -p dest
	cd dest; git clone https://github.com/ejwa/gitinspector.git

inspect-book:
	python dest/gitinspector/gitinspector.py \
	   $(COMMUNITY)/book \
	   --grading=True \
	   --metrics=False \
	   --hard=True \
		--format=htmlembedded > $(SOURCE)/inspector/book.html
	cp -r $(SOURCE)/inspector docs/inspector

MODULES= \
cloudmesh-inventory \
cloudmesh-cmd5 \
cloudmesh-sys \
cloudmesh-common \
cloudmesh-cloud \
cloudmesh-storage \
cloudmesh-volume \
cloudmesh-abstract \
cloudmesh-configuration \
cloudmesh-google \
cloudmesh-aws \
cloudmesh-azure \
cloudmesh-oracle \
cloudmesh-multipass \
cloudmesh-gui \
cloudmesh-cmsd \
cloudmesh-installer \
cloudmesh-openapi \
cloudmesh-sys \
cloudmesh-test \
cloudmesh-javascript \
cloudmesh-ssh


# NOT INCLUDED

#../cloudmesh-analytics:
#../cloudmesh-audio:
#../cloudmesh-batch:
#../cloudmesh-box:
#../cloudmesh-cluster:
#../cloudmesh-comet:
#../cloudmesh-docker:
#../cloudmesh-emr:
#../cloudmesh-encrypt:
#../cloudmesh-flow:
#../cloudmesh-flow2:
#../cloudmesh-frugal:
#../cloudmesh-git:
#../cloudmesh-hadoop:
#../cloudmesh-iu:
#../cloudmesh-kubernetes:
#../cloudmesh-launcher:
#./cloudmesh-libcloud:
#../cloudmesh-manual:
#../cloudmesh-nist:
#../cloudmesh-nn:
#../cloudmesh-notebooks:
#../cloudmesh-pi-burn:
#../cloudmesh-pi-cluster:
#../cloudmesh-pi-cluster-Host:
#../cloudmesh-redshift:
#../cloudmesh-secchi:
#../cloudmesh-spark:
#../cloudmesh-storagelifecycle:
#../cloudmesh-sys:
#../cloudmesh-test:
#../cloudmesh-twitter:
#../cloudmesh-workflow:


inspect: dest/gitinspector/gitinspector.py
	for c in $(MODULES) ; do \
		python dest/gitinspector/gitinspector.py \
			$(GIT)/$$c \
	   	   	--grading=True \
	   		--metrics=False \
	   		--hard=True \
	   		--format=htmlembedded > $(SOURCE)/inspector/$$c.html; \
	done
	cp -r $(SOURCE)/inspector docs/inspector

contrib:
	git config --global mailmap.file .mailmap
	@bin/authors.py

register:
	mkdir -p $(REGISTER)
	cms register list sample --service=compute --kind=openstack > $(REGISTER)/compute-openstack.rst
	cms register list sample --service=compute --kind=aws > $(REGISTER)/compute-aws.rst
	cms register list sample --service=compute --kind=azure > $(REGISTER)/compute-azure.rst
	cms register list sample --service=compute --kind=google > $(REGISTER)/compute-google.rst
	cms register list sample --service=compute --kind=oracle > $(REGISTER)/compute-oracle.rst
	cms register list sample --service=compute --kind=multipass > $(REGISTER)/compute-multipass.rst
	#
	cms register list sample --service=volume --kind=openstack > $(REGISTER)/volume-openstack.rst
	cms register list sample --service=volume --kind=aws > $(REGISTER)/volume-aws.rst
	cms register list sample --service=volume --kind=azure > $(REGISTER)/volume-azure.rst
	cms register list sample --service=volume --kind=google > $(REGISTER)/volume-google.rst
	cms register list sample --service=volume --kind=oracle > $(REGISTER)/volume-oracle.rst
	cms register list sample --service=volume --kind=multipass > $(REGISTER)/volume-multipass.rst
	#
	cms register list sample --service=storage --kind=openstack > $(REGISTER)/storage-openstack.rst
	cms register list sample --service=storage --kind=awss3 > $(REGISTER)/storage-awss3.rst
	cms register list sample --service=storage --kind=azureblob > $(REGISTER)/storage-azureblob.rst
	cms register list sample --service=storage --kind=box > $(REGISTER)/storage-box.rst
	cms register list sample --service=storage --kind=local > $(REGISTER)/storage-local.rst
	cms register list sample --service=storage --kind=parallel > $(REGISTER)/storage-parallel.rst
	cms register list sample --service=storage --kind=parallelazureblob > $(REGISTER)/storage-parallelazureblob.rst
	cms register list sample --service=storage --kind=parallelgdrive > $(REGISTER)/storage-parallelgdrive.rst
	cms register list sample --service=storage --kind=oracle > $(REGISTER)/storage-oracle.rst
	fgrep "ERROR" $(REGISTER)/*.rst
	fgrep -i "TODO" $(REGISTER)/*.rst

manual-new:
	mkdir -p $(SOURCE)/manual/flow
	cms man --kind=rst flow > $(SOURCE)/manual/flow/flow.rst
	mkdir -p $(SOURCE)/manual/openapi
	cms man --kind=rst openapi > $(SOURCE)/manual/openapi/openapi.rst

manual:
	cms set timer=False
	mkdir -p $(SOURCE)/manual
	cms help > /tmp/commands.rst
	-echo "Command List" > $(SOURCE)/manual/all.rst
	-echo "============" >> $(SOURCE)/manual/all.rst
	-echo >> $(SOURCE)/manual/all.rst
	-echo "Not all commands  be listed here as cloudmesh can have plugins.\n" >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-echo  "::" >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-tail -n +5 /tmp/commands.rst | sed 's/^/  /' >> $(SOURCE)/manual/all.rst
	-echo  >> $(SOURCE)/manual/all.rst
	-echo  "" >> $(SOURCE)/manual/all.rst
	cms man --dir=$(SOURCE)/manual --format=rst
	cms version --number > $(SOURCE)/manual/versions.txt
	make -f Makefile doc

authors:
	git config --global mailmap.file .mailmap
	@bin/authors.py > $(SOURCE)/preface/authors.rst

auto:
	echo AUTO

doc: authors
	cms debug off
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/cloudmesh-config/main/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	cd docs-source; make html
	cp -r $(SOURCE)/_ext docs-source/build/html
	cp -r $(SOURCE)/_templates docs-source/build/html
	cp -r docs-source/build/html/ docs
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml
	cp -r $(SOURCE)/inspector docs/inspector
	touch docs/.nojekyll

pdf: authors
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	cd docs-source; make latex
	cd docs-source/build/latex; make
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml

view:
	$(OPEN) docs/index.html


clean:
	$(call banner, "CLEAN")
	rm -rf dist
	rm -rf *.zip
	rm -rf *.egg-info
	rm -rf *.eggs
	rm -rf docs-source/build
	rm -rf build
	rm -rf .tox
	rm -f *.whl
	rm -rf docs
	rm -rf tmp
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf
	rm -fr docs/_build/



######################################################################
# PYPI
######################################################################


twine:
	pip install -U twine

dist:
	python setup.py sdist bdist_wheel
	twine check dist/*

patch: clean
	$(call banner, "bbuild")
	bump2version --no-tag --allow-dirty patch
	python setup.py sdist bdist_wheel
	git push
	# git push origin main --tags
	twine check dist/*
	twine upload --repository testpypi  dist/*
	# $(call banner, "install")
	# sleep 10
	# pip install --index-url https://test.pypi.org/simple/ cloudmesh-$(package) -U
	make
	git commit -m "update ocumentation" docs
	git push

minor: clean
	$(call banner, "minor")
	bump2version minor --allow-dirty
	@cat VERSION
	@echo

release: clean
	$(call banner, "release")
	git tag "v$(VERSION)"
	git push origin main --tags
	python setup.py sdist bdist_wheel
	twine check dist/*
	twine upload --repository pypi dist/*
	$(call banner, "install")
	@cat VERSION
	@echo
	#sleep 10
	#pip install -U cloudmesh-common


dev:
	bump2version --new-version "$(VERSION)-dev0" part --allow-dirty
	bump2version patch --allow-dirty
	@cat VERSION
	@echo

reset:
	bump2version --new-version "4.0.0-dev0" part --allow-dirty

upload:
	twine check dist/*
	twine upload dist/*

pip:
	pip install --index-url https://test.pypi.org/simple/ cloudmesh-$(package) -U

#	    --extra-index-url https://test.pypi.org/simple

log:
	$(call banner, log)
	gitchangelog | fgrep -v ":dev:" | fgrep -v ":new:" > ChangeLog
	git commit -m "chg: dev: Update ChangeLog" ChangeLog
	git push
