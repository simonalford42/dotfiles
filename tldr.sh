#!/usr/bin/env bash

# https://stackoverflow.com/a/36539692/4383594
# You can use -k option to run specific test cases
pytest -k test_001
# just ones which failed the last test
pytest --last-failed

# python string format to 2 decimal places
a = 5/3; print(f'{a:.2f}')

