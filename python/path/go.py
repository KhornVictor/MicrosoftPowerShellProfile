import os
import sys

# ANSI colors (disabled when output is not a TTY or NO_COLOR is set)
USE_COLOR = sys.stdout.isatty() and os.getenv("NO_COLOR") is None
RESET = "\033[0m"
BOLD = "\033[1m"
DIM = "\033[2m"
RED = "\033[31m"
GREEN = "\033[32m"
YELLOW = "\033[33m"
CYAN = "\033[36m"


def color(text, style):
    if USE_COLOR:
        return f"{style}{text}{RESET}"
    return text


paths = {
    "me": r"C:\Users\Khorn Victor\ME",
    "techno": r"C:\Desktop\Student Online (SO)\Techno\I3-GIC-A\Semester2",
    "env": r"C:\Desktop\Student Online (SO)\Code",
    "duck": r"C:\Desktop\Rubber Duck",
    "mock": r"C:\Desktop\Student Online (SO)\Mock Exam",
    "rdtc": r"C:\Desktop\Student Online (SO)\RDTC\aero-service",
    "config": r"C:\Users\Khorn Victor\.config",
    "etec": r"C:\xampp\htdocs\ETEC",
    "camcycber": r"C:\Desktop\Student Online (SO)\Camcycber",
    "autohotkey": r"C:\Users\Khorn Victor\OneDrive\Documents\AutoHotkey"
}

if len(sys.argv) < 2:
    print(f"{color('Available paths', BOLD + CYAN)}:")
    key_width = max(len(key) for key in paths)
    for index, (key, value) in enumerate(paths.items(), start=1):
        number = color(str(index).rjust(2), DIM)
        key_label = color(key.ljust(key_width), GREEN)
        arrow = color("->", DIM)
        print(f"  {number}. {key_label} {arrow} {value}")
    print()
    print(f"Usage: {color('go.py <name>', YELLOW)}")
    sys.exit(0)

name = sys.argv[1].strip().lower()

if name in paths:
    print(paths[name])
else:
    error_label = color("ERROR", BOLD + RED)
    hint = color("run go.py with no arguments to list available keys", YELLOW)
    print(f"{error_label}: '{name}' is not a known path ({hint})")
    sys.exit(1)