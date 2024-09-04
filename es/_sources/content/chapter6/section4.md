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




# Protocolos de Estado Señuelo

La solución definitiva a los ataques PNS fue proporcionada por Hwang {cite}`decoy` en forma de los llamados protocolos de estado señuelo. En su versión más simple, Alice elige aleatoriamente si codifica su bit en un estado coherente débil con intensidades $\mu_1$ o $\mu_2$. Experimentalmente, esto no es particularmente difícil, lo único que Alice necesita hacer es modular la intensidad de la luz. Ella envía el estado a Bob, quien lo mide como se esperaría en una implementación de BB84. Al final del protocolo, Alice también anuncia la amplitud que realmente utilizó en la codificación, de modo que Bob puede estimar la tasa de fotones recibidos en los dos casos, $R_B^{(1)}$ y $R_B^{(2)}$. A continuación, mostramos cómo el uso de dos amplitudes permite a las partes honestas detectar a Eve cuando ella implementa el ataque PNS estándar. Esto no es una prueba de seguridad completa, pero ilustra las ideas principales del protocolo.

En ausencia de Eve, cuando Alice y Bob están conectados por una fibra con pérdidas, las dos tasas son $R_B^{(i)}=f\mu_i\eta_C$, para $i=1,2$. Por lo tanto, la razón entre estas dos amplitudes es igual a la razón de las amplitudes de los estados coherentes, $R_B^{(1)} /R_B^{(2)}=\mu_1/\mu_2$. Cuando Eve implementa los ataques PNS, las tasas obtenidas están básicamente determinadas por los pulsos de dos fotones, por lo que se tiene $R_B^{(i)}\sim p_2^{(i)}\sim\mu_i^2$. Por lo tanto, si Eve aplicara el ataque, Alice y Bob notarían una razón inesperada entre las dos tasas, que ahora escalaría como el cuadrado de la razón de las intensidades y no como la razón misma. En tal caso, Alice y Bob detendrían la comunicación insegura. Agregar más intensidades dificulta aún más la tarea de Eve y se puede demostrar que la tasa esperada tiende a la ideal, proporcional a $\eta_C$.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

