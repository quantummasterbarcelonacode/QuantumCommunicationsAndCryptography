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

# Distribution de Clés Quantiques Indépendante des Dispositifs

Nous disposons à présent de la plupart des éléments nécessaires pour comprendre la structure des protocoles DIQKD. Il est important pour ce qui suit de comprendre que dans le scénario DI, il y a deux types de joueurs plutôt différents : les utilisateurs et le fournisseur. Les utilisateurs, Alice et Bob dans notre cas, exigent du fournisseur des dispositifs qui produisent certaines corrélations désirées $p(ab|xy)$ qui doivent violer une inégalité de  Bell. Ces corrélations ont une réalisation quantique spécifique, mais du point de vue des utilisateurs, cela n'est pas pertinent, car ils souhaitent établir une clé secrète indépendamment des détails de cette réalisation. En revanche, le fournisseur se soucie de la réalisation et doit préparer un état et des mesures permettant d'obtenir les corrélations demandées par l'utilisateur, sinon l'utilisateur n’achètera pas les dispositifs.

Commençons avec le cas ideal et le scenario le plus simple à entrées et sorties binaires, $a,b,x,y=1,2$. Pour établir une clé secrète dans le cadre DI, Alice et Bob exigent des dispositifs qu’ils produisent la violation quantique maximale de l'inégalité CHSH, à savoir$\text{CHSH}=2\sqrt 2$. However, if one looks at the correlations attaining this value, there are no inputs of Alice and Bob with perfectly correlated outputs. Cependant, si l'on examine les corrélations atteignant cette valeur, il n'existe pas d'entrées d'Alice et de Bob avec des sorties parfaitement corrélées. C'est pourquoi Bob a besoin d’une troisième valeur possible pour son entrée, $y=3$, dont la sortie est maintenant parfaitement corrélée à la sortie de l'une des entrées d'Alice, disons $x=1$. Pour ces combinaisons d'observables, les deux résultats d'Alice et Bob ont la même probabilité, mais ils sont identiques, c'est-à-dire $\langle A_1\otimes B_3\rangle=1$. Les entrées $x=1$ et $y=3$ seront celles utilisées pour établir la clé secrète. De fait, elles sont telles que $I(A:B)=1$. Cet arrangement définit le protocole de QKD CHSH {cite}`diqkd`, dans lequel Alice utilise une entrée binaire pour vérifier l'inégalité de Bell CHSH et une autre, $x=1$, pour établir la clé secrete, tandis que Bob possède une entrée à trois valeurs possibles, dont deux, $y=1,2$ sont utilisé pour le jeu CHSH et la troisième, $y=3$, pour établir la clé avec Alice. Pour évaluer l'information d'Eve, Alice et Bob utilisent le fait qu'il n'y a fondamentalement qu'une seule façon d'obtenir les violations maximales de l'inégalité CHSH, à savoir celle où Alice et Bob partagent un état de Bell {eq}`bellstate` sur lequel ils effectuent les opérations données dans {numref}`CHSHfig`. Il résulte de ce résultat, que nous ne démontrerons pas, que l’observation de $\text{CHSH}=2\sqrt 2$ implique que l’état partagé entre Alice et Bob est un état à deux qubits maximalement intriqués. Puisque cet état est pur, Eve ne peut pas s’y corréler. Son information est donc nulle, $\chi(A:E)=0$. La violation maximale de l'inégalité CHSH certifie donc qu'Alice et Bob peuvent établir une clé secrète parfaite, c'est-à-dire une liste de bits parfaitement corrélés, avec $I(A:B)=1$, sur laquelle Eve n’a aucune information, $\chi(A:E)=0$.

Que se passe-t-il lorsque les dispositifs sont bruités et, par conséquent, ne peuvent pas atteindre la violation maximale de CHSH ? Comme pour les QKD standard, il est nécessaire de dériver une preuve de sécurité qui permette à Alice et Bob de limiter l'information d'Eve en fonction de leurs corrélations observées. Rappelez-vous toutefois que, lors du calcul de cette limite, Alice et Bob ne doivent faire aucune hypothèse sur leurs dispositifs, à l'exception du fait qu'ils produisent les corrélations observées. Par continuité, une certaine tolérance au bruit est à prévoir. La question principale est de savoir si cette tolérance est raisonnable et réalisable dans des situations pratiques. Le problème d'optimisation qu'Alice et Bob doivent résoudre est

