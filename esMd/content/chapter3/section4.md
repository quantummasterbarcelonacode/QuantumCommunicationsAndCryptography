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


# Protocolo de Ekert

En todos los protocolos anteriores, excepto en el último, el entrelazamiento no juega ningún papel: Alice prepara estados de una sola partícula que son enviados y medidos por Bob. En 1991, Artur Ekert propuso un esquema novedoso para la distribución segura de claves cuánticas basado en estados entrelazados y en la violación de la desigualdad de Bell {cite}`Ekert`. Ekert no estaba al tanto del trabajo previo de Bennett y Brassard, que apareció en las actas de una conferencia de informática. De hecho, él (re)descubrió la QKD de manera independiente. Sin embargo, su enfoque del problema parecía ser completamente diferente, basado en las violaciones de la desigualdad de Bell producidas por estados entrelazados, en lugar de la no ortogonalidad de los estados cuánticos.

El protocolo de Ekert funciona de la siguiente manera (aquí proporcionamos una versión ligeramente diferente de su protocolo original, que es más simple pero conceptualmente equivalente): Alice y Bob reciben bits cuánticos correlacionados que se supone que están en un estado maximamente entrelazado, digamos el estado {eq}`bellstate`. Alice y Bob aplican cada uno las dos mediciones $A_1$, $A_2$ y $B_1$ y $B_2$ dadas en {numref}`CHSHfig`, que maximizan el valor de la desigualdad de CHSH. Además, Alice realiza una tercera medición $A_3$ en la misma dirección que una de las mediciones de Bob, digamos $B_1$, para obtener resultados perfectamente correlacionados. La idea es que las partes honestas obtienen una clave a partir de $A_3$ y $B_1$, que están perfectamente alineadas. Luego, calculan el valor de CHSH para garantizar que comparten un estado maximamente entrelazado. En el caso ideal, este parámetro debería ser igual a $2\sqrt{2}$.

La intuición es que si las mediciones de Alice y Bob derivan a una violación de la desigualdad de Bell, no existe un modelo de variables ocultas locales que reproduzca los resultados. Esta ausencia de un modelo de variables ocultas locales debería garantizar la privacidad de los resultados obtenidos. En otras palabras, si Eve pudiera predecir los resultados de las partes honestas, esto constituiría un modelo de variables ocultas locales para el experimento. Sin embargo, esto es imposible porque los datos observados violan una desigualdad de Bell. Claramente, este es solo el argumento intuitivo que llevó a Ekert a la construcción de este protocolo, pero no representa una prueba de seguridad.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

