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


# Protocole Ekert 

Dans tous les protocoles précédents, sauf le dernier, l'intrication ne joue aucun rôle : Alice prépare des états de particules uniques qui sont envoyés à Bob et mesurés par lui. En 1991, Artur Ekert a proposé un nouveau schéma pour la QKD sécurisée basé sur des états intriqués et une violation des inégalités de Bell {cite}`Ekert`. Ekert n'était pas au courant des travaux précédents de Bennett et Brassard, qui apparaissent dans les publications d'une conférence en informatique. De fait, il a (re)découvert la QKD de manière indépendante. Cependant, son approche du problème fut complètement différente, basée sur les violations des inégalités de Bell produites par des états intriqués plutôt que sur la non-orthogonalité des états quantiques.

Le protocole d'Ekert fonctionne comme suit (nous donnons ici une version légèrement différente de son protocole original, qui est plus simple mais conceptuellement équivalente) : Alice et Bob reçoivent des bits quantiques corrélés supposés être dans un état maximalement intriqué, disons l'état {eq}`bellstate`. 
Alice et Bob appliquent chacun les deux mesures $A_1$,
$A_2$ et $B_1$ and $B_2$ données dans {numref}`CHSHfig`, qui maximisent la valeur de l'inégalité CHSH. De plus, Alice applique une troisième mesure $A_3$ dans la même direction que l'une des mesures de Bob, disons $B_1$, pour obtenir des résultats parfaitement corrélés. L'idée est que les parties honnêtes obtiennent une clé à partir de $A_3$ and $B_1$, qui sont parfaitement alignées, tout en calculant la valeur de CHSH pour garantir qu'elles partagent un état maximalement intriqué. Dans le cas idéal, ce paramètre devrait être égal à $2\sqrt 2$.

L'intuition derrière ce protocole est que si les mesures d'Alice et Bob conduisent à une violation des inégalités de Bell, il n'existe pas de modèle à variables cachées locales reproduisant les résultats. Cette absence de modèle à variables cachées locales devrait garantir la confidentialité des résultats obtenus. En d'autres termes, si Eve pouvait prédire les résultats des parties honnêtes, cela constituerait un modèle à variables cachées locales pour l'expérience. Cependant, cela est impossible car les données observées violent une inégalité de Bell. Néanmoins, ceci n'est que l'argument intuitif qui a conduit Ekert à la construction de ce protocole, mais cela ne représente pas une preuve de sécurité.

## Bibliographie de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


