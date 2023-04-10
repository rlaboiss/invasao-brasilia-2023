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
    ufs = []

    state = "start"
    for line in proc.stdout:
        line_utf8 = line.decode("utf-8")
        m = re.match(r"\x0c?([A-ZÇÃÔÉÚÕÂÁÍÊ]+ [A-ZÇÃÔÉÚÕÂÁÍÊl ]+)$", line_utf8)
        if m:
            names.append(m.group(1))
            if state == "start":
                state = "got-name"
            else:
                dates.append("")
                state = "got-date"
        m = re.match(r"^([0-9]+)\.([0-9]+)\.([0-9][0-9][0-9][0-9])$", line_utf8)
        if m:
            dates.append(f"{m.group(3)}-{int(m.group(2)):02d}-{int(m.group(1)):02d}")
            if state == "got-name":
                state = "got-date"
        m = re.match(r"^([A-T][A-Z])$", line_utf8)
        if m:
            ufs.append(m.group(1))
            if state == "got-date":
                state = "start"

    if len(names) != len(dates):
        sys.stderr.write(f"{prog}:E: Different number of names and dates\n")
        exit(1)

    df = pd.DataFrame({'name': names, 'date': dates, 'uf': ufs})
    df.to_csv(sys.stdout, index=False)


if __name__ == "__main__":
    main()
