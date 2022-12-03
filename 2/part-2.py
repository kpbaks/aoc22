import sys
import re

plays = {
    'A' : {
        'X': 1 + 3,
        'Y': 2 + 6,
        'Z': 3 + 0
    },
    'B' : {
        'X': 1 + 0,
        'Y': 2 + 3,
        'Z': 3 + 6
    },
    'C' : {
        'X': 1 + 6,
        'Y': 2 + 0,
        'Z': 3 + 3
    }
}

rotation = {
"A": "B",



regex = re.compile(r'^([A-C])\s([X-Z])$')


argc = len(sys.argv)
if argc != 2:
    print("Usage: ./part-1.py <filename>")
    sys.exit(1)

filename = sys.argv[1]
with open(filename, 'r') as f:

    score: int = 0

    for line in f:
        line = line.strip()
        if (match := regex.match(line)):
            score += plays[match.group(1)][match.group(2)]
            print(plays[match.group(1)][match.group(2)])


    print(f"Score: {score}")
