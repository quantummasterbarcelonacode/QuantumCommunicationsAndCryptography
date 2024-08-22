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


# Portes Quantiques


Bien que ces notes se concentrent sur la communication et la cryptographie quantiques, revoyons brièvement ici, pour des raisons d'exhaustivité, les opérations logiques de base agissant sur un qubit. Rappelons que tout calcul classique consiste en une séquence de portes logiques appliquées à une chaîne de bits. Chacune de ces portes peut toujours être décomposée en termes de portes AND et NOT. Ces deux opérations fournissent donc un ensemble universel de portes pour le calcul classique. On pourrait conclure que les ingrédients nécessaire au passage du calcul classique au calcul quantique est (i) d'encoder les bits classiques en qubits comme précédemment, $i\rightarrow\ket i$, et (ii) d'implémenter la version quantique de ces portes.

Lorsqu'on aborde le traitement de l'information quantique dans un système contrôlé (fermé), toute évolution est décrite par une opération unitaire $U$. Ces opérations sont réversibles, c'est-à-dire qu’en connaissant l'opération et l'état de sortie, on peut toujours reconstruire l'état d'entrée. Notez cependant que les portes OR et AND sont irréversibles, car le bit de sortie n'est pas suffisant pour inférer les deux bits d'entrée. Ainsi, pour incorporer le calcul classique standard dans le formalisme quantique, il faut d'abord le rendre réversible. C'est en effet possible, comme l'a montré Bennett dans {cite}`bennett1973logical`: tout calcul classique peut être rendu réversible sans augmentation exponentielle des ressources requises. Cela implique que tout calcul classique peut être simulé par des ressources quantiques de la manière suivante : d'abord, construire le calcul classique réversible équivalent, puis remplacer les bits classiques, ou cbits, par des qubits.



Dans ce schéma, la version quantique et réversible d’une opération $f$
Sur une chaîne de bits $\vec b$ se lit

```{math}
:label: revf
    U_f\ket{\vec b}\ket 0=\ket{\vec b}\ket{f(\vec b)} .
```

Par exemple, l'opération AND quantique peut être réalisée comme suit : un état auxiliaire dans l'état $\ket{0}$ est ajouté aux deux qubits d'entrée dans les états $\ket i$ et $\ket j$. Il est facile de voir qu'il existe une unitaire agissant sur un système de trois qubits qui effectue la transformation $\ket i\ket j\ket 0\rightarrow\ket
i\ket j\ket{i\cdot j}$. 

<!--Luke: rather than a dot, maybe $i \text{AND} j$ would be better?) -->

La discussion précédente montre que tout calcul classique peut être incorporé dans un ordinateur quantique, un dispositif capable de manipuler des états quantiques. Mais est-il possible d'aller plus loin ? Pour ce faire, il est important de caractériser l'ensemble de toutes les opérations quantiques sur un état quantique. Par exemple, il serait intéressant d'identifier, comme dans le cas classique, un ensemble de portes élémentaires dans lequel décomposer toute opération unitaire agissant sur un état initial de $N$ qubits. Un résultat fondamental dans cette direction a été fourni dans {cite}`barenco1995elementary`: l'ensemble constitué de toutes les opérations sur un qubit et de la porte CNOT est universel. Plus précisément, toute opération unitaire agissant sur un système de $N$-qubit, $U\in SU(2^N)$, peut être décomposée en une séquence d'opérations sur un qubit et de portes CNOT. En fait, il s'avère que toute opération « intriquante » à deux qubits est suffisante pour le calcul quantique lorsqu'elle est assistée par des opérations sur un qubit{cite}`bremner2002practical`. D'un point de vue plus pratique, il a été démontré que les portes de Hadamard ($U_H$), de phase ($U_{ph}$), $\pi/8$ ($U_{\pi/8}$) et CNOT sont universelles, i.e. toute opérations unitaire sur $N$-qubit peut être décomposée sous la forme de ces portes
{cite}`boykin1999universal`. Leurs expressions sont:

```{math}
:label:
  U_H = \frac{1}{\sqrt 2}\begin{pmatrix}1 & 1 \\
  1 & 1\\\end{pmatrix}\quad
  U_{ph} = \begin{pmatrix}1 & 0 \\
  0 & i\\\end{pmatrix}\quad
  U_{\pi/8} = \begin{pmatrix}1 & 0 \\
  0 & e^{i\pi/4}\\\end{pmatrix} .
```

L’implémentation de ces trois opérations sur un qubit et de la porte CNOT est suffisante pour toute proposition expérimentale d’ordinateur quantique. 
 
## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



