#!/bin/bash

# Make sure everything is utf-8
for file in $(find . -name '*.md'); do
    encoding=$(file -i $file | awk -F"=" '{print $2}')
    if [ $encoding == "unknown-8bit" ]; then
        encoding=$(chardet $file | awk '{print $2}')
    fi
    if [ $encoding != "utf-8" ] && [ $encoding != "UTF-8-SIG" ] && [ $encoding != "ascii" ] && [ $encoding != "us-ascii" ]; then
        echo "Converting $file from $encoding to utf-8"
        iconv -f $encoding -t utf-8 $file -o $file
    fi
    encodingAfter=$(chardet $file | awk '{print $2}')
    echo $encoding $encodingAfter
done

# Run jupyter-book build on all language folders
jupyter-book build en/ -n --all
jupyter-book build es/ -n --all
jupyter-book build fr/ -n --all
