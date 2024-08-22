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

# Corrélations Physiques

La principale raison pour laquelle les applications DI sont possibles est qu'il est supposé que les dispositifs sont compatibles avec une théorie physique, dans notre cas par exemple la mécanique quantique, ce qui impose des contraintes non triviales sur les corrélations observées.

La contrainte la plus faible qui peut être imposée est que les corrélations n'autorisent aucune forme de communication entre Alice et Bob. Comme mentionné, il s'agit de l'une des rares hypothèses du formalisme, qui peut être imposée, par exemple, par des considérations spatio-temporelles. Certaines corrélations sont compatibles avec cette hypothèse si et seulement si la distribution de probabilité marginale observée par l'une des parties, disons Alice, est indépendante de l'entrée utilisée par l'autre, Bob. En effet, si ce n'était pas le cas, Bob, en choisissant son entrée, pourrait produire un effet notable sur Alice, c'est-à-dire qu'il pourrait lui envoyer un signal. Ces contraintes sont connues sous le nom de conditions de non-communication (non-signalling) et donnent naissance aux corrélations dites de non-signalling. Elles impliquent que les corrélations satisfont les contraintes linéaires
```{math}
:label: nscorrelations
\forall y: p_A(a|x)=\sum_b p(ab|xy), \quad\quad
\forall x: p_B(b|y)=\sum_a p(ab|xy).
```

L’ensemble des corrélations non-signalling, note $\mathcal{NS}$, est convexe, et il peut être prouvé que pour des $m$ et $r$ finis, il a un nombre fini de points extrêmes, ce qui définit un polytope.

Avant l'avènement de la théorie quantique, la méthode standard pour décrire les corrélations reposait sur des modèles classiques déterministes. Ces modèles définissent ce que l'on appelle les corrélations *classiques*, qui sont celles pouvant être exprimées comme
```{math}
:label:
p(ab|xy)\sum_\lambda p(\lambda)D_A(a|x\lambda)D_B(b|y\lambda) ,
```

où $\lambda$ désigne une variable classique cachée corrélée dans les dispositifs, décrite par la distribution de probabilité $p(\lambda)$, tandis que $D_A$ et $D_B$ sont des fonctions déterministes produisant les sorties en fonction des entrées et de cette variable. Les corrélations classiques ne sont rien d'autre que les corrélations EPR introduites dans {cite}`epr`. Pour des $m$ et $r$ finis, l’ensemble des corrélations classiques $\mathcal C$ est aussi un polytope, i.e., un ensemble convexe avec un nombre fini de points.
Enfin, l'ensemble qui nous intéresse ici est celui des corrélations quantiques. Cet ensemble est défini par les corrélations qui peuvent être obtenues lors de mesures locales sur un état quantique à deux parties. Ainsi, les corrélations sont quantiques chaque fois qu'il existe un état agissant sur un espace de Hilbert composite $\mathcal H_A\otimes\mathcal H_B$ et une mesure locale dans chaque espace de Hilbert défini par les éléments POVMs $M_{a|x}$ et $M_{b|y}$, des opérateurs positifs et tels que $\sum_a M_{a|x}=\one_A$ pour tout $x$ et $\sum_a M_{b|y}=\one_B$ pour tout $y$, de telle sorte que

