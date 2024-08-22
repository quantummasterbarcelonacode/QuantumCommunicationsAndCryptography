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


# Communications quantiques et Cryptographie

Ceci sont les notes du cours sur les Communications Quantiques et la Cryptographie du Master en Science et Ingénierie Quantique de l'Université de Barcelone, donné par le Prof. Antonio Acín.

Nous donnons d'abord un résumé des techniques mathématiques requises dans le formalisme quantique : comment représenter les états quantiques, leur évolution et leur mesure. Ceci définit les règles communes à toute application d'information quantique. Ensuite, nous présentons l'unité de base de l'information quantique, appelé bit quantique ou qubit. Puis, nous passons à la cryptographie quantique, en mettant l'accent sur les protocoles de distribution quantique de clés. Enfin, nous discutons du problème de la communication quantique à longue distance.

- Matériel de cours créé par le Prof. Antonio Acín
- Rédaction en anglais par Luke Mortimer et Fionnuala Curran
- Traduction française par Dr. Hippolyte Dourdent et Dr. Raja Yehia
- Traduction espagnole par Júlia Barberà Rodríguez et Mariana Navarro Asan-Srain 


