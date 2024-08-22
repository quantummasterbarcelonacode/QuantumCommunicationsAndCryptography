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


# Preuves de sécurité

Les sections précédentes ont résumé certains des protocoles les plus connus de QKD (quantum key distribution) sécurisé et ont conclu avec leur structure générale. L'intuition pour tous ces protocoles est qu'une attaque par Eve introduit des erreurs détectables dans le canal. L'argument intuitif poursuit en disant qu'Alice et Bob peuvent surveiller la présence de ces erreurs et arrêter le protocole, mettant fin à la tentative d'espionnage. Il est clair que, bien que cette intuition suggère que le schéma peut être sécurisé, elle est ne fonctionne pas lorsqu'il s'agit de mises en œuvre pratiques. Dans tout scénario réaliste, il y aura des erreurs qui ne sont pas dues à Eve mais qui sont simplement une conséquence du bruit dans le canal et/ou des imperfections dans les laboratoires d'Alice et Bob. Par conséquent, nous ne pouvons pas accepter qu'Alice et Bob interrompent le protocole chaque fois qu'ils observent des erreurs.

Le but d'une preuve de sécurité est de gérer un scénario bruité et de rendre les protocoles de QKD applicables en pratique. L'idée principale est qu'Alice et Bob devraient conclure, d'après la quantité d'erreurs observées, s'ils peuvent établir une clé secrète. Ils sont capables de le faire parce qu'en théorie quantique, il est possible de fixer une limite sur la quantité d'information à laquelle Eve a accès en fonction de la quantité d'erreurs (ou de corrélations) entre Alice et Bob. Si Alice et Bob ont une petite quantité d'erreurs (grandes corrélations), Eve a peu d'informations. Une preuve de sécurité rend cet échange quantitatif.

Dans ce qui suit, nous esquissons les principales étapes d'une preuve de sécurité. Notre objectif n'est pas de fournir une dérivation détaillée de ces preuves, car elles sont généralement assez techniques et complexes, mais de souligner les principales idées et résultats utilisés dans leur dérivation.



