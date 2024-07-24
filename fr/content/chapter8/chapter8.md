
# Scenario Indépendant des Dispositifs (Device-Independent)

a solution aux précédentes attaques de piratage est fournie par le scénario dit indépendant des dispositifs (DI){cite}`diqkd`. Dans cette approche, les dispositifs quantiques sont considérés comme des boîtes noires avec lesquelles les utilisateurs peuvent interagir, fournissant une entrée classique et en obtenant une sortie classique. L'approche DI est assez générale et peut, en fait, être appliquée à n'importe quel protocole d'information quantique. Dans ce qui suit, nous nous concentrerons sur la distribution quantique de clés (QKD).


Dans le scénario DI, les dispositifs sont considérés comme des boîtes noires quantiques traitant une entrée classique pour produire une sortie classique. On suppose que le processus d'entrée-sortie dans un dispositif donné se déroule localement, ce qui signifie qu'il n'est pas influencé causalement par ce qui se passe dans les autres dispositifs. Cela peut, par exemple, être imposé en synchronisant les dispositifs de sorte que ces processus d'entrée-sortie définissent des événements séparés par un intervalle de genre espace, de telles sorte qu’il n’y ait pas le temps d’envoyer un signal, même ceux se propageant à la vitesse de la lumière, d'un dispositif à un autre. Cependant, il peut exister d'autres moyens d'imposer cette hypothèse de non-communication.

ans un contexte de QKD, Alice et Bob disposent chacun d'un dispositif, voir {numref}`difig`. Sans perte de généralité, nous supposons que leurs entrées, notées $x$ et $y$, peuvent prendre $m$ valeurs possibles et que leurs sorties, notées $a$ et $b$, peuvent prendre $r$ résultats possibles, c'est-à-dire $x,y=1,\ldots,m$ et $a,b=1,\ldots,r$. Alice et Bob utilisent leurs dispositifs pour différentes entrées, collectant les statistiques qu'ils génèrent. Celles-ci sont encapsulées par la distribution de probabilité conditionnelle $p(ab|xy)$, qui correspond à la probabilité pour Alice et Bob d’observer les résultats $a$ et $b$, respectivement, pour des entrées $x$ et $y$ données. Nous avons donc une liste de $m^2r^2$ nombres réels tels que $p(ab|xy)\geq 0$ et $\sum_{ab}p(ab|xy)=1$ pour tout $x$ et $y$. Cette distribution de probabilité conditionnelle est également appelée *corrélations*. Le but d'un protocole DIQKD est de conclure à partir de ces corrélations observées, et d'elles seules, que les parties peuvent distiller une clé secrète. Si c'est le cas, il ne peut y avoir aucune divergence entre le modèle et l'implémentation. En effet, aucun modèle n'est apposé sur ces dispositifs, hormis le fait que le processus à l'intérieur des boîtes noires conduisant à la production de la sortie étant donnée l'entrée doit être compatible avec les lois quantiques. 

```{figure} ./Correlations.png
---
height: 400px
name: difig
---
Scénario indépendant des dispositifs : Alice et Bob modélisent leurs dispositifs comme des boîtes noires quantiques produisant une sortie classique étant donnée une entrée classique. La description de l'expérience se fait au moyen des statistiques observées, données par la distribution de probabilité conditionnelle $p(ab|xy)$. l existe trois principaux ensembles de corrélations physiques : classiques, quantiques et sans communication (non-signalling). Le premier est strictement inclus dans le deuxième qui, à son tour, est également strictement inclus dans le troisième. ```

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



