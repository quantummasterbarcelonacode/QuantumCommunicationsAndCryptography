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
        echo "Removing header from $file"
        tail -n +16 $file > temp.md
        mv temp.md $file
    fi

    # Add header.html to the top of each file
    echo "Adding header to $file"
    cat header.html $file > temp.md
    mv temp.md $file

done

# Fix all carriage returns
for file in $(find . -name '*.md'); do
    echo "Fixing carriage returns in $file"
    dos2unix $file
done

# Run jupyter-book build on all language folders
jupyter-book build enMd/ -n --all
jupyter-book build esMd/ -n --all
jupyter-book build frMd/ -n --all
rm -r en es fr
mv enMd/_build/html en
mv esMd/_build/html es
mv frMd/_build/html fr
rm -r enMd/_build esMd/_build frMd/_build

# For each of the built html files
for file in $(find . -wholename '*/content/*.html'); do
    echo "Removing html links from $file"
    sed -i 's/intro.html/intro/g' $file
    sed -i 's/chapter1.html/chapter1/g' $file
    sed -i 's/chapter2.html/chapter2/g' $file
    sed -i 's/chapter3.html/chapter3/g' $file
    sed -i 's/chapter4.html/chapter4/g' $file
    sed -i 's/chapter5.html/chapter5/g' $file
    sed -i 's/chapter6.html/chapter6/g' $file
    sed -i 's/chapter7.html/chapter7/g' $file
    sed -i 's/chapter8.html/chapter8/g' $file
    sed -i 's/chapter9.html/chapter9/g' $file
    sed -i 's/section1.html/section1/g' $file
    sed -i 's/section2.html/section2/g' $file
    sed -i 's/section3.html/section3/g' $file
    sed -i 's/section4.html/section4/g' $file
    sed -i 's/section5.html/section5/g' $file
    sed -i 's/section6.html/section6/g' $file
done
sed -i 's/index.html/index/g' index.html
sed -i 's/intro.html/intro/g' en/index.html
