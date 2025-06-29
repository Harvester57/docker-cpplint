# Docker Cpplint

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository provides a `Dockerfile` for building a lightweight, Alpine-based Docker image that contains `cpplint`, Google's C++ style checker.

The image is designed to be simple, secure, and easy to use in CI/CD pipelines or for local development.

## Image Details

*   **cpplint version**: `2.0.2`
*   **Python version**: `3.13`
*   **Base Image**: `python:3.13-alpine`
*   **Last Updated**: `2025-06-29`

## Usage

### Pulling from Docker Hub

You can pull a pre-built image from the GitHub repository (https://github.com/Harvester57/docker-cpplint/pkgs/container/docker-cpplint)

```bash
docker pull ghcr.io/harvester57/docker-cpplint:main
```

### Running `cpplint`

To run `cpplint` on your local source code, you should mount your project directory into the container. The container runs as a non-root user, and the working directory should be set to where your code is mounted.

Here is an example of how to check the `cpplint` version:

```bash
# Note: Use ${PWD} on Windows PowerShell
docker run --rm -it \
  -v "$(pwd):/app" -w /app \
  florianstosse/cpplint:latest cpplint --version
```

To lint a specific file or directory:

```bash
# Lint a single file
docker run --rm -it \
  -v "$(pwd):/app" -w /app \
  florianstosse/cpplint:latest cpplint src/my_file.cpp

# Lint all files in a directory recursively
docker run --rm -it \
  -v "$(pwd):/app" -w /app \
  florianstosse/cpplint:latest cpplint --recursive src/
```

## Building the Image Locally

If you prefer to build the image yourself, you can clone this repository and use the `docker build` command.

```bash
docker build -t my-cpplint-image .
```

You can then use `my-cpplint-image` in place of `florianstosse/cpplint:latest` in the commands above.

## Security: Non-Root User

For better security, the container runs as a dedicated non-root user named `appuser` with a static UID and GID of `666`.

```
UID=666(appuser) GID=666(appuser) groups=666(appuser)
```

When you mount a volume from your host machine, any files created by the container will be owned by user `666` on the host. If you encounter permission issues, ensure that your host user has the necessary permissions to read/write files owned by this UID.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

*Maintained by Florian Stosse.*