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



# Argumento de Bennett-Brassard-Mermin

Unos meses después del trabajo de Ekert, Bennett, Brassard y Mermin {cite}`BBM` escribieron un artículo demostrando que un protocolo de QKD al estilo de Ekert siempre puede transformarse en un protocolo equivalente sin entrelazamiento, al estilo BB84, en el que los estados son preparados por Alice y medidos por Bob. Su argumento es el siguiente:

En primer lugar, el papel de la violación de la desigualdad de Bell en la propuesta de Ekert es certificar que Alice y Bob comparten un estado de dos cúbits maximamente entrelazado. Sin embargo, existen otras mediciones que pueden proporcionar el mismo nivel de certificación. Por ejemplo, es el único estado que da correlaciones perfectas cuando ambas partes locales miden en las bases $x$ y $z$. Es decir, es el único estado de dos cúbits tal que 
$\bra{\psi}\sigma_x\otimes\sigma_x\ket{\psi}=
\bra{\psi}\sigma_z\otimes\sigma_z\ket{\psi}=1$. Por lo tanto, la detección del estado maximamente entrelazado puede realizarse igualmente a través de un protocolo en el que tanto Alice como Bob midan en las bases $x$ y $z$. Cabe señalar que ahora Alice no necesita introducir una tercera base para obtener resultados que estén perfectamente correlacionados con los de Bob.

El siguiente paso es notar que, al medir su partícula cuántica, Alice está preparando efectivamente un estado para Bob. En el caso ideal, Alice recibe la mitad de un estado maximamente entrelazado. Por lo tanto, su medición proyecta la partícula de Bob en un estado que coincide con el resultado de la medición de Alice. Esto se deduce de la siguiente observación:

```{math}
:label: 
  _A\bra{\pm x}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm x}_B \nonumber\\
  _A\bra{\pm z}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm
  z}_B .
```

Es decir, dependiendo de su elección de base, Alice está preparando un estado en la dirección positiva o negativa con una probabilidad igual a 1/2. Claramente, el protocolo resultante es equivalente al protocolo original en términos de seguridad. Pero el protocolo resultante no es más que el protocolo BB84 original y no requiere entrelazamiento. De este modo, los autores de la Ref. {cite}`BBM` concluyeron que el enfoque de Ekert no proporcionaba ninguna perspectiva nueva significativa sobre el problema de la QKD, porque ambos enfoques eran equivalentes.

Aparte de las implicaciones conceptuales, el trabajo de Bennett, Brassard y Mermin también fue importante desde un punto de vista técnico, ya que señaló una correspondencia interesante entre los protocolos basados en el entrelazamiento al estilo de Ekert y los protocolos de preparar y medir al estilo BB84. Por un lado, la mayoría de los protocolos basados en el entrelazamiento pueden ser mapeados a un protocolo equivalente de preparar y medir utilizando las ideas anteriores. Por otro lado, cualquier protocolo de preparar y medir puede ser mapeado a un protocolo equivalente basado en el entrelazamiento. Supongamos que en el protocolo inicial de preparar y medir Alice prepara los estados $\{\ket{\psi_i}\}$ con probabilidades $p_i$. Esto lo puede hacer Alice preparando un estado entrelazado 

```{math}
:label: 
    \sum_i \sqrt{p_i}\ket{i}_A\otimes\ket{\psi_i}_B ,
```

y midiendo en la base $\{\ket{i}\}$. 

Como discutimos en la siguiente sección, este paralelismo proporciona una importante simplificación conceptual y técnica en las pruebas de seguridad en QKD. Por lo general, las pruebas de seguridad de los protocolos de QKD se derivan en el escenario basado en el entrelazamiento, porque allí es más sencillo construirlas, pero en la práctica se implementa la versión equivalente de preparar y medir, ya que solo implica la preparación de estados de una sola partícula y mediciones.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```
