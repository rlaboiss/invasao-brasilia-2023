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
    states = []

    for line in proc.stdout:
        line_utf8 = line.decode("utf-8")

        m = re.match(r"\x0c?([A-ZÇÃÔÉÚÕÂÁÍÊ]+ [A-ZÇÃÔÉÚÕÂÁÍÊ ]+)$", line_utf8)
        if m:
            names.append(m.group(1))
        m = re.match(r"^([0-9]+)\.([0-9]+)\.([0-9][0-9][0-9][0-9])$", line_utf8)
        if m:
            dates.append(f"{m.group(3)}-{int(m.group(2)):02d}-{int(m.group(1)):02d}")
        m = re.match(r"^([A-T][A-Z])$", line_utf8)
        if m:
            states.append(m.group(1))

    if len(names) != len(dates):
        sys.stderr.write(f"{prog}:E: Different number of names and dates\n")
        exit(1)

    df = pd.DataFrame({'name': names, 'date': dates, 'uf': states})
    df.to_csv(sys.stdout, index=False)


if __name__ == "__main__":
    main()

