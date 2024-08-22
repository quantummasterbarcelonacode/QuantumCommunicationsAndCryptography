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


# Implémentations

Bien que cela reste difficile, les protocoles de QKD (Quantum Key Distribution) sont plus simples à mettre en œuvre que d'autres applications de l'information quantique, comme les ordinateurs quantiques. En effet, ils nécessitent « seulement » la préparation d'états à un seul qubit par Alice, qui sont immédiatement envoyés à Bob, qui les mesure dès leur réception. Le principal défi est que, pour que les protocoles de QKD soient pratiques, l'état quantique doit voyager sur de longues distances. Par conséquent, les implémentations de QKD doivent faire face au problème de la communication quantique à longue distance. La lumière est le support idéal pour cela, donc Alice doit envoyer ses états quantiques à Bob en utilisant des impulsions lumineuses au niveau quantique. Il existe trois scénarios principaux pour les protocoles de QKD dans des configurations de préparation-et-mesure :

- **Transmission en espace libre**: ici, Alice et Bob échangent des états quantiques à travers l'espace libre. La polarisation est un degré de liberté pratique pour le codage. Le principal défi est que les photons uniques ont une forte probabilité de se perdre lors de leur propagation à travers l'atmosphère en raison de la présence de particules. Cette solution est donc adoptée pour certaines applications spécifiques de communications sécurisées à courte distance, par exemple entre deux bâtiments dans une zone métropolitaine.

- **Transmission par fibre optique**: dans notre vie quotidienne, les fibres optiques représentent le moyen le plus adapté pour transmettre la lumière sur de longues distances, ce qui est également vrai pour la lumière au niveau des photons uniques. La polarisation n'est pas très pratique dans ce cas, car elle se couple à d'autres degrés de liberté de la lumière lors de sa propagation. Une solution plutôt standard consiste à encoder l'information quantique dans différentes impulsions décalées dans le temps, également connue sous le nom d'encodage par tranches temporelles. Nous discuterons ci-dessous de certains schémas utilisant cet encodage. Les pertes s'avèrent être encore le principal défi. Dans une fibre optique, la probabilité (notée $\eta_C$) qu'un seul photon soit transmis à travers le canal est exponentielle avec la distance, $L$, donc on a

    ```{math}
    :label: channellosses
        \label{channellosses}
        \eta_C=e^{-\lambda L} .
    ```

    Lorsque cette formule pour le coefficient de transmission est exprimée en dB, $\eta_C = 10^{-\lambda'L/10}$, où les valeurs typiques de $\lambda'$ sont de l'ordre de 0,2 dB/km. Par exemple, pour $L = 15$ km, on a $\eta_C = 10^{-0,2L/10} \approx 1/2$. Comme les pertes augmentent exponentiellement avec la distance, à des distances très longues, le taux de tout protocole, c'est-à-dire le nombre de photons que Bob reçoit par seconde, devient négligeable et le protocole devient inutile. Les distances de, disons, 200 km deviennent impraticables. Cette solution est donc adoptée uniquement dans les zones métropolitaines ou entre des villes proches.

- **Communication quantique par satellite**: c'est la seule solution viable pour la transmission quantique directe sur de longues distances. Étant donné que la densité de l'atmosphère diminue rapidement avec l'altitude, cette solution permet d'atteindre des distances de l'ordre de plusieurs centaines de kilomètres. L'alignement correct de la lumière du satellite vers les stations terrestres est difficile. Et, bien sûr, cette solution n'est pas bon marché.

Ci-dessous, nous discutons également des schémas pour la communication quantique à longue distance basée sur l'intrication. Ces schémas peuvent également être utilisés pour la QKD sécurisée à longue distance, mais ils sont beaucoup plus complexes et, en particulier, vont au-delà des transmissions directes simples des protocoles de type préparation-et-mesure. Après cette vue d'ensemble rapide des approches existantes, nous discutons maintenant de plusieurs implémentations de QKD plus en détail. Cela est également utile pour illustrer toutes les subtilités qui apparaissent lors de l'adoption des protocoles de QKD dans un scénario pratique et comment de nouvelles préoccupations en matière de sécurité apparaissent.









