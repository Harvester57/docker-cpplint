# Cf. https://hub.docker.com/_/python/
FROM python:3.15.0rc3-alpine@sha256:f288a00331ddad8ddf86aa9d83331f188d9a5b1999dea3762adf2af1968b0c04

LABEL org.opencontainers.image.authors="Florian Stosse <florian.stosse@gmail.com>"
LABEL org.opencontainers.image.created="2025-10-26"
LABEL org.opencontainers.image.description="Cpplint v2.0.2, built using Python Alpine-based image"
LABEL org.opencontainers.image.licenses="MIT license"

RUN addgroup -g 666 appuser && \
    adduser -D -h /home/appuser -u 666 -G appuser appuser

USER appuser
WORKDIR /home/appuser

ENV PATH="/home/appuser/.local/bin:${PATH}"

COPY requirements.txt .

# Cf. https://pypi.org/project/cpplint/
RUN pip3 install -r requirements.txt --user --no-cache-dir

ENTRYPOINT [ "cpplint" ]
