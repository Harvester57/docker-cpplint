# Cf. https://hub.docker.com/_/python/
FROM python:3.10.3-alpine3.15

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "2022-03-04"
LABEL author "Florian Stosse"
LABEL description "Cpplint v1.6.0, built using Python v3.10.2 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install --trusted-host files.pythonhosted.org cpplint==1.6.0
