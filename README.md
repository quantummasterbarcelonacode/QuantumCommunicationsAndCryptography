
# Quantum Communications and Cryptography

The repo for the notes of the Quantum Communications and Cryptography course by Antonio Acin.

This contains three folders containing the different versions: English (en/), French (fr/) and Spanish (es/). For each language we also have the folders containing the original markdown (enMd, frMd, esMd).

Each of these is a separate [Jupyter-Book](https://jupyterbook.org/en/stable/intro.html).

To compile the HTML files from the book, first install jupyter-book:
```bash
sudo apt-get install python3 python3-pip -y
pip install jupyter-book
```
and then run:
```bash
bash ./compileAll.sh
```
to compile everything. That script also has some stuff that can be used to ensure consistency of formating.

