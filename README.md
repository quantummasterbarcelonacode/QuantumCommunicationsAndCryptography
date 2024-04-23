
# Quantum Communications and Cryptography

This contains three folders containing the different versions: English (en/), French (fr/) and Spanish (es/). You also have a folder containing the original notes and figures for reference (og/).

Each of these is a separate [Jupyter-Book](https://jupyterbook.org/en/stable/intro.html).

To view the page, clone the repo and then open "QuantumCommunicationsAndCryptography/en/_build/html/index.html" in your web browser, either by double clicking or doing ctrl-o in your browser and then selecting the file. 

To compile the HTML files from the book, first install jupyter-book:
```bash
sudo apt-get install python3 python3-pip -y
pip install jupyter-book
```
and then run:
```bash
jupyter-book build en/
```
for the language you want to compile (in this case English).

When editing the pages (the Markdown .md files) you'll need to recompile and then refresh your browser to view the changes. There's a file I left called examples.md which contains the syntax and formatting that I used to convert the notes. 
