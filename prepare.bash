#!/usr/bin/env bash

set -e

python3 -m venv './venv'

source './venv/bin/activate'

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade setuptools

python3 -m pip install --upgrade --requirement './requirements.txt'

# you might need to install
# sudo apt install python3-venv


# generate a freeze file with
# pip freeze | grep -v 'pkg-resources' | sort > freezed-requirements.txt
