import os, sys

if len(sys.argv) != 4:
    instruments = "<native|afl-gcc|afl-clang>"
    targets = "<nm-new|size|readelf>"
    print("Usage: python %s <time> %s %s" % (sys.argv[0], instruments, targets))
    exit(1)

time = int(sys.argv[1])
inst = sys.argv[2]
targ = sys.argv[3]

if inst not in ["native", "afl-gcc", "afl-clang"]:
    print("Invalid instrumentation method: %s" % inst)
    exit(1)

if targ not in ["nm-new", "size", "readelf"]:
    print("Invalid target: %s" % targ)
    exit(1)

os.system("cd")
os.system("rm -rf ./box")
os.system("mkdir box")
os.system("cp ~/%s-targets/%s ./box/target" % (inst, targ))

if inst == "native":
    os.system("./afl.sh %d -Q" % time)
else:
    os.system("./afl.sh %d" % time)

os.system("mkdir -p outputs")
os.system("mv ./box/output outputs/output-%s-%s" % (targ, inst))
