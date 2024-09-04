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

# Attaques de piratage

Toute la discussion précédente montre que des failles de sécurité apparaissent lorsque l'on passe des protocoles théoriques à leur mise en œuvre. L'existence des attaques PNS ne pouvait pas être écartée a priori, car il n'existait pas de preuve de sécurité pour une implémentation BB84 avec des états cohérents atténués et de grandes pertes. Les attaques ont effectivement prouvé qu'une telle preuve était impossible. Le principal mérite des protocoles à états leurres est qu'une preuve de sécurité complète pouvait être établie pour eux dans une mise en œuvre avec des pertes et des états cohérents atténués. Cette preuve semblait mettre fin à la discussion.

En 2010, cependant, plusieurs attaques de piratage réussies ont été signalées sur des implémentations commerciales de la QKD pour lesquelles, a priori, il y avait une preuve de sécurité. Vadim Makarov a été l'un des chercheurs les plus actifs dans ces efforts de piratage quantique {cite}`Makarov`. Dans l'implémentation de BB84 considérée, la dernière étape du côté de Bob était d'envoyer l'impulsion lumineuse reçue dans un séparateur de faisceaux polarisé et de détecter les modes de sortie, voir {numref}`hackingfig`. Les hackers ont modifié le fonctionnement des détecteurs du côté de Bob en injectant de la lumière dans ses dispositifs. Avec cette attaque, les détecteurs n'étaient plus sensibles aux photons uniques, mais donnaient un clic chaque fois que l'intensité lumineuse reçue dépassait un certain seuil, $I_{\text{th}}$. Une fois qu'Eve a modifié le fonctionnement des détecteurs, elle mesure les états produits par Alice dans une base aléatoire, disons $z$, lors d'un tour donné. Elle prépare alors un nouvel état égal à son résultat, disons $\ket{+z}$, encodé sur une impulsion lumineuse d'intensité $I_{\text{th}} < \mu_E < 2I_{\text{th}}$ et l'envoie à Bob par un canal sans perte (ou bien, elle encode son bit sur une impulsion avec une intensité égale à $\mu_E / \eta_C$, de sorte que ce qui arrive du côté de Bob a la bonne intensité égale à $\mu_E$). Maintenant, si Bob choisit la même mesure qu'Eve, l'impulsion sera envoyée de manière déterministe à l'un des deux détecteurs du côté de Bob, en maintenant son intensité au-dessus du seuil, et sera ensuite détectée avec le même résultat que la préparation d'Eve. Si, cependant, Bob choisit une base différente de celle d'Eve, l'état cohérent est divisé en deux impulsions d'intensités inférieures au seuil et aucune détection n'est produite. Bob annonce que le photon a été perdu pendant la propagation et ces tours sont rejetés. En tout, la moitié des tours sont rejetés, mais pour ceux qui sont conservés et passent ensuite la réconciliation des bases, les bases d'Alice, de Bob et d'Eve sont les mêmes. Par conséquent, l'attaque d'Eve lui fournit une information complète et elle n'interfère pas avec la mesure d'Alice ou la préparation de Bob. Bien sûr, cette attaque ne fonctionne que si les pertes sont supérieures à $1/2$, mais c'est toujours le cas après, environ, plus de 15 km de fibre optique. 

```{figure} ./Hacking.png
---
height: 400px
name: hackingfig
---
Attaque par piratage : Eve injecte de la lumière dans les dispositifs de Bob de sorte qu'ils ne soient pas sensibles aux photons entrants, mais qu'ils donnent un résultat lorsque l'intensité lumineuse entrante dépasse le seuil $I_{\text{th}}$. Dans l'attaque, Eve mesure l'état envoyé par Alice et prépare un nouvel état cohérent pour Bob égal à son résultat de mesure et avec une intensité $I_{\text{th}} < \mu_E < 2I_{\text{th}}$. Si les bases de Bob et Eve sont les mêmes, toute l'impulsion lumineuse est envoyée à un détecteur, donnant le résultat préparé. Si les bases ne sont pas les mêmes, l'impulsion lumineuse entrante est divisée en deux impulsions avec une intensité inférieure au seuil, et aucun détecteur ne réagit.
```

