# Cf. https://hub.docker.com/_/python/
FROM python:3.13-alpine@sha256:610020b9ad8ee92798f1dbe18d5e928d47358db698969d12730f9686ce3a3191

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-06-29"
LABEL author="Florian Stosse"
LABEL description="Cpplint v2.0.2, built using Python v3.13 Alpine-based image"
LABEL license="MIT license"

RUN apk update && \
    apk upgrade --available

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser
COPY requirements.txt .

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt --user --no-cache-dir