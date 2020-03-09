#!/bin/bash
cd box/
mkdir seeds
echo "" > seeds/empty
timeout $1 ~/AFL-2.56b/afl-fuzz $2 -i seeds/ -o output -- ./target @@