Ces attaques de piratage étaient très importantes car elles ont prouvé que certifier la sécurité d'une implémentation quantique est plus subtil que ce que l'on pensait initialement. Rappelons qu'en principe, il existait une preuve de sécurité mathématique pour le protocole piraté. Cette preuve était-elle erronée ? Ou les pirates ont-ils réussi à violer une loi quantique et ainsi briser le protocole ? La réponse à ces questions est négative ; ce qui s'est réellement passé est que l'implémentation ne répondait pas aux hypothèses nécessaires pour prouver la sécurité. Il y avait un décalage entre la modélisation théorique de l'expérience et sa mise en œuvre, que les pirates ont exploité. La preuve de sécurité était dérivée sous les hypothèses du modèle, mais si le modèle n'est pas parfaitement précis dans la description de l'expérience, la preuve de sécurité obtenue ne s'applique pas à l'implémentation, qui devient potentiellement vulnérable.

Pour mieux comprendre ce point, considérons à nouveau le protocole BB84. Dans sa formulation, Alice et Bob préparent les états propres de $\sx$ et $\sz$, et Bob mesure ces observables. Ce sont tous des opérateurs agissant sur l'espace des qubits, $\compl^2$. Lorsqu'on pense à une implémentation, il est fondamentalement impossible de garantir qu'un système physique vit strictement dans un espace de Hilbert de dimension deux. Par conséquent, si les hypothèses du protocole ne sont pas respectées, la preuve de sécurité ne s'applique pas. Par exemple, considérons la situation où Alice encode le qubit dans un état de photon unique avec une fréquence $\omega_0$. Cependant, supposons qu'il y ait une petite imperfection dans les dispositifs d'Alice et que chaque fois qu'elle encode dans la base $x$, elle déplace légèrement cette fréquence à $\omega'_0 = \omega_0 + \delta\omega$. Si Eve remarque cette imperfection, tout ce qu'elle doit faire pour pirater le protocole est (i) de mesurer la fréquence de l'état de photon unique sortant du laboratoire d'Alice et (ii) de mesurer dans la base $z$ ($x$) si la fréquence mesurée est $\omega_0$ ($\omega_0 + \delta\omega$). Elle obtient alors toutes les informations et son attaque passe inaperçue. Clairement, cette attaque peut être évitée si Alice calibre initialement son dispositif et corrige ce décalage, mais ce ne sera pas le cas si la sensibilité des dispositifs de calibration d'Alice est supérieure à $\delta\omega$, tandis que les dispositifs d'Eve peuvent discerner ce décalage de fréquence. Notez que les quatre états précédents donnent de très bonnes approximations des quatre états BB84, mais ils ne sont pas identiques. En fait, ils agissent sur un espace vectoriel de dimension quatre, donné par ${\ket{\pm z,\omega_0}, \ket{\pm x,\omega'_0}}$, violant ainsi l'hypothèse initiale utilisée dans la preuve de sécurité selon laquelle tous les états s'étendent dans un espace bidimensionnel. Pour renforcer la sécurité, Alice et Bob peuvent essayer de détecter et de corriger toutes les erreurs possibles de ce type et de garantir que l'écart entre le modèle et l'implémentation est minime. En fait, après l'annonce de l'attaque de piratage, les fournisseurs de QKD ont corrigé le détecteur de telle manière que l'attaque spécifique de Makarov{cite}`Makarov` ne soit plus possible. Cependant, comment pouvons-nous garantir qu'aucune attaque exploitant les imperfections des dispositifs n'est possible, surtout si l'on prend en compte que certaines hypothèses dans les protocoles QKD standard, telles que la dimension de l'espace de Hilbert, sont impossibles à tester ?

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



