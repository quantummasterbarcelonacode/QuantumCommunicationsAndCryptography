```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Les attaques d'Eve

Nous décrivons d'abord les attaques possibles qu'Eve peut mettre en œuvre. 
À titre d'illustration, nous considérons une attaque générale sur le protocole BB84 basée sur ce que l'on appelle des machines de clonage optimales. Ceci est un exemple d'une famille générale d'attaques, appelées attaques individuelles, dans lesquelles : (i) Eve intercepte la particule envoyée par Alice à Bob, $\ket{\psi_a}$ ; (ii) elle ajoute une autre particule dans un état de référence, disons $\ket{0}$, et effectue une opération unitaire $U_E$ sur les deux particules ; (iii) Eve envoie l'un des états résultants à Bob, tandis qu'elle garde les autres particules dans une mémoire quantique ; (iv) une fois que les bases sont annoncées par les utilisateurs honnêtes, Eve mesure sa particule (voir {numref}`indattacks`), obtenant le résultat de mesure $e$. À la suite de ce processus, Alice, Bob et Eve partagent des variables aléatoires corrélées correspondant à leurs états préparés et à leurs résultats de mesure, $a$ et $b$ pour les utilisateurs honnêtes, et $e$ pour Eve, décrites par la distribution de probabilité $P(a,b,e)$.

```{figure} ./Cloning_Attack.png
---
height: 400px
name: indattacks
---
Structure des attaques individuelles : Eve interagit avec les états préparés par Alice et un état de référence, disons $\ket{0}$, par le biais d'une opération unitaire $U_E$. Elle envoie une particule à Bob et garde l'autre, qu'elle mesure après l'annonce des bases.
```

`````{admonition} Exercice 3
:class: tip
Considérons une attaque individuelle par clonage dans laquelle l'action d'Eve est décrite par une famille uniparamétrique d'opérations unitaires $U(\eta)$. Bien que le théorème de non-clonage stipule qu'un état quantique inconnu ne peut pas être cloné, un clonage approximatif est toujours possible. 
Considérons des états situés sur l'équateur de la sphère de Bloch, c'est-à-dire,

```{math}
:label: thetast
\ket{\theta}=\frac{1}{\sqrt
2}\left(\ket{0}+e^{i\theta}\ket{1}\right) .
```

Notez que si $\theta = 0, \pi/2, \pi, 3\pi/2$, on obtient les quatre états $\ket{\pm x}$ et $\ket{\pm y}$ qui peuvent être utilisés pour le protocole BB84. Prenons un état générique $\ket{\theta}$ et un état auxiliaire $\ket{0}$ et appliquons la transformation globale (agissant sur les deux états) $U(\eta)$, ou $U$ pour simplifier la notation. 


```{math}
:label: 
  U\ket{00} &= \ket{00}, \\
  U\ket{10} &= \cos\eta\ket{10}+\sin\eta\ket{01} .
```

a) Expliquez brièvement pourquoi $U$ est une transformation unitaire valide sur les états quantiques considérés.

b) Calculez l'état final des deux qubits $\ket{\psi(\theta)}{BE}=U{BE}\ket{\theta}_B\ket{0}_E$ et les états réduits $\rho_B$ et $\rho_E$, où $\rho_B=\tr_E\proj{\psi(\theta)}$ et de manière similaire pour $\rho_E$.

c) Calculez le recouvrement, ou la fidélité, de ces deux états avec l'état initial, c'est-à-dire $F_i=\bra{\theta}\rho_i\ket{\theta}$, avec $i=B,E$. Ces fidélités dépendent-elles de $\theta$ ? Trouvez également la valeur de $\eta$ pour laquelle les deux fidélités deviennent égales. Enfin, calculez les états réduits lorsque $F_B=1$. Comment interprétez-vous ces résultats ?

