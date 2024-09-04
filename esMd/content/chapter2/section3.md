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



```{math}
\def\compl{{\mathbb{C}}}
\def\L{{\cal L}}
```

# El Teorema de No Clonación

Las secciones anteriores han mostrado que un bit cuántico es más rico que su contraparte clásica porque puede existir en estados de superposición. Curiosamente, la codificación de información en estados cuánticos también presenta limitaciones que no aparecen en la Teoría de la Información Clásica. Una de las diferencias más importantes está encapsulada en el teorema de no clonación cuántico, que demuestra que la información cuántica no puede ser copiada. A primera vista, esto parece una desventaja grave para una teoría de la información. Sin embargo, existen formas de sortear este problema, como se explica a continuación. Además, esta limitación puede convertirse en una ventaja, como lo demuestra la Criptografía Cuántica. Pero comencemos demostrando el teorema de no clonación, presentado por Wootters y Zurek en {cite}`wootters1982single`.

Supongamos que existe una máquina que duplica el estado cuántico de un sistema, es decir, para cualquier $\ket\psi \in \compl^d$, la máquina produce $\ket{\psi}\ket{\psi}$. Este proceso cuántico debe ser descrito matemáticamente por un mapa lineal $\L$,

```{math}
:label: clmach
    \L(\ket{\psi}\otimes\ket{C})=\ket{\psi}\otimes\ket{\psi} ,
```

donde $\ket{C}$ es el estado de la máquina en la que se produce el clon. Dado que se asume que esta máquina funciona para cualquier estado inicial, al aplicarla a dos estados ortogonales, se obtiene

```{math}
:label: clclon
  \L(\ket{0}\otimes\ket{C}) &=& \ket{0}\otimes\ket{0} \nonumber\\
  \L(\ket{1}\otimes\ket{C}) &=& \ket{1}\otimes\ket{1} .
```

Si ahora consideramos un estado de superposición, digamos $(\ket 0+\ket 1)/\sqrt 2$, y dado que cualquier operación cuántica $\L$ es lineal,

```{math}
:label: 
    \L\left(\frac{1}{\sqrt 2}(\ket 0+\ket 1)\ket C\right)=
    \frac{1}{\sqrt 2}(\L\left(\ket 0\ket C\right)+\L\left(\ket 1\ket C\right))=
    \frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

lo cual no es igual a dos copias del estado inicial,

```{math}
:label: 
    \frac{1}{\sqrt 2}(\ket 0+\ket 1)\otimes
    \frac{1}{\sqrt 2}(\ket 0+\ket 1) .
```

Por lo tanto, la linealidad de la Mecánica Cuántica hace que el proceso de clonación sea imposible. De hecho, cabe destacar que se puede construir una máquina de clonación que produzca dos copias de dos estados ortogonales (Ec. {eq}`clclon`), una máquina de clonación clásica. Desafortunadamente, esta falla al clonar cualquier superposición coherente de estos dos estados. En otras palabras, la no ortogonalidad está en el corazón del teorema de no clonación.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```
