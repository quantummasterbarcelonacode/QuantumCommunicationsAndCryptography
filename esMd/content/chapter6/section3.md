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



# Protocolo SARG

El ataque PNS representaba una limitación importante para la implementación de QKD, pero tras su formulación surgieron varias soluciones. La primera de ellas es el protocolo Scarani-Acin-Ribordy-Gisin (SARG) {cite}`SARG`, que muestra cómo un simple cambio en la forma en que se procesa la información al implementar BB84 utilizando estados coherentes débiles reduce el impacto de los ataques PNS. En SARG, Alice prepara los mismos cuatro estados que en BB84, y Bob también realiza las mismas dos mediciones. Por lo tanto, a nivel cuántico, ambos protocolos son idénticos y no es necesario cambiar ningún hardware cuántico para pasar de BB84 a SARG. Sin embargo, Alice codifica su bit como se muestra en {numref}`SARGfig`: el bit $0$ ($1$) se codifica en $\ket{\pm z}$ ($\ket{\pm x}$), es decir, la base codifica el bit.

Veamos ahora cómo Alice y Bob realizan la reconciliación después de que los estados han sido preparados y medidos. Alice anuncia el estado enviado y uno de sus vecinos en la esfera de Bloch. Por ejemplo, si ha codificado el bit $0$ en el estado $\ket{+z}$, anuncia este estado y uno de los dos estados $\ket{\pm x}$. Sin perder generalidad, supongamos que anuncia $(+z,+x)$. ¿Existe una situación en la que Bob pueda concluir de manera determinística qué estado estaba enviando Alice a partir de la medición implementada y su resultado? Si Bob mide en la base $z$, obtendrá el resultado $+1$ con probabilidad uno. Sin embargo, este resultado es compatible con los dos estados anunciados por Alice, por lo que Bob no puede llegar a una discriminación inequívoca y esta ronda se descarta. Cuando Bob mide en la base $x$, puede obtener dos resultados posibles con probabilidad $1/2$. Si obtiene $+1$, este resultado nuevamente es compatible con los dos estados anunciados, por lo que esta instancia se descarta. Sin embargo, si obtiene $-1$, Bob concluye que el estado enviado no era $\ket{+x}$, por lo que tiene que ser $\ket{+z}$, es decir, Alice está codificando un $0$. Cabe señalar que el número de símbolos que se conservan después de esta reconciliación es, en promedio, la mitad de aquellos en los que Alice y Bob usan bases diferentes. Así que, en una situación ideal sin pérdidas y con estados de fotón único, este protocolo es peor que BB84.

```{figure} ./SARG.png
---
height: 400px
name: SARGfig
---
Codificación SARG: En el protocolo SARG, Alice prepara los mismos estados que en BB84, pero con una codificación distinta. Aquí, el bit enviado es codificado en la base preparada.
```

La principal ventaja del protocolo aparece al implementarlo con estados débilmente coherentes debido a su robustez contra los ataques PNS. Recordemos que el orden principal del ataque está dado por los pulsos en los que Alice prepara dos fotones con probabilidad $p(2)$. En este caso, Eve retiene un fotón y espera hasta la reconciliación para medir su partícula. Sin embargo, en SARG, y a diferencia de lo que ocurre en BB84, Eve tiene que distinguir entre estados no ortogonales ($\ket{+x}$ and $\ket{+z}$ en el ejemplo anterior), por lo que no puede distinguirlos perfectamente y no puede obtener toda la información.  Aunque se sale del alcance de estas notas, se puede demostrar que para el protocolo SARG, y de hecho para cualquier protocolo que emplee los cuatro estados de BB84, Eve puede aplicar otro tipo de ataque PNS que le da toda la información cuando utiliza pulsos con tres fotones. Este ataque, por lo tanto, funciona siempre que $p(3)\sim\eta_C\mu$, lo que da $\mu^2\sim\eta_C$. En otras palabras, la tasa en SARG escala como $R_B\sim \eta_C^{3/2}$, un escalamiento intermedio entre el caso sin ruido y BB84.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