d) Appliquez cette attaque au protocole BB84 lorsque Alice et Bob utilisent les états $\ket{\pm x}$ et $\ket{\pm y}$ et qu'Eve mesure dans la même base qu'Alice et Bob après la réconciliation des bases. Calculez la distribution des variables $P(a,b,e)$ où $a$ désigne le bit encodé par Alice, et $b$ et $e$ les résultats de mesure de Bob et Eve, respectivement. Calculez également le taux d'erreur quantique (QBER), défini par la probabilité que le résultat de Bob soit différent de la préparation d'Alice lorsque les bases concordent, et l'information mutuelle entre Alice et Bob, $I(A)$, et entre Alice et Eve, $I(A)$, où $I(X)=H(A)+H(B)-H(AB)$ et $H(X)=-\sum_x p(x)\log(p(x))$.
`````

Historiquement, les attaques individuelles ont été les premières étudiées dans le cadre de la sécurité des protocoles cryptographiques. L'attaque de clonage précédente est optimale en termes de fidélités car elle optimise la valeur de $F_E$ pour une fidélité donnée du côté de Bob, $F_B$. Cependant, les attaques individuelles ne sont pas les plus générales car elles supposent qu'Eve (i) interagit de la même manière avec toutes les particules quantiques envoyées par Alice à Bob et (ii) mesure sa particule à la fin de la réconciliation des bases. Les attaques individuelles peuvent par exemple négliger la possibilité qu'une interaction corrélée entre les tours du protocole puisse fournir à Eve plus d'informations, ou qu'Eve pourrait attendre la fin du processus de distillation de la clé et utiliser toutes les informations révélées pendant celui-ci pour optimiser sa mesure, voire attendre jusqu'à ce que la clé soit utilisée. En fait, la preuve de sécurité doit fonctionner pour la situation la plus générale dans laquelle Eve conserve sa particule quantique dans une mémoire quantique sans la mesurer. Si l'on prouve la sécurité pour cette situation, la preuve est également valable pour toute mesure qu'Eve pourrait appliquer ultérieurement à son système quantique. Les attaques individuelles et les attaques les plus générales sont illustrées dans {numref}`attacks`, où elles sont présentées dans le cadre d'un protocol basé sur l'intrication habituellement utilisé pour prouver la sécurité. Une attaque intermédiaire qui s'avère très utile est appelée attaque *collective*, dans laquelle Eve (i) conserve ses informations sous une forme quantique, c'est-à-dire stocke ses particules quantiques dans une mémoire, mais (ii) applique la même interaction à chaque tour.

Enfin, comme dans les situations les plus générales, nous considérons des attaques dans lesquelles Eve conserve ses informations sous une forme quantique, la définition d'une clé secrète doit être adaptée à ce scénario. De manière informelle, un protocole est capable de distiller une clé de longueur $k$ chaque fois que le résultat du protocole est un état $\rho_{ABE}$, très proche de l'état idéal

```{math}
:label: secretkey
\rho_{ABE}^{(k)}=\frac{1}{2}(\proj{00}+\proj{11})_{AB}^{\otimes k}\otimes\proj{E}_E.
```

Ici, Alice et Bob partagent $k$ bits parfaitement corrélés qui sont secrets parce qu'ils ne sont pas couplés au système quantique d'Eve, qui est dans un état de référence arbitraire $\ket{E}$.

```{figure} ./attacks.png
---
height: 400px
name: attacks
---
Structure des attaques d'espionnage : Dans les attaques individuelles et collectives, Eve prépare $N$ copies du même état $\ket{\psi}{ABE}$ et envoie une particule de chaque état à Alice et Bob, qui les mesurent. Dans le cas des attaques individuelles, Eve applique également la même mesure sur chaque particule après la réconciliation des bases. Dans une attaque collective, Eve conserve ses $N$ systèmes quantiques dans une mémoire quantique pour une utilisation ultérieure. Dans une attaque générale, Eve prépare un état conjoint $\ket{\psi^{(N)}}{\vec A\vec BE}$ et envoie les particules correspondantes à Alice et Bob pour leurs mesures, tandis qu'elle conserve un système quantique (possiblement large) dans une mémoire quantique. Toutes les attaques sont présentées dans le scénario basé sur l'intrication.
```


