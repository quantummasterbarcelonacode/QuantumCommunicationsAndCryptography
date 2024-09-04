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




# Répéteurs Quantiques

L'utilisation de la distillation d'intrication élargit l'ensemble des canaux permettant une communication quantique fiable. Cependant, ce n'est pas la solution finale. En effet, il existe des états à partir desquels on ne peut pas distiller des états maximalement intriqués. L'exemple le plus simple est donné par les états séparables : clairement, aucune intrication ne peut être distillée à partir d'un état non intriqué. En ce qui concerne les canaux, il existe des canaux pour lesquels tout état de sortie est séparable. Ces canaux sont appelés canaux briseurs d'intrication, pour des raisons évidentes. On sait qu'un canal $\Lambda$ est un briseur d'intrication si, et seulement si, l'état obtenu lorsqu'on applique le canal à une moitié d'un état maximalement intriqué est séparable. Un exemple simple de tel canal est donné par le canal de dépolarisation, Eq. {eq}`depchannel`, avec $0 \leq p \leq 1/3$. Il existe même des canaux qui permettent la distribution d'intrication, mais les états intriqués obtenus ne peuvent pas être distillés en états maximalement intriqués. Ces états sont connus sous le nom d'états liés par l'intrication {cite}`horodecki`. Les canaux briseurs d'intrication, ou les canaux qui distribuent au plus de l'intrication lié, ont $\text{QC}^\leftrightarrow=0$. Au-delà de ces considérations plus académiques, même pour le canal purement à perte, et malgré le fait qu'un tel canal a en principe une capacité quantique positive pour toutes les pertes, le taux de communication quantique diminue avec la transmission du canal, décroissant donc de manière exponentielle avec la distance entre Alice et Bob. Dans une mise en œuvre réaliste, la communication quantique devient impraticable après, disons, quelques centaines de kilomètres.

En fait, déjà dans la théorie de l'information classique, et malgré le fait que tous les canaux non triviaux ont une capacité quantique strictement positive, la transmission directe devient inutile à un moment donné. La solution réside dans la division du long canal à perte en segments où placer des nœuds, ou répéteurs, qui lisent l'information, la corrigent et préparent une nouvelle copie parfaite pour le prochain nœud. Si l'on suivait littéralement cette idée, il faudrait placer des répéteurs dès que le canal ne permet pas la correction d'erreurs quantiques, ce qui impliquerait que des répéteurs seraient nécessaires après des distances très courtes. La solution consiste alors à combiner l'idée des répéteurs avec l'intrication, menant au concept de *répéteur quantique* {cite}`qrep`. L'idée exploite beaucoup des outils expliqués ci-dessus, ainsi que le protocole de *l'échange d'intrication*. L'échange d'intrication considère la situation dans laquelle le protocole de téléportation est appliqué à une moitié d'un état maximalement intriqué. Ce protocole est déjà discuté dans le papier original sur la téléportation {cite}`teleportation`, et développé dans {cite}`entswap`. Imaginez la situation où trois parties partagent deux états maximalement intriqués comme suit : Alice partage un état maximement intriqué $\ket{\Phi^+}{AB_1}$ avec Bob, qui, à son tour, partage un autre état maximement intriqué $\ket{\Phi^+}{B_2C}$ avec Charlie. Maintenant, si Bob téléporte la particule $B_1$ à Charlie en utilisant ce deuxième état, l'intrication est échangé et maintenant Alice et Charlie partagent un état $\ket{\Phi^+}_{AC}$, tandis que toute intrication avec Bob est détruit. La mesure de Bob mappe l'intrication qu'il a avec Alice et Charlie en une intrication directe entre eux.

L'idée intuitive d'un répéteur quantique est la suivante, voir aussi {numref}`qrepfig`. Considérez deux parties éloignées connectées par un canal très bruité pour lequel la communication quantique directe est impraticable, voire impossible. Plusieurs stations intermédiaires, les répéteurs, sont placées à travers le canal, de sorte que le canal effectif entre chaque répéteur consécutif a une qualité bien meilleure. Maintenant, des états intriqués sont distribués à travers les différents nœuds. Étant donné que les canaux ont une meilleure qualité, les états intriqués moins bruités peuvent maintenant être distillés en états maximalement intriqués connectant tous les nœuds du canal. Les parties effectuent ensuite un échange d'intrication afin que toutes les paires intriquées soient maintenant partagées entre les deux nœuds terminaux, Alice et Bob. Enfin, Alice et Bob utilisent ces paires pour échanger de manière fiable de l'information quantique par téléportation. Le protocole, bien qu'intuitivement attrayant, est cependant très difficile, car les nœuds doivent effectuer des opérations sur plusieurs qubits et les stocker dans des mémoires sans décohérence pendant l'exécution du protocole. Aucune démonstration de configuration de répéteur, même avec un seul répéteur et dans un environnement de laboratoire, n'a encore été réalisée, bien que plusieurs groupes dans le monde entier travaillent intensivement sur le développement de tous les ingrédients nécessaires à cela.

```{figure} ./QRepeater.png
---
height: 400px
name: qrepfig
---
Répéteurs quantiques :(i) Alice et Bob sont connectés par un canal très bruité $\Lambda_L$, où la communication quantique est impraticable ou même impossible. (ii) Des stations intermédiaires appelées répéteurs sont ajoutées, de sorte que le canal résultant connectant différents nœuds, $\Lambda_{L'}$, a une qualité bien meilleure et permet la distribution d'états intriqués distillables. (iii) Les parties utilisent le canal $n$ fois pour distribuer l'intrication, ce qui donne $n$ copies d'un état intriqué mixte. (iv) Ces états mixtes sont distillés en $m$ états maximalement intriqués par des opérations LOCC (Local Operations and Classical Communication). (v) L'intrication est mappé vers les nœuds finaux au moyen de l'échange d'intrication, permettant ainsi une communication quantique fiable par téléportation quantique.
```

En rassemblant toutes ces idées, nous arrivons au concept *d'internet quantique* {cite}`kimble`, où différents nœuds disposeront d'ordinateurs quantiques capables d'effectuer toutes les opérations quantiques sur leurs états, de les stocker dans des mémoires quantiques et d'échanger des bits quantiques à travers l'intrication et la téléportation. C'est l'objectif ultime de la communication quantique.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

