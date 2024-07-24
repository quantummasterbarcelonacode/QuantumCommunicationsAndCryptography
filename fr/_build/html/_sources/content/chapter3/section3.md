```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Autres Protocoles

Le protocole BB84 distribue une clé secrète entre Alice et Bob en utilisant des états quantiques préparés par Alice, envoyés à travers un canal non sécurisé et mesurés par Bob. Ce type de protocole est connu sous le nom de « préparer et mesurer » (« prepare and measure »). Il est clair que la construction est beaucoup plus générale que le BB84 et que l'on peut concevoir de nombreux autres protocoles de distribution de clés sécurisées basés sur cette idée. Le but principal de cette section est de présenter certains d'entre eux. On peut trouver de nombreux autres protocoles QKD dans la littérature. Ici, nous choisissons ceux qui ont représenté une avancée théorique importante.

## B92

La principale raison pour laquelle Eve ne peut pas lire l'information encodée dans les états quantiques envoyés est qu'Alice les choisit à partir d'un ensemble contenant des états quantiques non orthogonaux. Étant non orthogonaux, Eve ne peut pas les cloner ou les mesurer tous sans introduire des erreurs détectables. En 1992, Bennett a démontré que deux états non orthogonaux suffisent pour une distribution sécurisée de clés quantiques (QKD) {cite}`B92`. L'intérêt de ce protocole réside dans le fait qu'il implique le nombre minimal d'états préparés, à savoir deux.
Le protocole fonctionne comme suit. Alice encode un bit aléatoire dans deux états non orthogonaux, $\ket{\psi_0}$ et $\ket{\psi_1}$, et envoie l’état préparé à Bob à travers un canal non sécurisé. Une fois encore, l’attaque d’Eve est limitée par la non-orthogonalité des états. Une mesure possible et simple pour Bob est la suivante : il choisit aléatoirement de mesurer dans la base définie par $\ket{\psi_0}$ et son état orthogonal, noté $\ket{\psi^\perp_0}$ et tel que $\langle \psi^\perp_0\ket{\psi_0}=0$, ou bien la base $\{\ket{\psi_1},\ket{\psi^\perp_1}\}$. Lorsque Bob obtient le résultat correspondant à l'un des états orthogonaux pour l'une des deux mesures, disons le résultat correspondant à $\ket{\psi^\perp_0}$ quand il mesure $\{\ket{\psi_0},\ket{\psi^\perp_0}\}$, il sait que l'état n'était certainement pas $\ket{\psi_0}$ car $\langle \psi^\perp_0\ket{\psi_0}=0$, et donc qu’il doit s’agir de $\ket{\psi_1}$. Ainsi, lors de cette réconciliation, Bob annonce les instances où sa mesure a donné un résultat correspondant à l'un des états orthogonaux à ceux préparés par Alice. Une mesure plus efficace mais également plus exigeante expérimentalement est celle qui permet une discrimination non ambiguë optimale des états $\ket{\psi_0}$ et $\ket{\psi_1}$. 

`````{admonition} Exercice 2 – Discrimination non ambiguë de deux états purs non-orthogonaux.
:class: tip
Considérons deux états purs non-orthogonaux $\ket{\psi_0}$ et $\ket{\psi_1}$, avec $\langle \psi_0\ket{\psi_1}>0$. Sans perte de généralité, les deux états peuvent être orientés de manière à se situer dans le plan $XZ$ et avec l’axe $+z$ comme bisecteur, de sorte qu’ils soient représentés par:

```{math}
:label: states
\ket{\psi_0}=\left(\begin{array}{c}\cos\theta \\ \sin\theta\end{array}\right) \quad\quad
\ket{\psi_1}=\left(\begin{array}{c}\cos\theta \\ -\sin\theta\end{array}\right) ,
```

avec $0<\theta\leq\pi/4$. Soit $\ket{\psi}$ un état inconnu choisi entre ces deux états avec une probabilité égale. Considérons une mesure à trois réponses définie par les opérateurs suivants :

