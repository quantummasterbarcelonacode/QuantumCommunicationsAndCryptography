```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Communication quantique basée sur l'intrication

La correction d'erreurs quantiques fournit une solution pour remédier aux imperfections du canal. Cependant, si les erreurs dans le canal sont trop importantes, aucun code de correction d'erreurs quantiques ne permettra la transmission fidèle de l'information quantique à travers le canal. Comme mentionné, cela contraste fortement avec ce qui se passe pour l'information classique : même si les erreurs dans le canal sont très grandes, il existe toujours un processus d'encodage et de décodage permettant une transmission sans erreur. En ce qui concerne les canaux quantiques, la correction d'erreurs quantiques peut être impossible même dans des situations où l'état quantique de Bob est corrélé à l'état initial d'Alice. Par conséquent, le problème de la communication quantique à longue distance doit explorer d'autres méthodes, et la solution passe encore par l'intrication.

Avant de continuer, notez que dans un scénario de communication quantique, si les parties sont initialement assistées par un état maximallement intriqué, disons de deux qubits (voir Eq. {eq}`bellstate`), alors Alice peut envoyer parfaitement un qubit à Bob par le biais de la téléportation quantique {cite}`teleportation`. À la fin de ce protocole, l'intrication est détruite, donc partager un état maximement intriqué est équivalent, dans ce contexte, à utiliser une fois le canal d'identité $\Lambda(\rho)=\rho$, c'est-à-dire un canal parfait sans erreur. Voyons maintenant comment utiliser cette idée.

Si Alice et Bob sont connectés par un canal $\Lambda$, disons d'un qubit, et qu'Alice envisage d'utiliser la téléportation, elle peut essayer d'établir une intrication avec Bob en préparant localement un état intriqué de deux qubits, puis en envoyant une moitié de celui-ci à travers le canal. À la fin de ce processus, Alice et Bob partagent l'état

```{math}
:label:
\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+}) .
```

Maintenant, supposons que cet état puisse être transformé par LOCC en un état maximalement intriqué avec une certaine probabilité $p$. Ce processus est appelé *distillation d'intrication*. L'état maximement intriqué résultant peut alors être utilisé pour téléporter un qubit de manière fiable entre Alice et Bob. Si Alice et Bob répètent ce processus $n$ fois, ils obtiendront de manière déterministe un ordre de grandeur de $np$ états maximalement intriqué, et pourront donc transmettre de l'ordre de $np$ qubits.

Cette procédure fonctionne pour les canaux qui sont partageables en deux parties, où la correction d'erreurs quantiques est inutile. Un exemple simple est le canal avec un coefficient de transmission $1/2$. En fait, elle fonctionne pour tout canal purement à perte avec une transmission $\eta_C$. Lorsqu'une moitié d'un état maximalement intriqué, disons encodée dans deux photons, est envoyée à travers ce canal, Alice et Bob obtiennent finalement l'état

```{math}
:label:
\rho_{AB}=\eta_C\proj{\Phi^+}+(1-\eta_C)\frac{\one}{2}\otimes\proj\varnothing ,
```

où $\ket\varnothing$ est l'état associé à la perte du photon. Bob peut maintenant réaliser les deux mesures de sortie décrites par les opérateurs de Kraus

```{math}
:label:
A_{\text{ok}}=\proj 0+\proj 1, \quad A_{\text{loss}}=\proj\varnothing .
```

Cela revient à observer si la particule encodant la moitié de l'état maximalement intriqué, dans notre exemple le photon, est parvenue à traverser le canal sans être détruite. Il s'agit d'un exemple de mesures dites de non-démolition quantique, qui sont difficiles mais possibles. Il est clair que lorsque Bob obtient le résultat $r=\text{ok}$, ce qui se produit avec une probabilité $\eta_C$, l'état entre Alice et Bob est projeté dans $\ket{\Phi^+}$.

Ce résultat montre que l'information quantique peut être transmise à travers n'importe quel canal à pertes, avec un taux d'au moins $\eta_C$. Cela n'est pas en contradiction avec le résultat précédent utilisant la correction d'erreurs quantiques. En fait, l'expression précédente pour la capacité du canal quantique était définie en termes de protocoles de correction d'erreurs quantiques dans lesquels l'information va uniquement d'Alice vers Bob. Cela implique que notre définition précédente encapsulait en réalité la capacité de communication unidirectionnelle, notée $\textbf{QC}^\rightarrow$. En particulier, cette capacité est nulle pour les canaux partageables à deux. Cependant, dans le protocole précédent, utilisant la distillation d'intrication, Bob doit communiquer avec Alice pour lui informer du résultat de sa mesure, et ce message va dans la direction opposée. Un protocole plus général pourrait en fait impliquer plusieurs tours de communication classique entre Alice et Bob et vice-versa. Pour prendre en compte cette possibilité, nous définirons ci-dessous la capacité quantique bidirectionnelle $\text{QC}^\leftrightarrow$.

La discussion précédente montre que le problème de la communication quantique à longue distance est intimement lié au problème de la distillation d'intrication à travers le canal. Imaginez que le canal permette la distribution d'états qui sont distillables, c'est-à-dire qu'Alice et Bob puissent établir après $n$ utilisations du canal un état qui peut être transformé en $m$ états maximalement intriqués de deux qubits. Alors, ces $n$ utilisations permettraient l'échange de $m$ qubits par téléportation. D'autre part, imaginez qu'en utilisant $n$ fois le canal, Alice et Bob puissent distribuer de manière fiable $m$ qubits. Alors, Alice pourrait appliquer ce protocole pour envoyer de manière fiable les $m$ moitiés de $m$ états maximalement intriqués à Bob, distribuant ainsi parfaitement l'intrication.

Il en découle que la capacité quantique bidirectionnelle peut être définie comme suit. Considérons $n$ utilisations du canal agissant sur les $n$ moitiés de $n$ états maximalement intriqués, résultant en un état égal à $n$ copies de $\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+})$. Maintenant, définissons $m^*(n,\epsilon)$ comme le nombre maximum $m$ d'états maximalement intriqués qui peuvent être distillés à partir de cet état par LOCC avec une erreur $\epsilon$, c'est-à-dire $^{\otimes m}\bra{\Phi^+}\text{LOCC}(\rho_{AB}^{\otimes n})\ket{\Phi^+}^{\otimes m}\geq 1-\epsilon$. La capacité quantique bidirectionnelle est alors définie comme dans l'équation {eq}`capacity`. Par exemple, il découle de ce qui a été dit ci-dessus qu'un canal à perte a $\text{QC}^\leftrightarrow>\text{QC}^\rightarrow=0$, prouvant l'avantage des stratégies de communication bidirectionnelles.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


