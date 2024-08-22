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


# Pruebas de Seguridad

Las secciones anteriores resumieron algunos de los protocolos más conocidos para QKD segura y concluyeron con su estructura general. La intuición detrás de todos ellos es que un ataque por parte de Eve introduce errores detectables en el canal. El argumento intuitivo sigue sugiriendo que Alice y Bob pueden monitorear la presencia de estos errores y detener el protocolo, abortando el ataque de espionaje. Claramente, mientras que esta intuición sugiere que el esquema puede ser seguro, no es aceptable cuando se trata de implementaciones prácticas. En cualquier escenario realista, habrá errores que no se deben a Eve, sino que son simplemente una consecuencia del ruido en el canal y/o imperfecciones en los laboratorios de Alice y Bob. Por lo tanto, no podemos aceptar que Alice y Bob aborten el protocolo cada vez que observen errores.

El propósito de una prueba de seguridad es manejar un escenario ruidoso y hacer que los protocolos de QKD sean implementables en la práctica. La idea principal es que Alice y Bob deben concluir, a partir de la cantidad de errores observados, si pueden establecer una clave secreta. Pueden hacerlo porque en teoría cuántica es posible poner un límite a la información a la que Eve tiene acceso en función de la cantidad de errores (o correlaciones) entre Alice y Bob. Si Alice y Bob tienen una pequeña cantidad de errores (grandes correlaciones), Eve tiene poca información. Una prueba de seguridad cuantifica este balance.

A continuación, esbozamos los pasos principales en una prueba de seguridad. Nuestro propósito no es proporcionar una derivación detallada de estas pruebas, ya que suelen ser bastante técnicas y complicadas, sino señalar las ideas principales y los resultados utilizados en su derivación.