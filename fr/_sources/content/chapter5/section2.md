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

# Taux de clé pour les attaques collectives

L'importance d'étudier les attaques collectives provient d'un résultat de Renner {cite}`renner`, qui a prouvé qu'en augmentant le nombre de tours du protocole $N$, pour une grande famille de protocoles, y compris tous ceux décrits ici, la quantité de clé qui peut être distillée dans un protocole contre des attaques générales tend vers le taux de clé qui peut être distillé contre l'attaque collective optimale. En d'autres termes, la longueur de la clé secrète $K$ qui peut être distillée après $N$ tours satisfait $\lim_{N\rightarrow\infty} K/N=k_C$, où $k_C$ est le taux de clé contre les attaques collectives. Pour une réalisation pratique avec un nombre fini de tours, il y aura des corrections à cette limite et $k_C$ ne peut pas être atteint, car on a $K=k_CN-\mathcal{O}(N)$. Ces corrections sont pertinentes dans des situations pratiques, et une preuve de sécurité complète est capable de les calculer ou de les borner. Mais $k_C$ est le taux asymptotiquement atteignable.

En mettant tout cela ensemble, dans le cadre basé sur l'intrication, l'analyse de la sécurité d'un protocole contre les attaques collectives est la suivante :
<!--Luke: The extra spaces at the start of the line here are important to maintain the blocks-->

- Pour tous les tours du protocole, Eve prépare l'état pur tripartite $\ket{\Psi}{ABE}$, inconnu d'Alice et Bob, et distribue les particules $A$ et $B$ aux utilisateurs honnêtes, tandis qu'elle conserve $E$ dans une mémoire quantique. L'état réduit partagé entre Alice et Bob est $\rho{AB}=\tr_E\proj{\Psi}_{ABE}$.
- Alice (Bob) choisit de réaliser une série de mesures $M_{a|x}$ ($M_{b|y}$) sur leurs particules, où $x$ ($y$) désigne la mesure effectuée et $a$ ($b$) le résultat obtenu, avec des probabilités $p_A(x)$ ($p_B(y)$).
- À partir de leurs résultats de mesure, Alice et Bob peuvent estimer $p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})$. Ces probabilités caractérisent entièrement ou partiellement leur état partagé. Nous désignons par $\mathcal{S}_{AB}$ l'ensemble des états partagés entre Alice et Bob compatibles avec les distributions de probabilité observées $p(ab|xy)$.
- Pour chacun de ces états $\tilde\rho_{AB}\in\mathcal{S}{AB}$, Alice et Bob peuvent inclure le système d'Eve en utilisant la décomposition de Schmidt. En effet, considérons la décomposition spectrale de $\tilde\rho{AB}$, à savoir $\tilde\rho_{AB}=\sum_i\lambda_i\proj{\lambda_i}$. Si Alice et Bob souhaitent inclure Eve dans leur étude, ils doivent caractériser les états purs $\ket{\tilde\Psi}{ABE}$ compatibles avec leur état partagé $\tilde\rho{AB}$. Tout état de ce type peut être écrit comme ceci
    ```{math}
    :label: psiabe
        \ket{\tilde\Psi}_{ABE}=\sum_i
        \sqrt{\lambda_i}\ket{\lambda_i}_{AB}\ket{e_i} ,
    ``` 

    où ${\ket{e_i}}$ définit une base orthonormée dans l'espace d'Eve. 
Notez que l'espace dimensionnel d'Eve est égal au rang (nombre de valeurs propres non nulles) de $\tilde\rho_{AB}$. Étant donné $\ket{\tilde\Psi}{ABE}$, qui est complètement spécifié par la base ${\ket{e_i}}$, tout autre état $\ket{\Phi}{ABE}$ compatible avec $\rho_{AB}$ est tel que $\ket{\Phi}{ABE} = \one{AB} \otimes U_E \ket{\tilde\Psi}{ABE}$. C'est-à-dire que la seule différence entre ces deux états est une opération unitaire sur l'espace d'Eve, ce qui correspond à une base différente ${\ket{e'i}}$. Cela implique que chacun de ces états est tout aussi intéressant du point de vue d'Eve. Nous désignons par $\mathcal{S}{ABE}$ l'ensemble des états purs entre Alice, Bob et Eve compatibles avec les distributions de probabilité observées $p(ab|xy)$. Bien sûr, l'état $\ket{\Psi}{ABE}$ effectivement préparé par Eve est un élément de cet ensemble.

- Alice et Bob se concentrent sur les mesures utilisées pour construire la clé, par exemple les mesures $z$ par Alice et Bob dans le protocole BB84. Lorsqu'ils appliquent ces mesures à l'un des états $\ket{\tilde\Psi}_{ABE}$, ils obtiennent

    ```{math}
    :label: ccq
        \tilde\rho_{ABE}=\sum_{a,b}p(ab)\proj{a}_A \otimes\proj{b}_B\otimes\proj{\tilde e^{ab}}_E,
    ```

    où $p(ab) = \bra{ab}\tilde\rho_{AB}\ket{ab}$ est la probabilité conjointe d'obtenir les résultats $a$ et $b$, et $\ket{\tilde e^{ab}}$ est l'état projeté d'Eve après qu'Alice et Bob aient obtenu ces résultats. Jusqu'à normalisation, cet état est proportionnel à

    ```{math}
    :label: evestate
        \ket{\tilde e^{ab}}\propto\langle ab\ket{\tilde\Psi}_{ABE} .
    ```

    Plus précisément, l'état pur $\ket{\tilde e^{ab}}$ est donné par le côté droit de l'équation précédente après normalisation. L'état {eq}`ccq` est souvent dit contenir des corrélations classique-classique-quantique (ccq). En effet, notez que, bien que l'état soit donné sous une forme quantique, Alice et Bob partagent uniquement des résultats classiques dont les corrélations sont encapsulées par la distribution de probabilité $p(ab)$. Du côté d'Eve, cependant, elle possède un état quantique $\ket{\tilde e^{ab}}$ qui dépend de ou, de manière équivalente, est corrélé aux résultats de mesure classiques d'Alice et Bob.

