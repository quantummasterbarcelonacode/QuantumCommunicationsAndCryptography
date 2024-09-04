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




# Comunicación Cuántica a Larga Distancia

En la última parte de las notas, nos enfocamos en el problema de la comunicación cuántica a larga distancia o, más generalmente, cómo enviar de manera confiable información cuántica a través de un canal ruidoso. El escenario es bastante similar a lo discutido hasta ahora, con Alice y Bob en ubicaciones distantes conectados por un canal cuántico. Sin embargo, ahora el objetivo es enviar información cuántica, no distribuir una clave secreta. Por lo tanto, no necesitamos incluir a Eve en el estudio.

En el escenario considerado, se asume que Alice y Bob pueden realizar cualquier tipo de operaciones cuánticas localmente y pueden comunicarse información clásica sin errores. Este conjunto de operaciones se denomina LOCC, por sus siglas en inglés (local operations and classical communication). Los usuarios pueden intercambiar estados cuánticos, pero solo a través de un canal ruidoso descrito por un mapa completamente positivo que preserva la traza (completely-positive trace-preserving, CPTP), $\Lambda$. El objetivo es caracterizar la máxima cantidad de cúbits que se pueden enviar de manera confiable desde Alice a Bob en función del número de usos del canal. Se proporcionará una definición formal en esta sección.



