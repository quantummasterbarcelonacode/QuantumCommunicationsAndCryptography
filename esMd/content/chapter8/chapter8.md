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



# Escenario Independiente del Dispositivo

La solución a los anteriores ataques de hacking viene de el llamado escenario independiente del dispositivo (device-independent, DI) {cite}`diqkd`. En este planteamiento, los dispositivos cuánticos son vistos como cajas negras con las que los usuarios pueden interactuar, proporcionando una entrada clásica y obteniendo una salida clásica. El planteamiento DI es bastante general y, de hecho, puede aplicarse a cualquier protocolo de información cuántica, pero en lo que sigue nos centraremos en QKD.

Como se mencionó, en el escenario DI, los dispositivos son vistos como cajas negras cuánticas que procesan una entrada clásica para producir una salida clásica. Se supone que el proceso de entrada y salida en un dispositivo dado ocurre localmente, lo que significa que no está influenciado causalmente por lo que sucede en otros dispositivos. Esto se puede imponer, por ejemplo, sincronizando los dispositivos para que estos procesos de entrada y salida definan eventos separados espacialmente, y por lo tanto, no haya tiempo para que cualquier señal, ni siquiera las que se propagan a la velocidad de la luz, pueda ir de un dispositivo a otro. Sin embargo, puede haber otras formas de imponer esta suposición de no comunicación. En un contexto de QKD, Alice y Bob tienen cada uno un dispositivo, véase {numref}`difig`. Sin pérdida de generalidad, asumimos que sus entradas, etiquetadas por $x$ e $y$, pueden tomar $m$ valores posibles y sus salidas, etiquetadas por $a$ y $b$, pueden tomar $r$ resultados posibles, es decir, $x,y=1,\ldots,m$ and $a,b=1,\ldots,r$. Alice y Bob prueban sus dispositivos utilizando diferentes entradas y recopilando las estadísticas que generan. Esto se encapsula en la distribución de probabilidad condicional $p(ab|xy)$, que da la probabilidad de que Alice y Bob observen los resultados $a$ y $b$, respectivamente, cuando usan las entradas $x$ e $y$. Por lo tanto, tenemos una lista de $m^2r^2$ números reales, tales que $p(ab|xy)\geq 0$ y $\sum_{ab}p(ab|xy)=1$ para todo $x$ e $y$. Esta distribución de probabilidad condicional también se denomina *correlaciones*. El objetivo de un protocolo DIQKD es concluir a partir de estas correlaciones observadas, y solo de ellas, que las partes pueden destilar una clave secreta. Si este es el caso, no puede haber ninguna discrepancia entre el modelado y la implementación, ya que no se realiza ningún modelado en estos dispositivos, aparte del hecho de que lo que sea que ocurra internamente para producir la salida dada la entrada debe ser compatible con las leyes cuánticas.

```{figure} ./Correlations.png
---
height: 400px
name: difig
---
Escenario independiente del dispositivo: Alice y Bob modelan sus dispositivos como cajas negras cuánticas que producen una salida clásica dada una entrada clásica. La descripción del sistema se realiza mediante las estadísticas observadas, dada por la distribución de probabilidad condicional $p(ab|xy)$. Existen tres conjuntos principales de correlaciones físicas: clásica, cuánticas y no señalización (non-signalling). El primero está estrictamente incluido en el segundo, que a su vez está estrictamente incluido en el tercero.
```

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


