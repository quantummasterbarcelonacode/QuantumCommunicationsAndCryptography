
# Quantum Communications and Cryptography

This contains three folders containing the different versions: English (en/), French (fr/) and Spanish (es/). You also have a folder containing the original notes and figures for reference (og/).

Each of these is a separate [Jupyter-Book](https://jupyterbook.org/en/stable/intro.html).

To view the page, clone the repo and then open "QuantumCommunicationsAndCryptography/en/_build/html/index.html" in your web browser, either by double clicking or doing ctrl-o in your browser and then selecting the file. 

To compile the HTML files from the book, first install jupyter-book:
```bash
sudo apt-get install jupyter-book
```
and then run:
```bash
jupyter-book build en/
```
for the language you want to compile (in this case English).

When editing the pages (the Markdown .md files) you'll need to recompile and then refresh your browser to view the changes. There's a file I left called examples.md which contains the syntax and formatting that I used to convert the notes. 

When we are ready to make it public we can set it up with GitHub pages using the static HTML files, but that's for later, if it's private we can't so we have to test everything locally. Note than the hyperlinks between translations don't work and won't until we make it a proper webpage (because for now they are separate books and we can't use local file referencing between them).

The current logo thing is just something I generated with AI locally with stable diffision (thus we have copyright) to replace the default Jupyter logo that comes with the template. We don't have to keep it. Or I can generate something better, whatever you guys want.
