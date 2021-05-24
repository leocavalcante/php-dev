FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    pkg-config build-essential autoconf bison re2c \
    libxml2-dev libsqlite3-dev

ADD ./php-src/ /usr/src/php/
RUN cd /usr/src/php/ && \
    ./buildconf && \
    ./configure --enable-debug && \
    make -j${nproc} && \
    make install

ENTRYPOINT [ "php", "-v" ]