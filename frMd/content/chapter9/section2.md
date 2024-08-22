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
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Correction d'erreur quantique

Adapter la correction d'erreurs au domaine quantique n'est pas facile. La correction d'erreurs repose sur la redondance, c'est-à-dire la répétition du message, et nous savons que l'information quantique ne peut pas être clonée. De plus, lors du décodage, Bob doit effectuer une mesure pour lire l'état reçu puis décider comment décoder. Mais les mesures quantiques perturbent l'état du système, il semble donc que la procédure de décodage introduira également des erreurs. En fait, aux débuts de la théorie de l'information quantique, des chercheurs de premier plan doutaient de l'existence de correction d'erreurs quantiques {cite}`haroche`.

Comme l'ont montré Shor et Steane dans {cite}`errcorr1,errcorr2`, la correction d'erreurs quantiques est possible. Cette percée reposait sur une traduction astucieuse des techniques classiques connues dans le formalisme quantique, où $m$ qubits logiques sont encodés en mots de codes composés de $n$ qubits physiques : $(m=1,n=7)$ pour le schéma de Steane et $(m=1,n=9)$ pour le schéma de Shor. Avec cette connaissance, nous pouvons reformuler la discussion précédente sur la correction d'erreurs en termes quantiques. Étant donné un canal décrit par une application CPTP $\Lambda$, Alice encode un message de $m$ qubits dans $n$ qubits physiques à travers une isométrie $n\rightarrow m$, $\mathcal E$, qui associe à tout état $\ket\psi\in\compl^{\otimes m}$ à $\ket{\psi'}=\mathcal E \ket{\psi}\in\compl^{\otimes n}$. Ces $n$ qubits sont alors envoyés à travers le canal bruité, de sorte que Bob reçoit l'état mixte de $n$ qubits $\rho'=\Lambda^{\otimes N}(\proj{\psi'})$. Bob applique la méthode de décodage $\mathcal D$ à cet état, obtenant $\rho=\mathcal D(\rho')$. L'objectif du protocole est que cet état soit $\epsilon$-proche de l'état encodé $\ket\psi$, c'est-à-dire d'avoir $\bra\psi\rho\ket\psi\geq 1-\epsilon$ pour un seuil d'erreur donné $\epsilon$.

Il est loin de la portée de ces notes de fournir une explication détaillée de la correction d'erreurs quantiques. Cependant, nous proposons ci-dessous un schéma simple qui montre comment améliorer le taux d'erreurs du canal bruité suivant:

```{math}
:label:
\Lambda_x(\rho)=(1-p_x)\rho+p_x\sx\rho\sx ,
```

Un canal pour lequel, avec une probabilité de $1-p_x$, l'état ne change pas, tandis qu'un flip de bit $\sx$ est effectué avec une probabilité $p_x$. C'est un canal plutôt académique, mais il suffit pour illustrer comment fonctionnent les techniques de correction d'erreurs quantiques.

L'objectif est de présenter un processus d'encodage et de décodage qui fait l'analogue du simple code de répétition classique $1\rightarrow 3$ décrit ci-dessus. Une représentation de ce schéma est montrée dans {numref}`errc`. Le qubit initial à transmettre est dans un état arbitraire $\ket\psi=\alpha\ket 0 +\beta\ket 1$. Alice l'encode dans un état de 3 qubits par l'isométrie où elle ajoute deux nouveaux qubits dans l'état $\ket 0$ et effectue deux opérations CNOT comme montré dans {numref}`errc`. L'état résultant est $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. Notez que la répétition $1\rightarrow 3$ est réalisée tout en conservant les cohérences dans l'état. Cet état est maintenant envoyé à travers le canal, de sorte que l'état reçu par Bob est $\rho'=\Lambda_x^{\otimes 3}(\proj{\psi'})$. Il est facile de voir que cet état peut être écrit comme

```{math}
:label:
\rho'=(1-p_x)^3\rho'_0+3(1-p_x)^2p_x\rho'_1+3(1-p_x)p_x^2\rho'_2+p_x^3\rho'_3 ,
```

où

```{math}
:label:
&&\rho'_0=\proj{\psi'}\nonumber\\
&&\rho'_1=\frac{1}{3}\left(\sx\otimes\one\otimes\one\proj{\psi'}\sx\otimes\one\otimes\one+\one\otimes\sx\otimes\one\proj{\psi'}\one\otimes\sx\otimes\one\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\one\otimes\sx \proj{\psi'} \one\otimes\one\otimes\sx\right) \nonumber\\
&&\rho'_2= \frac{1}{3}\left(\sx\otimes\sx\otimes\one \proj{\psi'} \sx\otimes\sx\otimes\one + \sx\otimes\one\otimes\sx \proj{\psi'} \sx\otimes\one\otimes\sx\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\sx\otimes\sx \proj{\psi'} \one\otimes\sx\otimes\sx\right) \nonumber\\
&&\rho'_3= \sx\otimes\sx\otimes\sx \proj{\psi'} \sx\otimes\sx\otimes\sx ,
```

c'est-à-dire, tous les différents termes où zéro, un, deux ou trois erreurs ont lieu. Notez les analogies avec le cas classique. L'objectif est maintenant de concevoir une application qui corrige toutes les instances avec zéro et une erreur, c'est-à-dire $\mathcal D(\rho'_0)=\mathcal D(\rho'_1)=\proj\psi$. Le circuit dans {numref}`errc` y parvient, comme nous allons le montrer pour chacun des états purs apparaissant dans ces états mixtes.

```{figure} ./errcorr.png
---
height: 400px
name: errc
---
Correction d'erreur quantique : La figure montre un exemple simple des opérations d'encodage et de décodage corrigeant au plus un retournement de bit. Les mesures sur le quatrième et le cinquième qubit informent Bob sur les opérations unitaires $U_1$, $U_2$ et $U_3$ à mettre en œuvre pour corriger l'erreur dans un (ou aucun) des trois qubits physiques encodant le qubit logique dans l'état $\ket{\psi}$.
```
- Aucune erreur : Bob reçoit l'état encodé $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. On peut voir que l'état après l'ajout des deux qubits supplémentaires et l'application des CNOT dans la partie correction d'erreur est $(\alpha\ket{000}+\beta\ket{111})\ket{00}$. Les mesures des deux derniers qubits donnent $00$. En gros, ce circuit laisse l'état des trois premiers qubits inchangé, car ils contrôlent le résultat des portes CNOT, tandis que les deux bits obtenus dans la mesure, voir {numref}`errc`, extraient l'information sur l'erreur : ils nous informent si le qubit 1 et le qubit 2 sont identiques, ou si le qubit 1 et le qubit 3 sont égaux. Dans le cas présent, comme le résultat est 00, Bob déduit que les trois qubits sont identiques. Cela est compatible avec aucune erreur ou trois erreurs, mais le premier cas est plus probable, donc Bob ne fait rien, $U_1=U_2=U_3=\one$. L'état entrant dans la partie finale de décodage est à nouveau $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, qui est mappé en $\ket{\psi}=\alpha\ket{0}+\beta\ket{1}$ par les deux dernières opérations CNOT et les mesures. En fait, ces deux dernières mesures ne sont pas vraiment nécessaires.

- Erreur sur le premier qubit : Bob reçoit l'état $\alpha\ket{100}+\beta\ket{011}$. Après la série de portes CNOT, on a $(\alpha\ket{100}+\beta\ket{011})\ket{11}$. Les deux mesures sur les deux derniers qubits donnent 11. Cela informe Bob que le qubit 1 est différent des qubits 2 et 3. S'il y avait seulement une erreur, Bob sait qu'il doit corriger le premier qubit, donc il applique $U_1=\sigma_x$ et $U_2=U_3=\one$. L'état résultant est à nouveau $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, donc la partie finale de décodage fournit l'état initial.

- Erreur sur le deuxième qubit : Bob reçoit l'état $\alpha\ket{010}+\beta\ket{101}$. Le raisonnement se poursuit comme ci-dessus, mais maintenant l'état avant la première mesure est $(\alpha\ket{010}+\beta\ket{101})\ket{10}$. Les mesures donnent 10 et informent Bob que le deuxième qubit était différent des deux autres, donc il le corrige, $U_2=\sigma_x$ et $U_1=U_3=\one$. La dernière partie est identique à celle de l'étape précédente.

- Erreur sur le troisième qubit : Bob reçoit l'état $\alpha\ket{001}+\beta\ket{110}$. Comme ci-dessus, mais maintenant les mesures sur les quatrième et cinquième qubits donnent 01, donc Bob déduit que le troisième qubit est incorrect et applique $U_3=\sigma_x$ et $U_1=U_2=\one$.

Ce schéma simple illustre comment fonctionne la correction quantique des erreurs : (i) Alice encode les $m$ qubits logiques initiaux en des mots de code quantiques composés de $n$ qubits physiques ; (ii) après propagation à travers le canal, certains qubits sont mesurés, fournissant à Bob des informations sur les erreurs survenues dans le canal ; (iii) l'erreur est corrigée et l'état quantique original est décodé. Une méthode de correction d'erreurs quantiques réelle devrait corriger non seulement les retournements de bits, $\sigma_x$, mais aussi les inversions de phase, $\sigma_z$, et toute combinaison arbitraire de ceux-ci. Comme dit plus haut, de tels schémas existent et constituent une primitive de base pour toute mise en œuvre du traitement de l'information quantique, en particulier pour les besoins de calcul quantique.

Nous avons maintenant tous les éléments pour définir la capacité quantique $\text{QC}$ d'un canal quantique $\Lambda$. Tout d'abord, pour $n$ utilisations du canal, nous définissons $m^(n,\epsilon)$ comme le nombre maximal de qubits pouvant être transmis avec une erreur $\epsilon$. Cela signifie qu'il existe des applications d'encodage et de décodage, $\mathcal E$ et $\mathcal D$, telles que pour tous les $\ket\psi\in\compl^{\otimes m}$, on a $\bra\psi\rho\ket\psi\geq 1-\epsilon$, où $\rho=(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)$. La capacité quantique du canal est ensuite définie comme dans l'équation {eq}`capacity`, avec cette nouvelle définition de $m^(n,\epsilon)$.

Bien que la définition formelle des capacités pour les canaux classiques et quantiques semble presque identique, il existe plusieurs différences importantes. Tout d'abord, et contrairement à ce qui se passe dans le cas classique, il existe des canaux avec une capacité quantique nulle, $\text{QC}=0$, bien que l'état reçu par Bob dépende de la préparation d'Alice. Les exemples les plus simples de tels canaux sont les canaux dits partageables à deux. Ce sont des canaux $\Lambda$, disons de $A\rightarrow B$, pour lesquels il existe un autre canal $\tilde\Lambda$ de $A\rightarrow B_1B_2$ avec la propriété que, pour tous les états d'entrée $\rho$, on a $\tr_1(\tilde\Lambda(\rho))=\tr_2(\tilde\Lambda(\rho))=\Lambda(\rho)$. Supposons que le canal original était tel que $\text{QC}>0$. Cela signifierait qu'il existe des opérations d'encodage et de décodage telles que $\bra\psi(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)\ket\psi\geq 1-\epsilon$. On pourrait alors appliquer l'encodage à un état $\ket\psi$, l'utiliser comme entrée dans $\tilde\Lambda$ et appliquer l'opération de décodage aux états de sortie $B_1$ et $B_2$, obtenant ainsi deux copies de l'état initial de qualité arbitrairement bonne, et violer ainsi le théorème de non-clonage. C'est-à-dire que le théorème de non-clonage implique l'existence de canaux non triviaux avec une capacité quantique nulle. Notez qu'il existe des exemples très naturels de canaux partageables à deux, le plus simple étant un canal à pertes dans lequel un état est transmis avec une probabilité $1/2$ de $A$ à $B$. Il peut être trivialement partagé par un canal dans lequel l'état est transmis soit à $B_1$ soit à $B_2$ avec une probabilité de $1/2$. Rappelons que ce canal apparaît dans les communications par fibre optique et, de fait, une transmission inférieure à $1/2$ est obtenue à une distance relativement courte. Cela implique que la correction quantique des erreurs est d'une utilité limitée pour les communications quantiques.

Deuxièmement, dans le cas quantique, nous ne savons pas si une formule à une seule lettre pour la capacité quantique du canal existe et, en fait, il est concevable qu'elle n'existe pas. Troisièmement, et cela est lié au point précédent, la capacité quantique est non additive {cite}`smithyard` : il existe des canaux quantiques $\Lambda_1$ et $\Lambda_2$ tels que (i) $\text{QC}(\Lambda_1)=\text{QC}(\Lambda_2)=0$, mais (ii) $\text{QC}(\Lambda_1\otimes\Lambda_2)>0$. En d'autres termes, deux canaux qui sont individuellement inutiles pour envoyer des signaux quantiques deviennent utiles lorsqu'ils sont combinés. Cette propriété étonnante de l'information quantique est en fait plus courante que ce que l'on pourrait initialement attendre, car il existe plusieurs scénarios opérationnels dans lesquels les propriétés de l'information quantique ne sont pas additives, la capacité quantique étant l'un des exemples les plus célèbres. Cette propriété de non-additivité est parfois encapsulée par la formule amusante $0+0>0$.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