```{math}
:label: qcorrelations
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{a|x}) .
```
Notez que nous n'imposons aucune condition spécifique sur les espaces de Hilbert utilisés pour dériver ces corrélations : ils sont arbitraires. En particulier, les dimensions des espaces de Hilbert ne sont pas spécifiées, c'est-à-dire que les systèmes mesurés peuvent être des qubits, des qutrits, ou même des systèmes de dimension infinie. En réalité, la caractérisation des corrélations quantiques, c'est-à-dire trouver quelles distributions de probabilité conditionnelles peuvent être exprimées comme dans Eq. {eq}`qcorrelations`, est très compliquée, car, intuitivement, elle requiert d'explorer tous les espaces de Hilbert possibles. L’ensemble des corrélations quantiques $\mathcal Q$ est également convexe mais n’a pas de nombre fini de points extrêmes (ce n’est donc pas un polytope). 
La relation entre ces trois ensembles physiques est relativement bien comprise : $\mathcal C \subsetneq \mathcal Q \subsetneq \mathcal{NS}$. Une représentation graphique de ces ensembles est donnée par {numref}`difig`, qui illustre les propriétés les plus marquantes de ces ensembles. La première inclusion stricte découle directement du théorème de Bell, qui établit l'existence de corrélations quantiques sans analogue classique. En effet, les facettes de l'ensemble classique définissent les inégalités de Bell, des hyperplans qui expriment des conditions linéaires en termes des corrélations observées, satisfaites par toutes les corrélations classiques (l'ensemble des corrélations classiques étant entièrement contenu d'un côté de l'hyperplan).
La deuxième inclusion a été démontrée par Tsirelson et, indépendamment, par Popescu et Rohrlich {cite}`PRbox`. Ils ont introduits les fameuses boîtes Popescu-Rohrlich (PR), une distribution de probabilité conditionnelle $p(ab|xy)\in\mathcal{NS}$ qui n'a pas de réalisation quantique. Cette distribution est obtenue pour le cas d'entrées et de sorties binaires, $m=r=2$. En représentant les valeurs des entrées et des sorties par des bits, la PR-box est telle que $p(ab|xy)=\delta_{a\oplus b=xy}/2$. Ici, $\oplus$ correspond au XOR classique, tandis que $xy$ correspond au AND des bits $x$ et $y$. Deux exemples pour comprendre la notation : 

```{math}
p(a=1,b=1|x=1,y=1)=\delta_{1\oplus 1=AND(1,1)}/2=\delta_{0,1}/2=0,\\
p(a=0,b=0|x=0,y=1)=\delta_{0\oplus 0=AND(0,1)}/2=\delta_{0,0}/2=1/2.
```

De manière plus compacte, lorsque $xy=0$ ($xy=1$), les sorties d'Alice et de Bob sont parfaitement (anti-)corrélées et apparaissent avec la même probabilité. La preuve que ces corrélations ne sont pas quantiques découle du fait qu'elles conduisent à une valeur CHSH de 4, supérieure au maximum autorisé par la physique quantique, qui est $2\sqrt 2$ {cite}`tsirelson`. Pour voir que ces corrélations produisent une valeur CHSH égale à $4$, il est pratique de renommer les sorties $a,b=\pm 1$ et les  entrées $x,y=1,2$. Lorsque au moins une entrée est égale à 1 (0 dans la notation binaire utilisée pour spécifier la boîte PR), les sorties sont parfaitement corrélées, donc $ab=+1$, ainsi $A_1B_1=A_1B_2=A_2B_1=+1$, tandis que lorsque les deux entrées sont égales à 2 (1 dans la notation binaire), les sorties sont parfaitement anti-corrélées, on a donc $A_2B_2=-1$. Ces valeurs produisent la valeur maximale post-quantique de $\text{CHSH}=4$.

Après cette courte digression visant à expliquer pourquoi les corrélations deviennent significatives lorsqu'elles sont combinées avec une théorie ou un principe physique, nous allons présenter les idées clés pour concevoir des protocoles d'information quantique indépendants des dispositifs. Il est important de noter que, dans le scénario des protocoles indépendants des dispositifs (DI), pour qu'Alice et Bob obtiennent des résultats impossibles à obtenir dans la théorie de l'information classique, ils doivent observer des corrélations qui ne peuvent pas être expliquées par un modèle classique, c’est-à-dire des corrélations qui violent une inégalité de Bell. En effet, les inégalités de Bell servent de témoins pour l’origine intrinsèquement quantique ou non classique de ces corrélations. En supposant que les dispositifs sont quantiques, nous pouvons nous concentrer sur les corrélations dans $\mathcal Q$ et ignorer celles dans $\mathcal{NS}$ qui n’ont pas de réalisation quantique.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



