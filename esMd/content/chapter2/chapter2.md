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


# Elementos Básicos de la Teoría de la Información Cuántica

La sección anterior resume el formalismo cuántico y presenta las principales herramientas que se necesitarán a continuación. En esta sección, introducimos algunos de los conceptos más básicos en la Teoría de la Información Cuántica (TIC): el bit cuántico y las puertas cuánticas (o operaciones). Una vez que todos estos conceptos hayan sido introducidos, ilustraremos, a través del teorema de la no clonación y el teorema de Bell, cómo la TIC puede diferir drásticamente de su contraparte clásica.


