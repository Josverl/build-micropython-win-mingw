# same approach as unix build
FROM gcc:14-bookworm

# Update package list, upgrade all packages to fix security vulnerabilities, 
# then install gcc-mingw-w64 along with additional packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --only-upgrade libc6 libc6-dev systemd libsystemd0 \
                                       libkrb5-3 libgssapi-krb5-2 libk5crypto3 libkrb5support0 \
                                       libglib2.0-0 libglib2.0-bin libglib2.0-data \
                                       libpng16-16 libgnutls30 && \
    apt-get install -y gcc-mingw-w64 && \
    apt-get remove -y postgresql-15 postgresql-client-15 \
                      libmagickcore-6.q16-6 libmagickwand-6.q16-6 imagemagick-6-common \
                      openssh-client openssh-sftp-server && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
