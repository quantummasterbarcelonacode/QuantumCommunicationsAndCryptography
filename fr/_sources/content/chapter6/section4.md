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



# Protocoles à états leurres

La solution finale aux attaques PNS a été fournie par Hwang {cite}`decoy` sous la forme des protocoles dits à états leurres. Dans leur version la plus simple, Alice choisit aléatoirement si elle encode son bit dans un état cohérent atténué avec des intensités différentes $\mu_1$ ou $\mu_2$. Expérimentalement, cela n'est pas particulièrement difficile ; tout ce qu'Alice doit faire est de moduler l'intensité de la lumière. Elle envoie l'état à Bob, qui le mesure comme prévu dans une implémentation BB84. À la fin du protocole, Alice annonce également l'amplitude qu'elle a réellement utilisée pour l'encodage, permettant à Bob d'estimer le taux de photons reçus dans les deux cas, $R_B^{(1)}$ et $R_B^{(2)}$. Ce qui suit montre l'intuition de comment l'utilisation de deux amplitudes permet aux parties honnêtes de détecter Eve lorsqu'elle met en œuvre l'attaque PNS standard. Ce n'est pas une preuve de sécurité complète, mais cela illustre les principales idées du protocole.

En l'absence d'Eve, lorsque Alice et Bob sont connectés par une fibre qui induit des pertes, les deux taux sont $R_B^{(i)} = f \mu_i \eta_C$, pour $i = 1,2$. Le ratio entre ces deux amplitudes est donc égal au ratio des amplitudes des états cohérents, $R_B^{(1)} / R_B^{(2)} = \mu_1 / \mu_2$. Lorsque Eve met en œuvre les attaques PNS, les taux obtenus sont essentiellement donnés par les impulsions à deux photons, donc on a $R_B^{(i)} \sim p_2^{(i)} \sim \mu_i^2$. Par conséquent, si Eve a appliqué l'attaque, Alice et Bob remarqueraient un ratio inattendu entre les deux taux, qui serait désormais proportionnel au carré du ratio des intensités et non au ratio lui-même. Dans ce cas, Alice et Bob interrompent la communication non sécurisée. Ajouter plus d'intensités rend la vie d'Eve encore plus difficile, et il peut être prouvé que le taux attendu tend vers le taux idéal, proportionnel à $\eta_C$.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

