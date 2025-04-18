# Cf. https://hub.docker.com/_/python/
FROM python:3.13.3-alpine3.20

LABEL maintainer="florian.stosse@gmail.com"
LABEL lastupdate="2025-04-08"
LABEL author="Florian Stosse"
LABEL description="Cpplint v2.0.2, built using Python v3.13.2 Alpine-based image"
LABEL license="MIT license"

RUN addgroup -g 666 appuser && \
    mkdir -p /home/appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser && \
    chown -R appuser:appuser /home/appuser
ENV PATH="/home/appuser/.local/bin:${PATH}"
USER appuser

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install --upgrade pip && \
    pip3 install --trusted-host files.pythonhosted.org cpplint==2.0.2