```{math}
:label: povm
M_0=\mu\proj{\psi_1^\perp} \quad\quad  M_1=\mu\proj{\psi_0^\perp}   \quad\quad  M_?=\one-M_0-M_1 ,
```

où $\ket{\psi_i^\perp}$ désigne l’état orthogonal à $\ket{\psi_i}$. 

a) Trouvez l'intervalle des valeurs de $\mu$ pour que la mesure soit bien définie, c'est-à-dire que les trois opérateurs de mesure soient positifs semi-définis.
b) Pour cette valeur de $\mu$, calculez les probabilités d'obtenir les trois résultats pour chacun des deux états. Quelle est la signification opérationnelle de cette mesure à trois issues ?

<!--Luke: Should this not be "values" or "range of values" rather than "value"?-->

c) Enfin, déterminez la valeur de $\mu$ qui minimise la probabilité moyenne d'obtenir la troisième issue, c'est-à-dire :

```{math}
:label:
P_?=\frac{1}{2}\left(p(?|0)+p(?|1)\right) .
```
Comment cela est-il lié au recouvrement entre les deux états ?
`````


## Protocole à six états

Le protocole à six états, introduit par Bruß {cite}`6state`, 
va dans la direction opposée : elle implique davantage d'états pour rendre l'attaque d'Eve plus difficile. Dans le protocole BB84, seuls quatre états appartenant à un équateur donné dans la sphère de Bloch, disons le plan $xy$, sont utilisés. Cependant, on pourrait envisager des protocoles plus élaborés dans lesquels Alice prépare des états mieux répartis sur la sphère. C'est précisément l'idée principale derrière le protocole à six états : Alice prépare un état à partir de l'ensemble des six états $\{\ket{\pm x},\ket{\pm y},\ket{\pm z}\}$. Bob mesure maintenant selon ces trois bases, $x$, $y$ and $z$. Clairement, après la réconciliation des bases, Alice et Bob sont supposés obtenir une liste de bits parfaitement corrélés. Du point de vue d'Eve, sa tâche devient plus complexe car elle doit cloner ou distinguer parmi un plus grand nombre d'états non orthogonaux. Cependant, du point de vue d'Alice et Bob, seulement 1/3 des tours sont conservés après la réconciliation des bases. En fin de compte, l'amélioration de la sécurité est modérée, tandis que dans certaines implémentations, les exigences technologiques pour préparer les six états sont plus contraignantes, ce qui fait que le protocole a difficilement été adopté en pratique.

## Protocole Goldenber-Vaidman

Le dernier protocole que nous présentons dans cette partie a été introduit par Goldenberg et Vaidman{cite}`vaidman`. Le protocole utilise l'intrication et prouve que la distribution de clés sécurisée est toujours possible en utilisant deux états orthogonaux si ces deux états sont employés de manière astucieuse. L'idée du protocole est la suivante : Bob prépare un état maximalement intriqué à deux qubits, $\ket{\Phi^+}=(\ket{00}+\ket{11})/\sqrt 2$. Il envoie seulement une des particules à Alice. Alice applique alors soit l'opérateur identité $\one$, soit l'opérateur $\sigma_z$ en fonction du bit qu'elle souhaite transmettre, et renvoie le qubit à Bob. Les deux états, selon le bit aléatoire d'Alice, sont 
$\ket{\Phi^\pm}$, avec $\ket{\Phi^-}=(\ket{00}-\ket{11})/\sqrt 2$. À la réception, Bob peut parfaitement discriminer entre ces deux états et lire le résultat car ils sont orthogonaux. Cependant, bien que l'encodage de l'information par Alice produise deux états orthogonaux, ce fait ne peut pas être exploité par Eve. Elle n'a accès qu'à une des deux particules quantiques préparées et envoyées par Bob, tandis que l'autre particule reste toujours dans le laboratoire de Bob et est donc jamais accessible à Eve. Cela rend la mesure quantique par Eve sur les deux états orthogonaux impossible. En fait, le qubit auquel Eve a accès est toujours dans l'état réduit de $\ket{\Phi^\pm}$, égal à $\one/2$ pour les deux états, ce qui garantit la sécurité du protocole.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



