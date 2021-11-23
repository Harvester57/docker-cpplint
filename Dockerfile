# Cf. https://hub.docker.com/_/python/
FROM python:3.10.0-alpine3.14

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "23-11-2021"
LABEL author "Florian Stosse"
LABEL description "Cpplint v1.5.5, built using Python v3.10 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install --trusted-host files.pythonhosted.org cpplint==1.5.5