- Devetak et Winter ont prouvé que le taux de clé $k_C$ distillé à partir d'un nombre asymptotiquement grand de copies identiques d'un état ccq {eq}`ccq` est borné inférieurement par la borne suivante, appelée borne de Devetak-Winter {cite}`dwrate`,

    ```{math}
    :label: dwbound
        k_C\geq K_{DW}(\tilde\rho_{ABE})=I(A:B)-\chi(A:E) .
    ```

    Clairement, la borne est une fonction de l'état ccq $\tilde\rho_{ABE}$. Rappelons que $I(A:B) = H(A) + H(B) - H(A,B)$ est l'information mutuelle de la distribution de probabilité $p(ab)$. L'expression $\chi(A:E)$ désigne la quantité de Holevo {cite}`Holevo` pour le codage du résultat de mesure $a$ d'Alice sur les états quantiques d'Eve. En effet, tout résultat de mesure d'Alice projette l'état d'Eve dans l'état

    ```{math}
    :label: 
        \tilde\rho_E^a=\tr_{AB}(\proj a\otimes\one_{BE}\proj{\tilde\Psi}_{ABE})/p(a),
    ```

    où $p(a)$ est la probabilité qu'Alice observe le résultat $a$, $p(a) = \sum_b p(ab) = \tr(\proj{a} \otimes \one_{BE} \proj{\Psi}{ABE}) = \tr(\proj{a} \otimes \one_B \rho{AB}) = \tr(\proj{a} \rho_A)$, où $\rho_A = \tr_B \rho_{AB}$. 
    La quantité de Holevo se lit alors

    ```{math}
    :label: 
        \chi(A:E)=S(\tilde\rho_E)-\sum_a p(a)S(\tilde\rho_E^a) ,
    ```

    où $\tilde\rho_E = \sum_a p(a) \tilde\rho_E^a = \tr_{AB} \proj{\tilde\Psi}_{ABE}$. Pour calculer une borne valide sur le taux de clé, Alice et Bob doivent minimiser la borne Devetak-Winter sur tous les états compatibles avec les statistiques observées

    ```{math}
    :label: dwbound
        k_C\geq \min_{\tilde\rho_{ABE}\in\mathcal S_{ABE}}K_{DW}(\tilde\rho_{ABE}) .
    ```

    En fait, Alice et Bob doivent supposer que l'état préparé par Eve est le pire possible, c'est-à-dire la solution au problème de minimisation précédent. Cette minimisation fournit le taux de clé asymptotique désiré.

`````{admonition} Exercice 4: Calculation de taux de clé
:class: tip

Dans le protocole à six états, Alice prépare les états propres de $\sigma_x$, $\sigma_y$ et $\sigma_z$, et les envoie à Bob, qui mesure ces observables. Après la réconciliation des bases, Alice et Bob ne conservent que les cas où ils utilisent la même base. Dans le cadre basé sur l'entrelacement, le protocole est essentiellement équivalent à la préparation de l'état maximallement intriqué à deux qubits {eq}`bellstate` sur lequel Alice et Bob mesurent les trois opérateurs de Pauli. Considérons maintenant qu'Alice et Bob sont connectés par un canal appelé canal de dépolarisation des qubits défini comme


```{math}
:label: depchannel
\mathcal D_p(X)=pX + (1-p)\frac{\one}{2}\tr(X) .
```

a) Calculez l'état entre Alice et Bob résultant de l'application de ce canal à la moitié de l'état maximallement intriqué,

```{math}
:label: 
\rho_{AB}=(\one_A\otimes\mathcal D_p)(\proj{\Phi}_{AB}).
```

b) Calculez les probabilités des résultats pour Alice et Bob lorsqu'ils mesurent tous deux dans la base $z$,

```{math}
:label: 
P(\pm,\pm)=\bra{\pm z}\bra{\pm z}\rho_{AB} \ket{\pm z}\ket{\pm z} .
```

c) Incluez Eve dans l'étude en fournissant une purification de l'état $\rho_{AB}$, c'est-à-dire un état pur $\ket{\psi}_{ABE}$ tel que $\tr_E \proj{\Psi}_{ABE} = \rho_{AB}$.

d) Calculez maintenant l'état entre Alice, Bob et Eve après que Alice et Bob mesurent dans la base $z$,

```{math}
:label: 
\rho_{ABE}=\sum_{a,b=\pm}P(a,b)\proj{a}\otimes\proj{b}\otimes\proj{e^{ab}}_E ,
```

où $\ket{e^{\pm\pm}}_E$ est donné par $\bra{\pm z}_A \otimes \bra{\pm z}_B \otimes \one_E \ket{\Psi}_{ABE}$ après normalisation.

e) Calculez les deux termes apparaissant dans la borne Devetak-Winter, $I(A:B)$ et $\chi(A:E)$, où

```{math}
:label: 
\chi(A:E)=S(\rho_E)-\sum_{a=\pm}p(a)S(\rho^a_E), 
```

$S(\rho) = -\tr(\rho \log \rho)$ est l'entropie de von Neumann, $\rho^a_E = \sum_{b=\pm} p(b|a) \proj{e^{ab}}_E$ et $\rho_E = \sum_a p(a) \rho^a_E = \tr_{AB} \proj{\Psi}_{ABE}$. Calculez la valeur de $p$ pour laquelle la borne Devetak-Winter devient nulle.

`````

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

