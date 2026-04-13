import os
import sys

paths = {
    "me": r"D:\ME",
    "techno": r"D:\Student Online (SO)\Techno\I3-GIC-1B\Semester2",
    "env": r"D:\Student Online (SO)\Code",
    "duck": r"D:\Rubber Duck",
    "mock": r"D:\Student Online (SO)\Mock Exam",
    "rdtc": r"D:\Student Online (SO)\RDTC"
}

if len(sys.argv) < 2:
    print("Available paths:")
    for key in paths:
        print(f" - {key}")
    sys.exit(0)

name = sys.argv[1].strip().lower()

if name in paths:
    print(paths[name])
else:
    print("ERROR")
    sys.exit(1)