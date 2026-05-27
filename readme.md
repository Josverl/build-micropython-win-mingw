
## Simple Build Container for MicroPython using MinGW

This container is designed to build MicroPython for Windows using the MinGW toolchain. 
It uses the same build process as the official MicroPython Docker container, but with the MinGW toolchain instead of the ARM toolchain.

It provides a consistent and isolated environment to ensure that the build process is reproducible and free from conflicts with other software on your system.


### Using the Container

This container is intended to be used by mpbuild to build MicroPython for Windows using the MinGW toolchain.
`mpbuild build windows standard`

You can also use it directly with docker starting from a clean checkout of MicroPython:

```bash
docker run -it --rm -v $(pwd):/micropython josverlinde/build-micropython-win-mingw
# in docker
cd micropython
make -C mpy-cross
make -C ports/windows CROSS_COMPILE=i686-w64-mingw32-
```

### Building the Container

To build the container with the default settings (micropython owner):

```bash
just build
```

For local testing with a different owner (e.g., josverlinde):

```bash
just build josverlinde
```

This will build the image with version 2.0 and automatically tag it as latest.

### Versioning and Tagging

The container uses semantic versioning managed via the `justfile`. 

To build and push a new version:

1. **Build the image**:
   ```bash
   just build [owner]
   ```
   This builds the image as `micropython/build-micropython-win-mingw:2.0` and tags it as `latest`.

2. **Push to Docker Hub**:
   ```bash
   just push [owner]
   ```
   This pushes both the versioned tag (2.0) and the latest tag.
### Version History

| Version | Base Image         | Notes                                       |
|---------|--------------------|---------------------------------------------|
| 2.0     | gcc:14-bookworm    | Upgraded to GCC 14, added security updates  |
| 1.0     | gcc:12-bookworm    | Initial release                             |

