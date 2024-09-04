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




# Communication classique

Le problème de l'envoi d'informations de manière fiable à travers un canal bruité a une longue histoire dans la théorie de l'information classique. Ici, un canal classique est décrit par une application stochastique $P(Y|X)$, décrivant comment une variable aléatoire d'entrée $X$ est transformée en une variable de sortie $Y$. La méthode standard pour corriger les erreurs de canal est appelé *code de correction d'erreurs*.

Par exemple, considérons le simple canal binaire symétrique $P_\epsilon$ qui inverse un bit avec une probabilité $\epsilon$, c'est-à-dire, $P_\epsilon(Y=0|X=0)=P_\epsilon(Y=1|X=1)=1-\epsilon$ et $P_\epsilon(Y=0|X=1)=P_\epsilon(Y=1|X=0)=\epsilon$, ce qui définit la probabilité d'erreur. Sans perte de généralité, la probabilité d'erreur satisfait $\epsilon<1/2$. Un code de correction d'erreurs très simple exploite la répétition : pour transmettre un bit $X$ à Bob, Alice envoie sa valeur trois fois à travers le canal, $X_1=X_2=X_3=X$. Pour définir la valeur de son bit, Bob utilise la majorité des symboles reçus, $Y=\text{maj}(Y_1,Y_2,Y_3)$. La nouvelle probabilité d'erreur est donc $\epsilon'=3(1-\epsilon)\epsilon^2+\epsilon^3$, qui est toujours plus petite que $\epsilon$ lorsque $\epsilon<1/2$.

Cet exemple illustre les idées principales de la correction d'erreurs. En général, Alice code des chaînes de $m$ bits $\vec X=(X_1,\ldots,X_m)$, appelées bits logiques, en $2^m$ séquences de $n$ bits physiques $\vec X'=(X'_1,\ldots,X'_n)$, appelées mots de code, à travers une application de codage de bits $m \rightarrow n$ notée $\mathcal E$. Dans l'exemple précédent, Alice codait des bits $m=1$ en deux mots de code de $n=3$ bits, à savoir $000$ et $111$. À la réception, le message reçu est celui résultant de l'application du canal donné $P(Y|X)$ à chacun des symboles dans $\vec X'$. Bob décode l'information en mappant la chaîne de bits de $n$ bits reçus $\vec Y'=(Y'_1,\ldots,Y'_n)$ en une chaîne de $m$ bits $\vec Y=(Y_1,\ldots,Y_m)$ à travers une application de décodage $n \rightarrow m$ $\mathcal D$. La probabilité d'erreur pour le protocole complet est $P(\vec Y\neq\vec X)=\epsilon$ (notez que $\epsilon$ désigne maintenant la probabilité d'erreur après correction d'erreurs). L'objectif de la correction d'erreurs est, pour une erreur tolérable donnée $\epsilon$ et $n$ utilisations du canal, de maximiser la quantité de bits envoyés $m$ parmi toutes les applications possibles de codage et de décodage. Nous notons cet optimum par $m^*(n,\epsilon)$. Pour comprendre la limite ultime pour une transmission fiable, on doit considérer le taux asymptotique lorsque les utilisateurs ont accès à un nombre illimité d'utilisations du canal et que le protocole atteint une probabilité d'erreur qui tend vers zéro. Cela définit la capacité (classique) du canal,

```{math}
:label: capacity
C=\lim_{\epsilon\rightarrow 0} \lim_{n\rightarrow \infty}\frac{m^*(n,\epsilon)}{n} .
```

Remarquablement, la valeur de cette limite est connue. En effet, Shannon a prouvé que la capacité du canal $C$ est donnée par

```{math}
:label: shannoncapacity
C=\max_{P(X)} I(X:Y) ,
```

où $I(X:Y)$ est l'information mutuelle de la distribution conjointe $P(X,Y)=P(X)P(Y|X)$, où le premier terme $P(X)$ est celui à optimiser, tandis que le second, $P(Y|X)$, est donné par le canal. Ce résultat est impressionnant, car il montre comment une limite difficile impliquant $n$ utilisations du canal peut être calculée en résolvant un problème d'optimisation impliquant une seule utilisation. Ce type de formule, connu sous le nom de formule à une lettre, donne la performance asymptotique d'un objet (dans ce cas, un canal) pour une tâche donnée (dans ce cas, la communication fiable) uniquement en termes d'une seule copie de l'objet. Cela ne signifie pas que la capacité du canal peut être atteinte par une seule utilisation du canal, mais que pour son calcul, nous n'avons besoin de considérer qu'une seule copie de celui-ci. Dans une situation pratique, où l'on a accès à un nombre fini $n$ d'utilisations du canal, il convient de concevoir un code de correction d'erreurs impliquant des mots de code de longueur finie $n$ qui se rapproche le plus possible du taux $C$. Une autre conséquence du résultat précédent est que tout canal dans lequel l'information envoyée par Alice n'est pas totalement effacée, c'est-à-dire tout canal où $Y$ n'est pas indépendant de $X$, $P(Y|X)\neq P(Y)$, peut être utilisé pour la communication. Cela découle du fait que $I(X:Y)=0$ si, et seulement si, $P(X,Y)=P(X)P(Y)$.


