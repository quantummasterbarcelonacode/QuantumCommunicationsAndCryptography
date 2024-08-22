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


# Comunicaciones y Criptografía Cuánticas

Estas son las notas del curso de Comunicaciones y Criptografía Cuánticas del Máster en Ciencia y Tecnología Cuánticas de la Universidad de Barcelona, impartido por el Prof. Antonio Acín.

Primero, damos un resumen de las técnicas matemáticas requeridas en el formalismo cuántico: cómo representar los estados cuánticos, su evolución y su medición. Esto define las reglas comunes a cualquier aplicación de la información cuántica. Luego, presentamos la unidad básica de la información cuántica, el llamado bit cuántico o cúbit. A continuación, nos movemos hacia la criptografía cuántica, con un énfasis en los protocolos de distribución de claves cuánticas. Finalmente, discutimos el problema de la comunicación cuántica a larga distancia.

- Material del curso creado por el Prof. Antonio Acín
- Redacción en inglés por Luke Mortimer y Fionnuala Curran
- Traducción al francés por Dr. Hippolyte Dourdent y Dr. Raja Yehia
- Traducción al español por Júlia Barberà-Rodríguez y Mariana Navarro Asan-Srain
