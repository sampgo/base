FROM fedora:latest

# Environmment variables
ENV CGO_ENABLED="1"
ENV GOOS="linux"
ENV GOARCH="386"

# Copy over project gomode
COPY . /app
WORKDIR /app

# Install build tools
RUN \
    yum update -y && yum upgrade -y && \
    yum install -y make automake gcc gcc-c++ kernel-devel libstdc++

# Install golang
RUN \
    yum install -y go

# Install 32 bit libc package.
RUN \
    yum install -y glibc-devel.i686

# Finally! build our gomode.
RUN \
    # No need to prepend our go compiler env vars.
    go build -buildmode=c-shared -o build/base.so main.go