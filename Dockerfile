# Cf. https://hub.docker.com/_/python/
FROM python:3.15-alpine@sha256:0f9552bb28711333da16915ec146f5e6bb44a7fdac9ced15dc17c2e0206346dd

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
