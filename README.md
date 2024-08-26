<p style="text-align: center;">
    <a id="linken" href="../../../../en/content/index.html">English &#x1F1EC;&#x1F1E7;</a> - 
    <a id="linkfr" href="../../../../fr/content/index.html">Français &#x1F1EB;&#x1F1F7;</a> - 
    <a id="linkes" href="../../../../es/content/index.html">Español &#x1F1EA;&#x1F1F8;</a>
</p>
<script>
    currentPage = window.location.href;
    beforeLang = currentPage.slice(0, currentPage.indexOf("content") - 3);
    afterLang = currentPage.slice(currentPage.indexOf("content"));
    document.getElementById("linken").href = beforeLang + "en/" + afterLang;
    document.getElementById("linkfr").href = beforeLang + "fr/" + afterLang;
    document.getElementById("linkes").href = beforeLang + "es/" + afterLang;
</script>



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

