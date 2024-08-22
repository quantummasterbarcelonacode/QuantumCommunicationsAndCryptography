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

# Le Théorème de Non-Clonage


Les sections précédentes ont montré qu'un qubit quantique est plus sophistiqué que son homologue classique car il peut exister dans des états de superposition. Paradoxalement, l'encodage de l'information sur les états quantiques souffre également de limitations qui n'apparaissent pas dans la Théorie de l'Information Classique. L'une des différences les majeures réside dans le théorème de non-clonage, qui démontre que l'information quantique ne peut pas être copiée. À première vue, il s'agit d'un sérieux inconvénient pour une théorie de l'information. Cependant, il existe des moyens de contourner ce problème, comme expliqué ci-dessous. De plus, cette limitation peut être transformée en avantage, comme le montre la Cryptographie Quantique. Mais commençons par donner  la preuve du théorème de non-clonage, présentée pour la première fois par Wootters et Zurek dans {cite}`wootters1982single`.


<!--Hippo: not exactly… say a bit more about the history or give ref ?-->


Supposons qu'il existe une machine capable de dupliquer l'état quantique d'un système, c'est-à-dire que pour tout $\ket\psi\in\compl^d$, la machine produirait $\ket{\psi}\ket{\psi}$. Ce processus quantique hypothétique doit être mathématiquement décrit par une application linéaire $\L$,
```{math}
:label: clmach
    \L(\ket{\psi}\otimes\ket{C})=\ket{\psi}\otimes\ket{\psi} ,
```

où $\ket{C}$ est l'état de la machine dans lequel le clone est produit. Puisque cette machine est censée fonctionner pour tout état initial, lorsqu'elle est appliquée à deux états orthogonaux, on obtient
```{math}
:label: clclon
  \L(\ket{0}\otimes\ket{C}) &=& \ket{0}\otimes\ket{0} \nonumber\\
  \L(\ket{1}\otimes\ket{C}) &=& \ket{1}\otimes\ket{1} .
```

Si nous examinons maintenant un état en superposition, par exemple $(\ket{0}+\ket{1})/\sqrt{2}$, et puisque toute opération quantique $\L$ est linéaire,

```{math}
:label: 
    \L\left(\frac{1}{\sqrt 2}(\ket 0+\ket 1)\ket C\right)=
    \frac{1}{\sqrt 2}(\L\left(\ket 0\ket C\right)+\L\left(\ket 1\ket C\right))=
    \frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

ce qui n'est pas égal à deux copies de l'état initial,

```{math}
:label: 
    \frac{1}{\sqrt 2}(\ket 0+\ket 1)\otimes
    \frac{1}{\sqrt 2}(\ket 0+\ket 1) .
```

Par conséquent, la linéarité de la Mécanique Quantique rend le processus de clonage impossible. Notez que l'on peut en effet construire une machine de clonage produisant deux copies de deux états orthogonaux (Eq. {eq}`clclon`), une machine de clonage classique. Malheureusement, elle échoue lorsqu'il s'agit de cloner toute superposition cohérente de ces deux états. En d'autres termes, la non-orthogonalité est au cœur du théorème de non-clonage.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


