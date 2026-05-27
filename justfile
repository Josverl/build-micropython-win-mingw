# https://just.systems

# Set shell for Windows OSs:
set windows-shell := ["pwsh.exe", "-NoLogo", "-Command"]
# use uv for [script] tasks:
set script-interpreter := ['uv', 'run', '--script']

cur_version := "2.0"
def_owner := "micropython"

# Build the Docker image for building MicroPython stubs on Windows using MinGW
build owner=def_owner version=cur_version:
    docker build -t {{owner}}/build-micropython-win-mingw:{{version}} .
    docker tag {{owner}}/build-micropython-win-mingw:{{version}} {{owner}}/build-micropython-win-mingw:latest

# Push the Docker image to Docker Hub
push owner=def_owner version=cur_version:
    docker push {{owner}}/build-micropython-win-mingw:{{version}}
    docker push {{owner}}/build-micropython-win-mingw:latest