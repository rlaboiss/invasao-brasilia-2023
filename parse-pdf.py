#!/usr/bin/python3

import sys
import os
import re
from subprocess import Popen, PIPE
import pandas as pd


def main():
    prog = os.path.basename(sys.argv[0])

    if len(sys.argv) != 2:
        sys.stderr.write(f"Usage: {prog} file\n")
        exit(1)

    proc = Popen(['pdftotext', sys.argv[1], "-"], stdout=PIPE, stderr=PIPE)

    names = []
    dates = []
    for line in proc.stdout:
        m = re.match(r"\x0c?[0-9]+ (.+)$", line.decode("utf-8"))
        if m:
            names.append(m.group(1))
        m = re.match(r"^([0-9][0-9]\.[0-9][0-9]\.[0-9][0-9][0-9][0-9])$",
                     line.decode("utf-8"))
        if m:
            dates.append("-".join(reversed(m.group(1).split("."))))

    if len(names) != len(dates):
        sys.stderr.write(f"{prog}:E: Different number of names and dates\n")
        exit(1)

    df = pd.DataFrame({'name': names, 'date': dates})
    df.to_csv('names-dates.csv', index=False)


if __name__ == "__main__":
    main()

