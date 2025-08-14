# Cf. https://hub.docker.com/_/python/
FROM python:3.13-alpine@sha256:af1fd7a973d8adc761ee6b9d362b99329b39eb096ea3c53b8838f99bd187011e

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-08-05"
LABEL author="Florian Stosse"
LABEL description="Cpplint v2.0.2, built using Python v3.13 Alpine-based image"
LABEL license="MIT license"

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"

# Switch to the newly created user
USER appuser
COPY requirements.txt .

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install -r requirements.txt --user --no-cache-dir

ENTRYPOINT [ "cpplint" ]
