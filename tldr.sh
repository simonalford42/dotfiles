#!/usr/bin/env bash
# or maybe??
#!/bin/zsh

# add ssh host for vscode
addnode node-name

# https://stackoverflow.com/a/36539692/4383594
# You can use -k option to run specific test cases
pytest -k test_001
# just ones which failed the last test
pytest --last-failed

# python string format to 2 decimal places
a = 5/3; print(f'{a:.2f}')

# find text in files
grep -rnw '/path/to/somewhere/' -e 'pattern'

# update submodule
# https://stackoverflow.com/questions/8191299/update-a-submodule-to-the-latest-commit/8191413#8191413

# find file with name thisfile.txt
find . -name thisfile.txt

