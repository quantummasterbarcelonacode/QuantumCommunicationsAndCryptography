#!/bin/bash
sudo apt-get install python3 python3-pip
pip install jupyter-book
jupyter-book build en/ -n --all
jupyter-book build es/ -n --all
jupyter-book build fr/ -n --all
