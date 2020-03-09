#!/bin/bash

python run.py 300 native nm-new
python run.py 300 afl-gcc nm-new
python run.py 300 afl-clang nm-new
python run.py 300 native objdump
python run.py 300 afl-gcc objdump
python run.py 300 afl-clang objdump
python run.py 300 native size
python run.py 300 afl-gcc size
python run.py 300 afl-clang size
python run.py 300 native readelf
python run.py 300 afl-gcc readelf
python run.py 300 afl-clang readelf
