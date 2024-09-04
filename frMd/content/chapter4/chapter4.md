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



# Structure Générale des Protocoles QKD

La structure générale d'un protocole QKD est la suivante :

1) Répéter $N$ fois : Alice prépare l'état $\ket{\psi_a}$ avec une probabilité $p_a$ et l'envoie à Bob par un canal non sécurisé. Bob effectue la mesure $M_j$ avec une probabilité $p_j$ sur la particule reçue, obtenant le résultat $r$. Après ce processus, Alice et Bob ont une liste de $N$ symboles correspondant aux états préparés du côté d'Alice $\vec a=(a_1\ldots a_N)$ et aux mesures effectuées du côté de Bob $\vec b=(b_1\ldots b_N)$. Notez que nous avons ici combiné la mesure choisie par Bob $j$ et le résultat obtenu $r$ au sein de $b$, c'est-à-dire $b=(j,r)$.
2) Alice et Bob annoncent l'état préparé, la mesure effectuée et le résultat pour $n$ de ces tours. Cela leur permet d'estimer les fréquences d'obtention du résultat $r$ lors de la mesure $j$ sur l'état $\ket{\psi_i}$.
3) En utilisant ces informations et la preuve de sécurité, Alice et Bob peuvent traiter leurs listes classiques de symboles $\vec a$ et $\vec b$ pour extraire une clé secrète de longueur $K$, $\vec k=(k_1\ldots k_K)$. La longueur de cette clé dépend du tour d'estimation précédent. Si la qualité du canal est trop mauvaise, Alice et Bob concluent qu'aucune distillation de clé n'est possible, $K=0$, et le protocole est interrompu.

Plusieurs remarques sont importantes ici :
- En principe, plus le nombre total de tours $N$ est élevé, meilleure est la performance du protocole : avoir plus de tours réduit les fluctuations statistiques lors de l'estimation des propriétés du canal, permettant à Alice et Bob d'avoir une compréhension beaucoup plus précise du processus de distillation de clé. Dans la limite de $N\rightarrow\infty$, on peut définir le taux de clé $k=\lim_{N\rightarrow\infty} K/N$.
- Le nombre de tours annoncés $n$ doit être suffisant pour obtenir une estimation fiable des propriétés du canal, c'est-à-dire pour accumuler suffisamment de statistiques afin que ces propriétés soient déterminées avec une confiance prédéterminée. Cependant, pour optimiser la performance du protocole, $n$ ne doit pas être beaucoup plus grand que ce minimum, car ces tours ne contribuent pas à la clé secrète. Dans la limite de grands $N$, on peut avoir des valeurs très grandes de $n$, et donc une estimation arbitrairement bonne des propriétés du canal, mais de telle sorte que $n\ll N$. En d'autres termes, l'estimation affecte à peine le taux de clé asymptotique.
- La preuve de sécurité, discutée ci-dessous, est cruciale à l'étape 3 pour comprendre comment Alice et Bob doivent distiller la clé à partir de la liste de symboles bruités $\vec a$ et $\vec b$.

Dans le cas de BB84, $a=(b_A,p)$, où $b_A$ spécifie le choix de base d'Alice et $p$ l'élément préparé de la base, de sorte que $a$ peut être égal à $(z,\pm 1)$ ou $(x,\pm 1)$. Ces quatre états sont préparés avec la même probabilité de $1/4$. Du côté de Bob, nous pouvons également écrire $b=(b_B,r)$, où $b_B$ désigne maintenant le choix de base de Bob. Dans le cadre du processus de distillation de clé à l'étape 3, Alice et Bob effectuent un processus de réconciliation de bases dans lequel ils conservent uniquement les symboles pour lesquels $b_A=b_B$, transformant la liste initiale de symboles obtenus à l'étape 1 en la clé finale.

Le protocole dans le cadre de l'intrication est très similaire, mais l'étape 1 est maintenant remplacée par :
1) Répéter $N$ fois : Alice prépare l'état $\ket{\Psi}{AA'}=\sum_a \sqrt{p_a}\ket a_A\otimes\ket{\psi_a}{A'}$, où ${\ket{a}}$ définit une base arbitraire dans le système $A$. Elle mesure le système $A$ dans cette base obtenant le résultat $a$ avec une probabilité $p_a$. Elle envoie ensuite le système $A'$, qui est dans l'état $\ket{\psi_a}$, à Bob par le canal non sécurisé. Bob effectue l'une des mesures $M_j$ avec une probabilité $p_j$ sur la particule reçue, obtenant le résultat $r$. Après ce processus, Alice et Bob ont chacun une liste de $N$ symboles correspondant au résultat de mesure du côté d'Alice $\vec a=(a_1\ldots a_N)$, et à la mesure effectuée du côté de Bob $\vec b=(b_1\ldots b_N)$. Notez que nous avons ici combiné la mesure choisie par Bob $j$ et le résultat obtenu $r$ au sein de $b$, c'est-à-dire $b=(j,r)$.

Dans le cas particulier de BB84, les quatre états peuvent être regroupés en deux bases. Cela simplifie le protocole équivalent basé sur l'intrication, qui, comme mentionné, peut être vu comme mesurant les bases $x$ et $z$ sur une moitié d'un état maximalement intriqué. Cependant, regrouper les états préparés en plus d'une base n'est généralement pas possible, cf. par exemple pour le protocole B92.

