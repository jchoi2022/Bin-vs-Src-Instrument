### Comparison of Fuzzing With Binary vs. Source Instrumentation

Compare the performance of afl-gcc instrumentation, afl-clang-fast (a.k.a
llvm_mode) instrumentation, and QEMU instrumentation. Used AFL-2.56b as a
fuzzer, and four binutils programs (nm, objdump, readelf, size) as targets.

```
echo core | sudo tee /proc/sys/kernel/core_pattern
docker build -t comparison -f Dockerfile .
docker run --rm -it comparison
./run_all.sh
```
