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



# Puertas Cuánticas 

Aunque estas notas se centran en la comunicación y la criptografía cuánticas, revisemos brevemente, para mayor claridad, las operaciones lógicas básicas que actúan sobre un cúbit. Recordemos que cualquier cálculo clásico consiste en una secuencia de puertas lógicas sobre una cadena de bits. Cualquiera de estas puertas siempre puede descomponerse en términos de puertas AND y NOT. Estas dos operaciones, entonces, proporcionan un conjunto universal de puertas para la computación clásica. Se concluiría que lo que se necesita para adaptar la computación clásica a la cuántica es (i) codificar los bits clásicos en bits cuánticos como se describió anteriormente, $i \rightarrow \ket i$, y (ii) implementar la versión cuántica de estas puertas.

Cuando se trata de procesamiento de información cuántica en un sistema controlado (cerrado), cualquier evolución se describe mediante una operación unitaria $U$. Estas operaciones son reversibles, es decir, conociendo la operación y el estado de salida, siempre se puede reconstruir el estado de entrada. Sin embargo, cabe señalar que las puertas OR y AND son irreversibles, ya que el bit de salida no es suficiente para inferir los dos bits de entrada.

Por lo tanto, para integrar la computación clásica estándar en el formalismo cuántico, primero hay que hacerla reversible. De hecho, esto es posible tal como mostró Bennett en {cite}`bennett1973logical`: cualquier cálculo clásico puede hacerse reversible sin un aumento exponencial de los recursos necesarios. Esto implica que cualquier cálculo clásico puede ser simulado por medios cuánticos, de la siguiente manera: primero se construye la computación clásica reversible equivalente y luego se reemplazan los bits clásicos, o cbits, por cúbits. En este esquema, la versión cuántica y reversible correspondiente de una operación $f$ sobre una cadena de bits $\vec b$ se representa como

```{math}
:label: revf
    U_f\ket{\vec b}\ket 0=\ket{\vec b}\ket{f(\vec b)} .
```

Por ejemplo, el AND cuántico puede ser el siguiente: se añade un estado auxiliar en el estado $\ket{0}$ a los dos cúbits de entrada en los estados $\ket i$ y $\ket j$. Es fácil ver que existe una operación unitaria que actúa sobre un sistema de tres cúbits mapeando $\ket i\ket j\ket 0 \rightarrow \ket i\ket j\ket{i \cdot j}$.

La discusión anterior muestra que cualquier cálculo clásico puede ser integrado en una computadora cuántica, un dispositivo capaz de manipular estados cuánticos. Sin embargo, sería interesante ver si es posible ir más allá. Para lograrlo, es importante caracterizar el conjunto de todas las operaciones cuánticas sobre un estado cuántico. Por ejemplo, sería interesante identificar, al igual que en el caso clásico, un conjunto de puertas elementales en el que descomponer cualquier operación unitaria que actúe sobre un estado inicial de $N$ cúbits. Un resultado fundamental en esta dirección fue proporcionado en {cite}`barenco1995elementary`: el conjunto de todas las operaciones de un solo cúbit más la puerta CNOT es universal. Específicamente, cualquier operación unitaria que actúe sobre un sistema de $N$ cúbits, $U\in SU(2^N)$, puede descomponerse como una secuencia de operaciones de un solo cúbit y puertas CNOT. En efecto, resulta que cualquier operación de entrelazamiento de dos cúbits es suficiente para la computación cuántica cuando se combina con operaciones de un solo cúbit {cite}`bremner2002practical`. Desde un punto de vista más práctico, se ha demostrado que las llamadas puertas Hadamard ($U_H$), fase ($U_{ph}$), $\pi/8$ ($U_{\pi/8}$) y CNOT son universales, es decir, cualquier operación unitaria de $N$ cúbits puede descomponerse en términos de estas puertas {cite}`boykin1999universal`. Sus expresiones son

```{math}
:label:
  U_H = \frac{1}{\sqrt 2}\begin{pmatrix}1 & 1 \\
  1 & 1\\\end{pmatrix}\quad
  U_{ph} = \begin{pmatrix}1 & 0 \\
  0 & i\\\end{pmatrix}\quad
  U_{\pi/8} = \begin{pmatrix}1 & 0 \\
  0 & e^{i\pi/4}\\\end{pmatrix} .
```

La implementación de las tres operaciones de un solo qubit anteriores y la puerta CNOT es suficiente para cualquier propuesta experimental de una computadora cuántica.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```