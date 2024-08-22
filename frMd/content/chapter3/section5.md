
# L’argument Bennett-Brassard-Mermin 

Quelques mois après le travail d'Ekert, Bennett, Brassard et Mermin {cite}`BBM` écrivirent un article montrant qu'un protocole de QKD à la Ekert peut toujours être transformé en un protocole équivalent sans intrication, à la BB84, où les états sont préparés par Alice et mesurés par Bob. Leur argument est le suivant.

Tout d'abord, le rôle d'une violation des inégalités de Bell dans la proposition d'Ekert est de certifier qu'Alice et Bob partagent un état maximalement intriqué à deux qubits.

 Cependant, il existe d'autres mesures qui peuvent fournir le même niveau de certification. Par exemple, c'est le seul état qui donne des corrélations parfaites lorsque les deux parties locales mesurent dans les bases $x$ et $z$. C'est-à-dire que c'est le seul état à deux qubits tel que $\bra{\psi}\sigma_x\otimes\sigma_x\ket{\psi}=
\bra{\psi}\sigma_z\otimes\sigma_z\ket{\psi}=1$. Ainsi, la détection de l’état maximalement intriqué
peut également être effectuée via un protocole dans lequel Alice et Bob mesurent tous deux dans les bases $x$ and $z$. Notez que maintenant, Alice n'a plus besoin d'introduire une troisième base pour obtenir des résultats parfaitement corrélés à ceux de Bob.

L'étape restante consiste à noter que lorsqu'elle mesure sa particule quantique, Alice prépare effectivement un état pour Bob. En effet, dans le cas idéal, Alice reçoit la moitié d'un état maximalement intriqué. Sa mesure projette la particule de Bob dans un état qui est égal au résultat de la mesure d'Alice. Cela découle de la simple observation que :
```{math}
:label: 
  _A\bra{\pm x}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm x}_B \nonumber\\
  _A\bra{\pm z}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm
  z}_B .
```

Selon son choix de base, Alice prépare un état dans la direction plus ou moins avec une probabilité égale à 1/2. Clairement, le protocole résultant est équivalent au protocole original en termes de sécurité. Mais le protocole résultant n'est rien d'autre que le protocole BB84 original et ne nécessite aucune intrication. Ainsi, les auteurs de la référence {cite}`BBM` conclurent que l'approche d'Ekert ne fournissait pas de nouvel aperçu significatif sur le problème de la QKD, car les deux approches étaient équivalentes.

En dehors des implications conceptuelles, le travail de Bennett, Brassard et Mermin est également important d'un point de vue technique, car il a mis en évidence une correspondance intéressante entre les protocoles basés sur l'intrication à la Ekert et les protocoles de préparation-et-mesure à la BB84. D'une part, la plupart des protocoles basés sur l'intrication peuvent être transformés en un protocole de préparation-et-mesure équivalent en utilisant les idées précédentes. D'autre part, tout protocole de préparation-et-mesure peut être transformé en un protocole basé sur l'intrication équivalent. En effet, supposons que dans le protocole initial de préparation-et-mesure, Alice prépare les états $\{\ket{\psi_i}\}$ avec probabilités $p_i$. Pour ce faire, Alice peut preparer un état intriqué

```{math}
:label: 
    \sum_i \sqrt{p_i}\ket{i}_A\otimes\ket{\psi_i}_B ,
```

et mesurer dans la base $\{\ket{i}\}$. 

Comme nous le verrons dans la section suivante, ce parallélisme offre une simplification conceptuelle et technique considérable pour les preuves de sécurité en QKD. En effet, les preuves de sécurité des protocoles QKD sont généralement développées dans le cadre des protocoles basés sur l'intrication, car cette approche facilite leur construction. En revanche, en pratique, la version équivalente de préparation-et-mesure est plus souvent mise en œuvre , car elle requiert uniquement la préparation d'états de particules uniques et la réalisation de mesures, ce qui la rend plus adaptée à une application concrète.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


