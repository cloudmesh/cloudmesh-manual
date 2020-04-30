#!/usr/bin/env python
from cloudmesh.common.Shell import Shell
from pprint import pprint

repos = [
    "cloudmesh-aws",
    "cloudmesh-azure",
    "cloudmesh-batch",
    "cloudmesh-box",
    "cloudmesh-cloud",
    "cloudmesh-cluster",
    "cloudmesh-cmd5",
    "cloudmesh-cmsd",
    "cloudmesh-comet",
    "cloudmesh-common",
    "cloudmesh-conda",
    "cloudmesh-configuration",
    "cloudmesh-docker",
    "cloudmesh-emr",
    "cloudmesh-flow",
    "cloudmesh-flow2",
    "cloudmesh-frugal",
    "cloudmesh-git",
    "cloudmesh-google",
    "cloudmesh-gui",
    "cloudmesh-installer",
    "cloudmesh-inventory",
    "cloudmesh-iu",
    "cloudmesh-manual",
    "cloudmesh-nist",
    "cloudmesh-nn",
    "cloudmesh-notebooks",
    "cloudmesh-openapi",
    "cloudmesh-openstack",
    "cloudmesh-oracle",
    "cloudmesh-redshift",
    "cloudmesh-storage",
    "cloudmesh-storagelifecycle",
    "cloudmesh-sys",
    "cloudmesh-workflow"]


lines = ""
for repo in repos:
    print()
    print (repo)
    result = Shell.run(f"cd ../{repo}; git shortlog --summary --numbered --email")
    lines = lines + result
    print (result)

lines = lines.replace("\t", " ")
names = []
for line in lines.split("\n"):
    line = line.strip()
    if line == "" or "dependabot" in line:
        continue
    try:
        number, name = line.split(" ", 1)
        names.append(name)
    except Exception as e:
        print (e, ">", line)

names = sorted(set(names))

for name in names:
    print(name)

for repo in repos:
    if repo != "cloudmesh-manual":
        command = f"cp .mailmap ../{repo}"
        print (command)
        r = Shell.run(command)
