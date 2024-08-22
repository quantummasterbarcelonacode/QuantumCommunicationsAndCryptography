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

# The No-Cloning Theorem

The previous sections have shown that a quantum bit is richer than its classical counterpart
because it can exist in superposition states.
Interestingly, the encoding of information on quantum states also
suffer from limitations that do not appear in Classical
Information Theory. One of the most important differences is encapsulated by the quantum
no-cloning theorem, that shows that quantum information cannot be
copied. At first sight this is serious drawback for an information
theory. However, there are ways of circumventing this problem, as explained 
below. Moreover, this limitation can be turned into an
advantage, as shown by Quantum Cryptography. But let us
start by proving the no-cloning theorem, first presented by Wootters
and Zurek in {cite}`wootters1982single`.

Assume there is a machine duplicating the quantum state of a
system, i.e. for any  $\ket\psi\in\compl^d$, the
machine outputs $\ket{\psi}\ket{\psi}$. This quantum process has to be
mathematically described by a linear map $\L$,

```{math}
:label: clmach
    \L(\ket{\psi}\otimes\ket{C})=\ket{\psi}\otimes\ket{\psi} ,
```

where $\ket{C}$ is the state of the machine where the clone is
produced. Since this machine is assumed to work for any initial
state, when applied to two orthogonal states, one gets

```{math}
:label: clclon
  \L(\ket{0}\otimes\ket{C}) &=& \ket{0}\otimes\ket{0} \nonumber\\
  \L(\ket{1}\otimes\ket{C}) &=& \ket{1}\otimes\ket{1} .
```

If we now look to a superposition state, say $(\ket 0+\ket 1)/\sqrt 2$, and since any quantum operation $\L$ is linear,

```{math}
:label: 
    \L\left(\frac{1}{\sqrt 2}(\ket 0+\ket 1)\ket C\right)=
    \frac{1}{\sqrt 2}(\L\left(\ket 0\ket C\right)+\L\left(\ket 1\ket C\right))=
    \frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

which is not equal to two copies of the initial state,

```{math}
:label: 
    \frac{1}{\sqrt 2}(\ket 0+\ket 1)\otimes
    \frac{1}{\sqrt 2}(\ket 0+\ket 1) .
```

Therefore, the linearity of Quantum Mechanics makes the cloning
process impossible. Note that one can indeed construct a cloning
machine producing two copies of two orthogonal states
(Eq. {eq}`clclon`), a classical cloning machine. Unfortunately, it
fails when cloning any coherent superposition of these two states.
In other words, nonorthogonality is at the heart of the no-cloning
theorem.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

