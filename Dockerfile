FROM ubuntu:18.04

### Install dependencies
RUN sed -i 's/archive.ubuntu.com/ftp.daumkakao.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get -yy install \
      wget apt-transport-https sudo vim git unzip xz-utils time flex \
      build-essential autoconf automake bison libtool libtool-bin gdb texinfo \
      libglib2.0-dev \
      clang-4.0

# Create a user and switch.
RUN useradd -ms /bin/bash tester && \
    adduser tester sudo && \
    echo "tester ALL = NOPASSWD : ALL" >> /etc/sudoers
USER tester
WORKDIR /home/tester

COPY --chown=tester:tester scripts/setup.sh ./setup.sh
RUN ./setup.sh
COPY --chown=tester:tester scripts/build.sh ./build.sh
RUN ./build.sh
COPY --chown=tester:tester scripts/run_all.sh ./run_all.sh
COPY --chown=tester:tester scripts/run.py ./run.py
COPY --chown=tester:tester scripts/afl.sh ./afl.sh