```{math}
:label: DIHolevo
&&\max_{\rho_{AB},\{M_{a|x}\},\{M_{b|y}\}}\chi(A:E)\\
&&\text{such that }\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})=p(ab|xy) .\nonumber
```

Cette optimisation s’effectue en prennant en compte toutes les attaques possibles d’Eve, c'est-à-dire tous les états et mesures dans tous les espaces de Hilbert possibles compatibles avec les corrélations observées. Il est important de noter que l'information de Holevo d'Eve est une fonction de l'état partagé entre Alice et Bob ainsi que des mesures effectuées, puisque l'état spécifie la purification incluant Eve, $\ket{\psi}_{ABE}$, sur lesquelles sont appliquées les mesures pour calculer $\chi(A:E)$. L’optimisation {eq}`DIHolevo` est en general un problème très difficile à résoudre. On peut considérer une version plus faible de celle-ci dans laquelle seule la violation observée d'une inégalité de Bell produite par les corrélations entre Alice et Bob, notée $\beta$, est utilisée comme contrainte, c'est-à-dire que l'on remplace les contraintes sur les corrélations par $\beta(p(ab|xy))=\beta_{\text{obs}}$. L'optimisation résultante est encore très complexe, mais elle a été résolue pour le cas de CHSH dans {cite}`diqkd`. La solution est

```{math}
:label:
\chi(A:E)=h\left(\frac{1+\sqrt{(\text{CHSH}/2)^2-1}}{2}\right) ,
```

Où  $h(x)=-x\log_2x-(1-x)\log_2(1-x)$ est l’entropie binaire. Cette valeur permet de calculer les taux de clés dans le cas des attaques collectives, comme dans les protocoles QKD standards. Les taux résultants sont montrés dans {numref}`ratesfig`, aux côtés de ceux obtenus pour BB84. Pour une comparaison équitable, tout est exprimé en termes de taux d'erreur de bits quantiques (QBER), qui affecte également la violation observée de l'inégalité de Bell. Le QBER critique, c'est-à-dire la valeur pour laquelle la borne de Devetak-Winter est égale à zéro, pour le protocole CHSH est $\text{QBER}\approx 7\%$, tandis qu’il est égal à $\text{QBER}\approx 11\%$ pour BB84. La robustesse est plus faible, comme prévu, car dans le scénario DI, Eve dispose de plus d'attaques possibles, mais la valeur obtenue pour le QBER est réaliste et atteignable dans les expériences actuelles.

```{figure} ./Key_Rates.png
---
height: 400px
name: ratesfig
---
Taux pour les protocoles QKD : Comparaison des bornes de Devetak-Winter sur le taux de clé obtenues pour le protocole standard BB84 et le protocole DIQKD basé sur l'inégalité de Bell CHSH, en fonction du QBER. La borne devient nulle pour $\text{QBER}\approx 11\%$ et $\text{QBER}\approx 7\%$, respectivement.
```

La discussion précédente fournit les principales idées derrière les protocoles DIQKD et montre comment il est possible pour Alice et Bob d'extraire une clé sans faire d'hypothèses sur leurs dispositifs en exploitant des corrélations quantiques violant une inégalité de Bell. Récemment, un cadre général pour prouver la sécurité des protocoles DIQKD a été obtenu dan {cite}`EAT`. Les protocoles DIQKD offrent la forme la plus forte de sécurité quantique. Malheureusement, la réalisation des protocoles DIQKD est extrêmement difficile. Comme nous l'avons vu, en pratique, Alice et Bob sont connectés par un canal dégradé et les violations de Bell sont très fragiles face aux pertes. Cela explique pourquoi, jusqu'à présent, il n'existe pas de dispositifs commerciaux implémentant des protocoles DIQKD et, de fait, des démonstrations en laboratoire n'ont été réalisées que récemment {cite}`diexp1,diexp2,diexp3`. Malgré ces progrès, concevoir des méthodes pour observer une violation d'inégalité de Bell entre des parties distantes, ce qui pourrait ensuite être exploité pour un DIQKD sécurisé, reste un problème ouvert majeur.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```




