FROM python:3.8-alpine

LABEL maintainer "florian.stosse@safrangroup.com"
LABEL lastupdate "05-10-2020"
LABEL author "Florian Stosse"
LABEL description "Cpplint v1.5.4, built using Python v3.8 Alpine-based image"
LABEL license "MIT license"

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install cpplint==1.5.4