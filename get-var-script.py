#! /usr/bin/env python3

import string
import sys

tasks = list(range(120, 126))


result = 0
for symbol in sys.argv[1]:
    for num, elem in enumerate(string.ascii_lowercase):
        if symbol == elem:
            result += num
            break
print(tasks[result % len(tasks)])
# 123