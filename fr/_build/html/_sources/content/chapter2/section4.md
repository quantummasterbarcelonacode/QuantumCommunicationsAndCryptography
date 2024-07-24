```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
```

# le Théorème de Bell

Le théorème de Bell est sans doute le résultat le plus convaincant montrant la séparation entre la physique classique et la physique quantique (ainsi que les théories de l'information correspondantes). Historiquement, cette discussion commença avec un article célèbre d'Einstein, Podolsky et Rosen (EPR) intitulé "Can Quantum-Mechanical Description of Physical Reality Be Considered Complete?"
{cite}`epr`, où ils soulevèrent des doutes sur la complétude de la théorie quantique en tant que théorie “réaliste-locale” (LR). Leur argument reposait sur trois hypothèses que toute théorie physique, selon EPR, devait satisfaire :

- “Localité”: Des événements séparés par un intervalle de genre espace ne peuvent pas avoir de relation causale directe.
- “Réalisme”: Si, sans perturber un système de quelque manière que ce soit, nous pouvons prédire avec certitude la valeur d'une grandeur physique, alors il existe un élément de réalité physique correspondant à cette grandeur physique.
- “Complétude”: Chaque élément de la réalité physique doit avoir un homologue dans la théorie physique.

Toutes ces conditions semblent intuitivement naturelles et peu restrictives. Einstein, Podolsky et Rosen ont soutenu que si la théorie quantique était locale et réaliste, alors elle ne pouvait pas être complète. Ils ne remettaient pas nécessairement en cause la puissance prédictive de la théorie quantique, mais plaidaient pour l'existence d'une autre théorie, peut-être avec la même puissance prédictive que la théorie quantique, mais complète et donc plus satisfaisante.

Pendant des années, le programme EPR a été principalement une question de débat quasi-philosophique, jusqu'au travail de J. Bell en 1964 {cite}`bell`. Le mérite de Bell a été (i) d'identifier une série de conditions, les fameuses inégalités de Bell, que toute théorie LR satisfait et (ii) de proposer une expérience quantique permettant de violer ces inégalités. Ainsi, Bell a pu construire une condition vérifiable expérimentalement testant les théories LR par rapport à la théorie quantique. Les démonstrations expérimentales des violations des inégalités de Bell, des démonstrations pionnières de {cite}`Aspect,exp1,exp2,exp3` aux plus récentes experiences “sans échappatoires” {cite}`hanson,nist,vienna`, ont définitivement clos le programme EPR.

Nous présentons ici le théorème de Bell à travers l'inégalité de Bell la plus connue, l’ inégalité de Clauser-Horne-Shimony-Holt (CHSH) {cite}`CHSH`. En réalité, ce n'était pas l'inégalité utilisée par Bell pour prouver son théorème, mais elle est maintenant la plus couramment utilisée et elle offre la démonstration la plus simple du résultat de Bell. Pour ce faire, nous suivons une formulation plus moderne et opérationnelle du problème, sans faire explicitement usage des concepts de localité et de réalisme.

Un scénario de Bell est défini par deux observateurs ne communiquant pas, Alice et Bob, qui reçoivent deux systèmes corrélés à partir d'une source. Les parties peuvent effectuer $m$ mesures possibles sur leurs systèmes, chacune avec $r$ résultats possibles. Les mesures effectuées sont notées $x,y=1,\ldots,m$ et les résultats obtenus $a,b=1,\ldots,r$, voir également {numref}`CHSHfig`. En répétant l'expérience plusieurs fois, il est possible de calculer les probabilités conditionnelles $p(ab|xy)$ d'observer les différents résultats $(a,b)$ pour chaque configuration de mesures $(x,y)$. Clairement, ces probabilités sont toutes positives et normalisées, $p(ab|xy)>0$ et $\sum_{a,b}p(ab|xy)=1$ pour tout $(x,y)$. Ces probabilités définissent les statistiques observées et sont souvent appelées corrélations. Ce que EPR appelait un modèle LR est donné par des corrélations qui peuvent être écrites comme des stratégies déterministes locales spécifiant la sortie étant donnée l'entrée et potentiellement corrélées par les particules reçues de la source. Ces corrélations s'écrivent

```{math}
:label: lrmodel
p(ab|xy)=\sum_{\lambda}p(\lambda) ~ D_A(a|x\lambda) ~ D_B(a|x\lambda) ,
```

où $\lambda$ désigne les instructions reçues de la source, qui peuvent changer éventuellement selon une préparation probabiliste $p(\lambda)$, tandis que les fonctions $D_A$ et $D_B$ spécifient de manière déterministe la sortie de chaque partie étant donnée l'entrée et ces instructions. Notez que ces fonctions ne dépendent pas de l'entrée de l'autre partie car il est supposé que les parties ne communiquent pas. De plus, notez que si la valeur de $\lambda$ est connue, ce qui peut être interprété comme l'état préparé par la source, alors il est possible de prédire de manière déterministe la sortie, i.e. le résultat de mesure. Il est naturel de s'attendre à ce que, dans la nature, les corrélations entre deux parties ne communiquant pas puissent toujours être exprimées sous cette forme


```{figure} ./CHSH_Fig.png
---
height: 400px
name: CHSHfig
---
Inégalité de Bell CHSH: Deux parties mesurent deux observables à résultats binaires, $A_1$
  et $A_2$ pour Alice, et $B_1$ et $B_2$ pour Bob. Le choix de mesure est représenté par un bit, $x$ pour Alice et $y$ pour Bob.
  Les deux résultats possibles sont représentés par $\pm 1$. Pour la violation quantique, les deux observables sont remplacées par des opérateurs quantiques et agissent sur un état à deux qubits maximalement intriqués.
```

L’inégalité CHSH {cite}`CHSH` est définie dans le scénario de Bell le plus simple dans lequel les parties effectuent deux mesures à deux résultats, $m=r=2$, et la convention est de noter la mesure effectuée par $x,y=1,2$ et le résultat obtenu par $a,b=\pm 1$. Cette convention est arbitraire mais ce choix simplifie les calculs. On considère alors la quantité suivante :

```{math}
:label: CHSHdef
    \text{CHSH}=A_1B_1+A_1B_2+A_2B_1-A_2B_2 ,
```

où $A_x$ ($B_y$) désigne le résultat de mesure d'Alice (Bob) lors de la mise en œuvre de la mesure $x$ ($y$). Il est très simple de voir que si les résultats de mesure sont fixés de manière déterministe, c'est-à-dire pour toute attribution de $\pm 1$ à ces valeurs, l'expression CHSH satisfait $|CHSH|=2$. Cela implique que même si l'attribution change selon une préparation probabiliste à la source $p(\lambda)$, comme dans Eq. {eq}`lrmodel`, la valeur de l’espérance de cette expression satisfait toujours 

```{math}
:label: CHSHineq
    \langle CHSH\rangle \leq 2.
```

Eq. {eq}`CHSHineq` est la fameuse inégalité CHSH, dont la dérivation mathématique est étonnamment simple. La violation maximale d'une inégalité pour les modèles LR est appelée borne locale, égale à 2 pour CHSH.

Considérons maintenant une réalisation quantique d'un scénario de Bell CHSH dans lequel l'état préparé par la source est l'état maximalement intriqué à deux qubits

```{math}
:label: bellstate
    \ket{\Phi^+}=\frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

et les mesures par chacune des deux parties sont définies par les observables $A_1=\sx$, $A_2=\sz$, $B_1=(\sx+\sz)/\sqrt 2$ et $B_2=(\sx-\sz)/\sqrt 2$, voir {numref}`CHSHfig`. Après quelques calculs, il est possible de voir que la valeur quantique de l'expression CHSH pour cette configuration est

```{math}
:label: tsirelson
    \langle \text{CHSH}\rangle =\langle A_1B_1\rangle +\langle A_1B_2\rangle +\langle A_2B_1\rangle -\langle A_2B_2\rangle =2\sqrt 2 > 2,
```

prouvant que les corrélations quantiques n'ont pas de description en termes de modèle EPR {eq}`lrmodel`. La valeur $2\sqrt 2$ est la plus grande possible en physique quantique et est connue sous le nom de borne de Tsirelson {cite}`tsirelson`.

<!--\textbf{Exercise 1}: Compute the quantum value of each of the four terms $\langle A_x\otimes B_y\rangle$, with $x,y=1,2$, in the CHSH expression for the state {eq}`bellstate` and settings as in {numref}`CHSHfig` and verify that they sum up to $2\sqrt 2$.-->

`````{admonition} Exercice 1
:class: tip
Calculez la valeur quantique de chacun des quatre termes $\langle A_x\otimes B_y\rangle$, avec $x,y=1,2$, dans l'expression CHSH pour l'état {eq}`bellstate` et les mesures comme dans {numref}`CHSHfig` et verifiez que leur somme est $2\sqrt 2$.
`````

Les implications de cette violation sont énormes. Tout d'abord, aucune théorie LR (locale et réaliste) ne peut donner une valeur de CHSH supérieure à 2. Ainsi, soit les prédictions de la théorie quantique sont incorrectes, soit le programme EPR n'est pas réalisable. Bell a ainsi réussi à traduire le débat EPR en une condition mesurable. Il ne restait plus qu'à concevoir la situation expérimentale permettant de tester la violation de ces quantités. La vérification expérimentale rigoureuse de la violation d'une inégalité de Bell est survenue près de deux décennies après le célèbre article de Bell {cite}`Aspect`. Depuis, d'autres tests expérimentaux ont été réalisés, et tous ont favorisé le formalisme quantique {cite}`hanson,nist,vienna`.

Deux faits doivent être mentionnés. Premièrement, bien qu'une seule inégalité soit présentée ici, il existe de nombreuses conditions similaires qui caractérisent l'ensemble des distributions de probabilité possibles dans une théorie LR {eq}`lrmodel`. Le fait que la théorie quantique prédit l'existence de corrélations conduisant à une violation d'une inégalité de Bell signifie que ces corrélations quantiques ne peuvent pas être exprimées de cette manière.
Deuxièmement, malgré le fait que la théorie quantique prédit la violation de ces inégalités, aucune communication plus rapide que la lumière n'est permise dans le formalisme quantique. Cela correspondrait au cas où la mesure d'Alice pourrait modifier les statistiques de mesure de Bob. Il est facile de prouver que cela n'est pas possible. Considérons la situation où Alice et Bob partagent un état quantique $\rho_{AB}$ sur lequel ils appliquent des mesures ${M_{a|x}}$ et ${M_{b|y}}$ de telle sorte que


```{math}
:label: qcorr
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y}) .
```

La probabilité qu'Alice obtienne le résultat $a$ lorsqu'elle mesure $x$ et que Bob mesure $y$ est donnée par

```{math}
:label:
    p_A\,(a|xy)=\sum_b p\,(ab|xy)=\sum_b\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})
    =\tr(\rho_{AB}M_{a|x}\otimes \one_B) =\tr(A_x\rho_A) ,
```

où nous avons utilisé le fait que $\sum_b M_{b|y}=\one_B$ pour tout $y$ et où $\rho_A=\tr_B(\rho_{AB})$. Ici, $\tr_B$ est la trace partielle sur le sous-système $B$. Cela signifie que les statistiques de mesure locales d'Alice ne peuvent être affectées par aucune mesure de Bob (et vice versa), car elles ne dépendent pas de la mesure $y$ effectuée, donc aucune communication plus rapide que la lumière (instantanée) n'est possible.

<!--TODO Luke: I think this above section could be clearer, regarding the partial trace etc. -->

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```






