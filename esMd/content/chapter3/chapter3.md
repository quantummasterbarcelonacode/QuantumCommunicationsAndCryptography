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



# Criptografía Cuántica 

El teorema de no clonación muestra que la TIC ofrece nuevas posibilidades pero también limitaciones en la forma en que se puede procesar la información en los estados cuánticos. La derivación de este teorema es sorprendentemente simple. De hecho, resulta estar conectada a una limitación más conocida del formalismo cuántico: que el proceso de medición perturba el estado del sistema. De hecho, la clonación perfecta violaría claramente el hecho de que el estado de un solo sistema cuántico no puede conocerse perfectamente. Si la clonación perfecta fuera posible, uno podría conocer todo sobre el estado de una sola partícula sin siquiera medirla, simplemente produciendo clones y midiendo estos, dejando el estado inicial intacto. Por otro lado, si la estimación perfecta fuera posible, uno podría clonar fácilmente haciendo primero una medición precisa del estado y luego preparando tantas copias como se desee.

Notablemente, estas limitaciones pueden convertirse en algo positivo, como se demuestra maravillosamente en la criptografía cuántica: dado que el proceso de medición perturba el estado de un sistema, la acción de cualquier adversario que intente leer la información cuántica que se propaga a través de un canal tiene un efecto detectable sobre el estado enviado. En otras palabras, la acción del adversario, también conocido como el espía, está limitada por la incapacidad de producir una copia perfecta del estado cuántico. Estas dos ideas están en la base de cualquier protocolo de criptografía cuántica. A continuación, presentamos varios de los principales resultados en criptografía cuántica. Con mayor exactitud, centramos todo nuestro análisis en la distribución de claves cuánticas. Esta es la aplicación de criptografía cuántica más avanzada, tanto desde un punto de vista teórico como experimental. Sin embargo, debe quedar claro que "criptografía cuántica" es un término general que se refiere a cualquier protocolo criptográfico que explote el formalismo cuántico.