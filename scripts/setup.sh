#!/bin/bash

sudo ln -s /usr/bin/llvm-config-4.0 /usr/bin/llvm-config
sudo ln -s /usr/bin/clang-4.0 /usr/bin/clang
sudo ln -s /usr/bin/clang++-4.0 /usr/bin/clang++

wget https://github.com/google/AFL/archive/v2.56b.zip || exit 1
unzip v2.56b.zip || exit 1
cd AFL-2.56b
make || exit 1
cd llvm_mode && AFL_TRACE_PC=1 make || exit 1
cd ../
cd qemu_mode && ./build_qemu_support.sh || exit 1
cd ../ 
cd /home/tester
