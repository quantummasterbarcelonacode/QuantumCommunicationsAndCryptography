
# Quantum Communications and Cryptography

This contains three folders containing the different versions: English (en/), French (fr/) and Spanish (es/).

Each of these is a separate [Jupyter-Book](https://jupyterbook.org/en/stable/intro.html).

To view the page, clone the repo and then open "QuantumCommunicationsAndCryptography/en/_build/html/content/intro.html" in your web browser, by double clicking o doing ctrl-o in your browser and then selecting the file. If this file doesn't exist then you need to compile the HTML files using the compileAll.sh script or by running 
```bash
jupyter-book build en/
```
for the language you want to compile.

When editing the pages (the Markdown .md files) you'll need to recompile and then refresh your browser to view the changes. LaTeX equations are supported, can also use Jupyter notebooks if we need to run code but I think for our case just Markdown is fine. See either the online guide for Jupyter books linked above or just look at the files I've already done for syntax examples.

When we are ready to make it public we can set it up with GitHub pages using the static HTML files, but that's for later, if it's private we can't so we have to test everything locally. Note than the hyperlinks between translations don't work and won't until we make it a proper webpage (because for now they are separate books so we can't use local file referencing between them).

The current logo thing is just something I generated with AI (thus we have copyright) to replace the default Jupyter logo that comes with the template. We don't have to keep it. Or I can generate something better, whatever you guys want.
