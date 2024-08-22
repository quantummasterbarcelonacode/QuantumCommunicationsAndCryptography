#!/bin/bash

# Make sure everything is utf-8
#for file in $(find . -name '*.md'); do
    #encoding=$(file -i $file | awk -F"=" '{print $2}')
    #if [ $encoding == "unknown-8bit" ]; then
        #encoding=$(chardet $file | awk '{print $2}')
    #fi
    #if [ $encoding != "utf-8" ] && [ $encoding != "UTF-8-SIG" ] && [ $encoding != "ascii" ] && [ $encoding != "us-ascii" ]; then
        #echo "Converting $file from $encoding to utf-8"
        #iconv -f $encoding -t utf-8 $file -o $file
    #fi
    #encodingAfter=$(chardet $file | awk '{print $2}')
    #echo $encoding $encodingAfter
#done

# Add the language link to the top of each file
for file in $(find . -name '*.md'); do

    # Check if the first character is a <
    if [ "$(head -c 1 $file)" == "<" ]; then
        echo "Skipping $file"
        continue
    fi

    # Add header.html to the top of each file
    echo "Adding header to $file"
    cat header.html $file > temp.md
    mv temp.md $file

done

# Run jupyter-book build on all language folders
jupyter-book build enMd/ -n --all
jupyter-book build esMd/ -n --all
jupyter-book build frMd/ -n --all
rm -r en es fr
mv enMd/_build/html en
mv esMd/_build/html es
mv frMd/_build/html fr
