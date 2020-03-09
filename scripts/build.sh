#!/bin/bash

wget http://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.gz || exit 1
tar -xzf binutils-2.34.tar.gz || exit 1

cp -r binutils-2.34 binutils-gcov
cd binutils-gcov
CFLAGS="-g -fprofile-arcs -ftest-coverage" ./configure || exit 1
make || exit 1
mkdir /home/tester/gcov-targets/
cp binutils/nm-new binutils/objdump binutils/readelf binutils/size \
  /home/tester/gcov-targets  || exit 1
cd /home/tester

cp -r binutils-2.34 binutils-native
cd binutils-native
./configure || exit 1
make || exit 1
mkdir /home/tester/native-targets/
cp binutils/nm-new binutils/objdump binutils/readelf binutils/size \
  /home/tester/native-targets  || exit 1
cd /home/tester

cp -r binutils-2.34 binutils-afl-gcc
cd binutils-afl-gcc
CC=~/AFL-2.56b/afl-gcc ./configure || exit 1
CC=~/AFL-2.56b/afl-gcc make || exit 1
mkdir /home/tester/afl-gcc-targets/
cp binutils/nm-new binutils/objdump binutils/readelf binutils/size \
  /home/tester/afl-gcc-targets  || exit 1
cd /home/tester

cp -r binutils-2.34 binutils-afl-clang
cd binutils-afl-clang
CC=~/AFL-2.56b/afl-clang-fast ./configure || exit 1
CC=~/AFL-2.56b/afl-clang-fast make || exit 1
mkdir /home/tester/afl-clang-targets/
cp binutils/nm-new binutils/objdump binutils/readelf binutils/size \
  /home/tester/afl-clang-targets  || exit 1
cd /home/tester
