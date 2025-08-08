# Cf. https://hub.docker.com/_/python/
FROM python:3.13-alpine@sha256:f196fd275fdad7287ccb4b0a85c2e402bb8c794d205cf6158909041c1ee9f38d

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
