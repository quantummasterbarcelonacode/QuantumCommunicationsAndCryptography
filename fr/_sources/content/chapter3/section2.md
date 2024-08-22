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



# Le Protocole BB84

Après avoir introduit l'idée de la distribution quantique de clés (QKD), nous présentons le premier protocole, introduit en 1984 par Bennett et Brassard, connu sous le nom de BB84 [1]. Rappelons que l'objectif de ce protocole est d'établir une clé secrète partagée, qui sera ensuite utilisée pour exécuter le one-time pad. Dans le cas du protocole BB84, la clé est établie de la manière suivante :
- Alice choisit aléatoirement l'un des quatre états possibles
    ```{math}
    :label: bb84enc
    \ket{\pm x}=\frac{1}{\sqrt 2}(\ket 0\pm\ket 1)\quad
    \ket{\pm y}=\frac{1}{\sqrt 2}(\ket 0\pm i\ket 1) .
    ```
- Le bit 0 (1) est encode sur $\ket{+x}$ et $\ket{+y}$
($\ket{-x}$ et $\ket{-y}$). Les vecteurs $\ket{\pm x}$ et
$\ket{\pm y}$ définissent respectivement les bases $x$ et $y$.
- Bob mesure aléatoirement dans l'une de ces deux bases. Il convertit son résultat en un bit classique en utilisant la même convention qu'Alice.
- Alice et Bob annoncent les bases utilisées respectivement pour la préparation et la mesure. Si les bases concordent, les résultats produits par le protocole sont conservés, sinon ils sont écartés. Ce processus est connu sous le nom de réconciliation des bases.

Notez que si les bases d'Alice et Bob concordent, leurs bits sont parfaitement corrélés. En revanche, si les bases sont différentes, la préparation d'Alice et le résultat de Bob sont complètement décorrélés. En effet, supposons qu'Alice ait envoyé $\ket{\pm x}$ et que Bob mesure dans la base $y$. Il obtiendra le résultat correspondant à  $\ket{\pm y}$ avec une probabilité de $p(\pm y|\pm x)=|\langle \pm x\ket{\pm y}|^2=1/2$, ce qui est équivalent à ce que Bob ignore l’état d’Alice et lance une pièce.
Ainsi, après la réconciliation des bases, Alice et Bob écartent toutes les mauvaises instances et partagent une liste de bits aléatoires parfaitement corrélés. Avant de continuer, notez qu'Alice et Bob peuvent utiliser n'importe quelle paire de bases sur la sphère de Bloch satisfaisant  le produit scalaire précédent. Les bases $x$ et $y$ apparaissent dans la formulation originale du protocole, mais on pourrait tout aussi bien le formuler en utilisant les bases $x$ and $z$. De fait, ce choix est equivalent mais souvent plus simple en termes de notation.

Analysons brièvement pourquoi Eve ne peut pas briser ce protocole. Elle doit interagir avec la particule quantique, disons un photon, encodant l'information pendant qu'il se propage vers Bob. Le théorème de non-clonage implique qu'elle ne peut pas en faire une copie parfaite, envoyer le premier clone à Bob et garder le second. Cependant, elle peut essayer de mesurer l'état quantique de la particule et lire l'information. Mais, à ce stade du protocole, elle ne connaît pas la base choisie par Alice. Considérons d'abord qu'Eve mesure dans la bonne base. Elle obtient alors toutes les informations et peut préparer une nouvelle copie de l'état pour Bob. Elle obtient toutes les informations sur le symbole d'Alice et n'introduit aucune erreur du côté de Bob. Maintenant, supposons qu'Eve mesure dans une base différente de celle d'Alice. Eve obtiendra le bon bit avec une probabilité de un sur deux, ce qui signifie que son information est nulle. Elle prépare ensuite un nouvel état pour Bob selon son résultat de mesure, qui peut ne pas être identique à celui envoyé par Alice. Concentrons-nous maintenant sur les cas où la base de Bob est la même que celle d'Alice (après tout, ce sont les seuls cas conservés après le processus de réconciliation des bases). Puisque Eve a préparé un état "incorrect", Bob obtiendra le résultat attendu avec une probabilité de un sur deux. C'est-à-dire que la stratégie d'Eve introduit des erreurs du côté de Bob. Alice et Bob peuvent détecter l'intervention d'Eve en rendant publics une fraction des symboles où leurs bases concordent. S'il n'y a pas d'erreurs, il est très probable que personne n'a essayé d'espionner leur communication, et ils peuvent utiliser en toute sécurité les bits restants comme clé secrète. S'ils constatent des erreurs, il se peut que quelqu'un espionne le canal, ils annulent alors le processus. Par conséquent, ce que BB84 empêche, c'est qu'un espion lise la clé qu'Alice et Bob échangent sans être détecté.

Il est crucial pour la sécurité du protocole que le canal soit authentifié, c'est-à-dire qu'Alice et Bob sachent qu'ils communiquent bien entre eux, par exemple lors du processus de réconciliation des bases. Si ce n'est pas le cas, Eve pourrait exécuter le protocole séparément avec Alice et Bob, établir deux clés secrètes différentes avec eux, et pirater la communication a posteriori. Alice et Bob doivent donc authentifier leur canal, ce qui est possible s'ils partagent initialement une clé secrète. Cela introduit une forme de circularité dans l'argument, mais le point principal est que la quantité de bits de clé secrète nécessaires pour authentifier les canaux peut être faible. Une fois cela fait et le processus de QKD démarré, la nouvelle clé générée peut être utilisée lorsque nécessaire pour l'authentification.

Opérationnellement, cette description du protocole est loin d'être complète. Premièrement, nous avons analysé une attaque spécifique d'interception et de réémission par Eve où (i) elle intercepte les qubits envoyés, (ii) les mesure, et (iii) prépare un nouvel état pour Bob en fonction du résultat obtenu. Cependant, l'objectif est de prouver la sécurité du protocole contre toute attaque possible par Eve. Deuxièmement, d'un point de vue pratique, il est inutile de concevoir un protocole qui est annulé chaque fois que des erreurs sont constatées. Il serait annulé dans toute mise en œuvre réaliste et donc bruitée ! Heureusement, ces deux problèmes peuvent être résolus et il est possible de concevoir des preuves de sécurité générales qui sont valables contre toute attaque dans une situation bruyante. En fait, l'objectif d'une preuve de sécurité est de montrer comment Alice et Bob peuvent distiller une clé secrète en présence d'erreurs. Nous présentons ci-dessous les principales idées pour construire une preuve de sécurité générale pour les protocoles QKD. Mais d'abord, nous discutons d'autres exemples de protocoles, montrant que de nombreuses variantes sont possibles.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



