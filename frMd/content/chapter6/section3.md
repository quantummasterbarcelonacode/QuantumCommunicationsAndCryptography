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




# Protocole SARG

L'attaque PNS représentait une limitation importante pour les mises en œuvre de QKD, mais plusieurs solutions ont émergé après sa formulation. La première est le protocole Scarani-Acín-Ribordy-Gisin (SARG) {cite}`SARG`, qui montre comment un simple changement dans la manière dont l'information est traitée dans une mise en œuvre BB84 utilisant des états cohérents atténués diminue l'impact des attaques PNS. Dans SARG, Alice prépare les mêmes quatre états que dans BB84, et Bob effectue également les mêmes deux mesures. Ainsi, au niveau quantique, les deux protocoles sont identiques et il n'est pas nécessaire de modifier le matériel quantique pour passer de BB84 à SARG. Cependant, Alice code son bit comme montré dans {numref}`SARGfig` : le bit $0$ ($1$) est codé sur $\ket{\pm z}$ ($\ket{\pm x}$), c'est-à-dire que la base encode le bit.

Voyons maintenant comment Alice et Bob effectuent la réconciliation après que les états ont été préparés et mesurés. Alice annonce l'état effectivement envoyé et l'un de ses voisins dans la sphère de Bloch. Par exemple, si elle a codé le bit $0$ dans l'état $\ket{+z}$, elle annonce cet état et l'un des deux états $\ket{\pm x}$. Sans perdre de généralité, supposons qu'elle annonce $(+z,+x)$. Existe-t-il une situation dans laquelle Bob peut conclure de manière déterministe quel état Alice envoyait à partir de sa mesure effectuée et de son résultat ? Si Bob mesure dans la base $z$, il obtiendra le résultat $+1$ avec une probabilité de un. Ce résultat est cependant compatible avec les deux états annoncés par Alice, donc Bob ne peut parvenir à une discrimination non ambiguë et cette instance est rejetée. Lorsque Bob mesure dans la base $x$, il peut obtenir les deux résultats possibles avec une probabilité de $1/2$. S'il obtient $+1$, ce résultat est à nouveau compatible avec les deux états annoncés, donc cette instance est rejetée. Cependant, s'il obtient $-1$, Bob conclut que l'état envoyé n'était pas $\ket{+x}$, donc il doit être $\ket{+z}$, c'est-à-dire qu'Alice encode un $0$. Notez que le nombre de symboles conservés après cette réconciliation est, en moyenne, la moitié de celui où Alice et Bob utilisent des bases différentes. Donc, dans une situation idéale sans pertes et avec des états de photons uniques, ce protocole est moins performant que BB84.

```{figure} ./SARG.png
---
height: 400px
name: SARGfig
---
Codage SARG : Dans le protocole SARG, Alice prépare les mêmes états que dans BB84, mais le codage est différent. Ici, le bit envoyé est codé dans la base préparée.
```

L'avantage principal du protocole SARG se manifeste lorsqu'il est mis en œuvre avec des états cohérents atténués, grâce à sa robustesse contre les attaques PNS. Rappelons que l'ordre de grandeur principal de l'attaque est donné par les impulsions dans lesquelles Alice prépare deux photons avec une probabilité $p(2)$. Dans ce cas, Eve garde un photon et attend la réconciliation pour mesurer sa particule. Cependant, dans le protocole SARG, et contrairement à ce qui se passe dans BB84, Eve doit distinguer entre des états non orthogonaux, comme $\ket{+x}$ et $\ket{+z}$ dans l'exemple précédent. Elle ne peut donc pas les distinguer parfaitement et ne peut pas obtenir toutes les informations. 

C'est au-delà du cadre de ces notes, mais il peut être démontré que pour le protocole SARG, et en réalité pour tout protocole utilisant les quatre états de BB84, Eve peut appliquer un autre type d'attaque PNS qui lui permet d'obtenir toutes les informations en utilisant des impulsions avec trois photons. Cette attaque est efficace lorsque $p(3) \sim \eta_C \mu$, ce qui donne $\mu^2 \sim \eta_C$. Autrement dit, le taux pour SARG évolue comme $R_B \sim \eta_C^{3/2}$, un compromis entre le cas sans bruit et BB84.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


