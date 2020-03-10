#!/bin/bash

python run.py 600 native nm-new
python run.py 600 afl-gcc nm-new
python run.py 600 afl-clang nm-new
python run.py 600 native size
python run.py 600 afl-gcc size
python run.py 600 afl-clang size
python run.py 600 native readelf
python run.py 600 afl-gcc readelf
python run.py 600 afl-clang readelf
