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

These are the notes for the course on Quantum Communications and Cryptography of the Master
of Quantum Science and Engineering at the University of Barcelona, given by Prof. Antonio Acín.

We first give a summary of the mathematical techniques required in the quantum formalism: how to represent quantum states, their evolution and their measurement. This defines the rules common to any quantum information application. Then, we present the basic unit of quantum information, the so-called quantum bit or qubit. Then, we move to quantum cryptography, with an emphasis on quantum key distribution protocols. Finally, we discuss the problem of long-distance quantum communication. 

- Course material created by Prof. Antonio Acín
- English write-up by Luke Mortimer and Fionnuala Curran
- French translation by Dr. Hippolyte Dourdent and Dr. Raja Yehia
- Spanish translation by Júlia Barberà Rodríguez and Mariana Navarro Asan-Srain

