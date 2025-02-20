# same base as unix build
FROM gcc:12-bookworm

# Update package list and install gcc-mingw-w64 along with additional packages
RUN apt update && apt install -y gcc-mingw-w64
