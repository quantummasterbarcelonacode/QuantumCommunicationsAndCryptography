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



# One-Time Pad et Distribution Quantique de Clés

Avant de plonger dans le monde quantique, passons en revue un résultat fondamental de Vernam montrant comment échanger des informations privées de manière complètement sécurisée en utilisant une clé secrète pré-partagée.

Dans tout scénario cryptographique, deux parties honnêtes, Alice et Bob, souhaitent échanger des informations de manière privée. Il y a aussi une troisième partie malveillante, l'espion, appelé Eve, qui souhaite lire ces informations. Supposons dans ce qui suit qu'Alice et Bob partagent une clé secrète, c'est-à-dire une liste de bits parfaitement corrélés sur laquelle Eve n'a aucune information. La clé secrète, de longueur $N$, est notée $\vec k$, qui est une chaîne de
$N$ bits $k_i$, avec $i=1,\ldots,N$. Pour envoyer un message de longueur $M\leq N$ à Bob, noté $\vec m$, Alice peut effectuer une somme
 modulo 2 de ses bits de message avec $M$ bits de la clé secrète. Elle envoie ensuite la chaîne résultante de 
$M$-bits à Bob à travers un canal de communication publique. Plus précisément,  Plus précisément, avec cette opération, Alice calcule le XOR booléen (Le XOR booléen, noté $\oplus$, est l’opération telle que $0\oplus 0=1\oplus 1=0$ et $0\oplus 1=1\oplus
0=1$) de chaque bit de son message, $m_i$, et de chaque bit de son message $k_i$, et envoie les bits résultants, $r_i=m_i\oplus k_i$, par le canal. Il est possible de montrer qu’Eve, qui a seulement accès au message $\vec r$ envoyé à travers le canal non-sécurisé, n'a aucune information sur le vrai message $\vec m$. Cependant, du côté de Bob, il est très facile de décoder le message grâce au fait qu'il connaît la clé. Il lui suffit d'ajouter le message reçu à sa clé, pour obtenir $r_i\oplus k_i=m_i\oplus k_i\oplus k_i=m_i$.
Ce schéma, connu sous le nom de protocole one-time pad (ou chiffre de Vernam), est sécurisé à condition que (i) le nombre de bits de clé utilisés pour le chiffrage soit égal au nombre de bits dans le message et (ii) les bits de la clé secrète ne soient jamais réutilisés.

Le principal inconvénient de l'utilisation du one-time pad est qu'il nécessite une clé secrète partagée au départ. En un sens, le problème de distribution du message est maintenant déplacé vers le problème presque analogue de distribution de la clé. Mais c'est précisément là que la Mécanique Quantique peut aider : la distribution d'une clé secrète peut être réalisée de manière sécurisée avec preuve en utilisant des états et des opérations quantiques. Plus tard, cette clé pourra être utilisée avec le one-time pad pour échanger le message final de manière complètement sécurisée. Les protocoles quantiques permettant à Alice et Bob de distribuer une clé de manière sécurisée sont appelés Protocoles de Distribution de Clé Quantique (Quantum Key Distribution, QKD), pour des raisons évidentes.


