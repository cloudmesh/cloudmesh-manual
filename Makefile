package=manual
UNAME=$(shell uname)
VERSION=`head -1 VERSION`

GIT=https://github.com/cloudmesh
COMMUNITY=$(GIT)-community

HERCULES=docker run --rm srcd/hercules hercules
LABOURS=docker run --rm -i -v $(pwd):/io srcd/hercules labours
SOURCE=docs-source/source
API=docs-source/source/api

define banner
	@echo
	@echo "###################################"
	@echo $(1)
	@echo "###################################"
endef


all:
	pip install sphinx_rtd_theme
	cms debug off
	cms debug off
	make -f Makefile manual
	cms timer on
	cms debug on

install:
	pip install cloudmesh-installer -U
	cd ..; cloudmesh-installer new manual

# $(call banner, "use: make manual")

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


api:
	rm -rf docs-source/source/api
	rm -rf tmp
	mkdir -p tmp/cloudmesh
	cp -r ../cloudmesh-inventory/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-cmd5/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-sys/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-common/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-cloud/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-storage/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-volume/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-abstract/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-configuration/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-google/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-aws/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-azure/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-oracle/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-multipass/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-gui/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-openapi/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-sys/cloudmesh/* tmp/cloudmesh
	cp -r ../cloudmesh-test/cloudmesh/* tmp/cloudmesh
	sphinx-apidoc -f -o docs-source/source/api tmp/cloudmesh
	make -f Makefile api-index

api-index:
	echo "Cloudmesh Command API" > $(API)/index.rst
	echo "===============================" >> $(API)/index.rst
	echo "" >> $(API)/index.rst
	echo ".. toctree::" >> $(API)/index.rst
	echo "   :maxdepth: 1" >> $(API)/index.rst
	echo "" >> $(API)/index.rst

	cd $(API); ls -1 *.command.rst \
	| sed 's/^/   /' \
	| sed 's/.rst//' \
	| sort -u >> index.rst

	echo "" >> $(API)/index.rst
	echo "Cloudmesh API" >> $(API)/index.rst
	echo "===============================" >> $(API)/index.rst
	echo "" >> $(API)/index.rst
	echo ".. toctree::" >> $(API)/index.rst
	echo "   :maxdepth: 1" >> $(API)/index.rst
	echo "" >> $(API)/index.rst


	cd $(API); ls -1 *.rst \
	| fgrep -v command.rst | fgrep -v index.rst | fgrep -v modules.rst \
	| sed 's/^/   /' \
	| sed 's/.rst//' \
	| sort -u >> index.rst

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
	bin/authors.py

names:
	git config --global mailmap.file .mailmap
	make -f Makefile names-dir > .names.txt
	sort -u .names.txt > names.txt
	cat names.txt

names-dir:
	@cd ../cloudmesh-cmd5; git log | fgrep Author
	@cd ../cloudmesh-common; git log | fgrep Author
	@cd ../cloudmesh-sys; git log | fgrep Author
	@cd ../cloudmesh-openapi; git log | fgrep Author
	@cd ../cloudmesh-emr; git log | fgrep Author
	@cd ../cloudmesh-cloud; git log | fgrep Author
	@cd ../cloudmesh-storage; git log | fgrep Author
	@cd ../cloudmesh-manual; git log | fgrep Author
	@cd ../cloudmesh-cmsd; git log | fgrep Author
	@cd ../cloudmesh-volume; git log | fgrep Author
	@cd ../cloudmesh-abstract; git log | fgrep Author
	@cd ../cloudmesh-configuration; git log | fgrep Author

source:
	cd ../cloudmesh.common; make source
	$(call banner, "Install cloudmesh-cmd5")
	pip install -e . -U
	cms help

manual-new:
	mkdir -p $(SOURCE)/manual/flow
	cms man --kind=rst flow > $(SOURCE)/manual/flow/flow.rst
	mkdir -p $(SOURCE)/manual/openapi
	cms man --kind=rst openapi > $(SOURCE)/manual/openapi/openapi.rst


CMD5_COMMAND= admin banner clear echo default info pause plugin \
              q quit shell sleep stopwatch sys var version

COMPUTE_COMMAND= open vbox vcluster batch vm ip key sec secgroup image \
                 flavor ssh workflow yaml service config container group \
                 register test gui viewer info provider py

STORAGE_COMMAND= storage volume vdir

GROUP_COMMAND= group

CMSD_COMMAND= cmsd


#MANUAL=$(CMD5_COMMAND) $(COMPUTE_COMMAND) $(STORAGE_COMMAND)

#$(MANUAL): $(SOURCE)/manual/%.rst:
# 	cms man $@ --format=rst  > $(SOURCE)/manual/cmd5/$@.rst;

#pman: $(MANUAL)

#man:
#	make -j Makefile pman



manual:
	cms set timer=False
	mkdir -p $(SOURCE)/manual
	cms help > /tmp/commands.rst
	-echo "# Commands" > $(SOURCE)/manual/all.md
	-echo  >> $(SOURCE)/manual/all.md
	-echo  "\`\`\`" >> $(SOURCE)/manual/all.md
	-tail -n +4 /tmp/commands.rst >> $(SOURCE)/manual/all.md
	-echo  "\`\`\`" >> $(SOURCE)/manual/all.md
	cms man --dir=$(SOURCE)/manual --format=rst
	cms version --number > $(SOURCE)/manual/versions.txt
	make -f Makefile doc

authors:
	bin/authors.py > $(SOURCE)/preface/authors.md

doc: authors
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/cloudmesh-config/master/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	make -f Makefile api
	cd docs-source; make html
	cp -r $(SOURCE)/_ext docs-source/build/html
	cp -r $(SOURCE)/_templates docs-source/build/html
	cp -r docs-source/build/html/ docs
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml
	cp -r $(SOURCE)/inspector docs/inspector

pdf: authors
	mv ~/.cloudmesh/cloudmesh.yaml ~/.cloudmesh/cloudmesh.yaml-tmp
	wget -P ~/.cloudmesh https://raw.githubusercontent.com/cloudmesh/configuration/etc/cloudmesh.yaml
	rm -rf docs
	mkdir -p dest
	cd docs-source; make latex
	cd docs-source/build/latex; make
	mv ~/.cloudmesh/cloudmesh.yaml-tmp ~/.cloudmesh/cloudmesh.yaml

view:
	open docs/index.html

nist-install: nist-download nist-copy

nist-download:
	rm -rf ../nist
	git clone https://github.com/davidmdem/nist ../nist

nist-copy:
	cd cm4/api; rm -rf specs; mkdir specs;
	rsync -a --prune-empty-dirs --include '*/' --include '*.yaml' --exclude '*' ../nist/services/ ./cm4/api/specs/


#
# TODO: BUG: This is broken
#
#pylint:
#	mkdir -p docs/qc/pylint/cm
#	pylint --output-format=html cloudmesh > docs/qc/pylint/cm/cloudmesh.html
#	pylint --output-format=html cloud > docs/qc/pylint/cm/cloud.html

clean:
	$(call banner, "CLEAN")
	rm -rf dist
	rm -rf *.zip
	rm -rf *.egg-info
	rm -rf *.eggs
	rm -rf docs-source/build
	rm -rf build
	find . -type d -name __pycache__ -delete
	find . -name '*.pyc' -delete
	rm -rf .tox
	rm -f *.whl
	rm -rf docs
	rm -rf tmp

#	rm -f ./docs/_sources/todo.md.txt ./docs/_sources/todo.rst.txt
#	rm -f ./docs/todo.html
#	rm -rf ./docs-source/source/api


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
	# git push origin master --tags
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
	git push origin master --tags
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
