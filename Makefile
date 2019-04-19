package=cloud
UNAME=$(shell uname)
VERSION=`head -1 VERSION`

define banner
	@echo
	@echo "###################################"
	@echo $(1)
	@echo "###################################"
endef

all:doc

source:
	cd ../cloudmesh.common; make source
	$(call banner, "Install cloudmesh-cmd5")
	pip install -e . -U
	cms help

clean:
	$(call banner, "CLEAN")
	rm -rf dist
	rm -rf *.zip
	rm -rf *.egg-info
	rm -rf *.eggs
	rm -rf docs/build
	rm -rf build
	find . -name '__pycache__' -delete
	find . -name '*.pyc' -delete
	rm -rf .tox
	rm -f *.whl


manual:
	mkdir -p docs-source/source/manual
	cms help > /tmp/commands.rst
	echo "Commands" > docs-source/source/manual/commands.rst
	echo "========" >> docs-source/source/manual/commands.rst
	echo  >> docs-source/source/manual/commands.rst
	tail -n +4 /tmp/commands.rst >> docs-source/source/manual/commands.rst
	#
	# CMD5
	#
	mkdir -p docs-source/source/manual/cmd5
	cms man --kind=rst admin > docs-source/source/manual/cmd5/admin.rst
	cms man --kind=rst banner > docs-source/source/manual/cmd5/banner.rst
	cms man --kind=rst clear > docs-source/source/manual/cmd5/clear.rst
	cms man --kind=rst echo > docs-source/source/manual/cmd5/echo.rst
	cms man --kind=rst default > docs-source/source/manual/cmd5/default.rst
	cms man --kind=rst info > docs-source/source/manual/cmd5/info.rst
	cms man --kind=rst pause > docs-source/source/manual/cmd5/pause.rst
	cms man --kind=rst plugin > docs-source/source/manual/cmd5/plugin.rst
	cms man --kind=rst q > docs-source/source/manual/cmd5/q.rst
	cms man --kind=rst quit > docs-source/source/manual/cmd5/quit.rst
	cms man --kind=rst shell > docs-source/source/manual/cmd5/shell.rst
	cms man --kind=rst sleep > docs-source/source/manual/cmd5/sleep.rst
	cms man --kind=rst stopwatch > docs-source/source/manual/cmd5/stopwatch.rst
	cms man --kind=rst sys > docs-source/source/manual/cmd5/sys.rst
	cms man --kind=rst var > docs-source/source/manual/cmd5/var.rst
	cms man --kind=rst version > docs-source/source/manual/cmd5/version.rst
	#
	# COMPUTE
	#
	mkdir -p docs-source/source/manual/compute
	cms man --kind=rst open > docs-source/source/manual/compute/open.rst
	cms man --kind=rst vbox > docs-source/source/manual/compute/vbox.rst
	cms man --kind=rst vcluster > docs-source/source/manual/compute/vcluster.rst
	cms man --kind=rst batch > docs-source/source/manual/compute/batch.rst
	cms man --kind=rst vm > docs-source/source/manual/compute/vm.rst
	cms man --kind=rst network > docs-source/source/manual/compute/network.rst
	cms man --kind=rst key > docs-source/source/manual/compute/key.rst
	cms man --kind=rst secgroup > docs-source/source/manual/compute/secgroup.rst
	cms man --kind=rst image > docs-source/source/manual/compute/image.rst
	cms man --kind=rst flavor > docs-source/source/manual/compute/flavor.rst
	cms man --kind=rst ssh > docs-source/source/manual/compute/ssh.rst
	cms man --kind=rst workflow > docs-source/source/manual/compute/workflow.rst
	#
	# STORAGE
	#
	mkdir -p docs-source/source/manual/storage
	cms man --kind=rst storage > docs-source/source/manual//storage/storage.rst
	cms man --kind=rst vdir > docs-source/source/manual/storage/vdir.rst


doc:
	rm -rf docs
	mkdir -p dest
	cd docs-source; make html
	cp -r docs-source/build/html/ docs

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
	rm -rf docs/build
	rm -rf build
	find . -name '__pycache__' -delete
	find . -name '*.pyc' -delete
	rm -rf .tox
	rm -f *.whl


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
