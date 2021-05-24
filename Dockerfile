FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && apt-get install -y \
    pkg-config build-essential autoconf bison re2c \
    libxml2-dev libsqlite3-dev