
## Simple Build Container for MicroPython using MinGW

This container is designed to build MicroPython for Windows using the MinGW toolchain. 
It uses the same build process as the official MicroPython Docker container, but with the MinGW toolchain instead of the ARM toolchain.

It provides a consistent and isolated environment to ensure that the build process is reproducible and free from conflicts with other software on your system.


### Using the Container

This container is intended to be used by mpbuild to build MicroPython for Windows using the MinGW toolchain.
`mpbuild build windows standard`

You can also use it directly with docker starting from a clean checkout of MicroPython:

```bash
docker run -it --rm -v $(pwd):/micropython micropython/build-micropython-win-mingw
# in docker
cd micropython
make -C mpy-cross
make -C ports/windows CROSS_COMPILE=i686-w64-mingw32-
```

### Building the Container

To build the container run the following command:

```bash
docker build -t micropython/build-micropython-win-mingw:1.0 .
```

