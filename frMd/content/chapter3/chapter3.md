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



# Cryptographie Quantique


Le théorème de non-clonage montre que la Théorie de l'Information Quantique offre de nouvelles possibilités mais aussi des limitations quant à la manière dont l'information sur les états quantiques peut être traitée. La démonstration de ce théorème est remarquablement simple, étant intimement liée à une limitation bien connue du formalisme quantique : la perturbation de l'état du système lors du processus de mesure. En effet, le clonage parfait violerait directement le principe selon lequel l'état d'un système quantique individuel ne peut être complètement connu. Si le clonage parfait était réalisable, il serait possible de déterminer entièrement l'état d'une particule sans la mesurer, simplement en produisant des clones et en les mesurant, tout en laissant l'état initial intact. D'autre part, si une estimation parfaite était possible, on pourrait facilement cloner en mesurant d'abord parfaitement l'état, puis en préparant autant de copies que désiré.

Cependant, ces limitations peuvent être transformées en quelque chose de positif, comme l’illustre brillamment la cryptographie quantique : puisque le processus de mesure perturbe l'état d'un système, toute tentative d’espionnage pour lire de l'information quantique se propageant à travers un canal a un effet détectable sur l'état envoyé. En d'autres termes, l'action de l'adversaire, également connu sous le nom d'espion, est limitée par l'impossibilité de produire une copie parfaite de l'état quantique. Ces deux idées sont à la base de tout protocole de cryptographie quantique. Dans ce qui suit, nous présentons plusieurs des principaux résultats sur la cryptographie quantique, en mettant l'accent particulièrement sur la distribution quantique de clés, qui représente l'application la plus avancée tant sur le plan théorique qu'expérimental. Il est toutefois important de noter que le terme "cryptographie quantique" désigne de manière générale tout protocole cryptographique exploitant le formalisme quantique.

