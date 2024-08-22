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



# BB84 avec découpage en créneaux temporels et états cohérents atténués

Le découpage en créneaux temporels représente l'une des solutions les plus populaires pour envoyer de l'information quantique sur de longues distances. En principe, l'idée est de préparer des états de photons uniques et de les envoyer dans deux chemins grace à un séparateur de faisceau avec une transmission donnée $T$. Les deux chemins ont des longueurs différentes et sont recombinés. Un décalage de phase $\varphi$ est appliqué à l'un des deux chemins, disons le plus long, voir {numref}`timebin`. En jouant avec la transmission du séparateur et la phase, il est en principe possible de préparer n'importe quel état de qubit, puisque l'on a $\ket\psi=\sqrt T\ket s+\sqrt Re^{i\varphi}\ket{\ell}$. En pratique, changer la transmission du premier séparateur est plus exigeant que de changer la phase appliquée, donc on utilise souvent une transmission fixe donnée par $T=1/2$. De plus, recombiner les deux chemins de manière déterministe est également difficile, donc on utilise souvent un autre séparateur avec une transmission $1/2$. Ce processus plus simple prépare donc tout état $\ket\psi=(\ket s+e^{i\varphi}\ket{\ell})/\sqrt 2$, c'est-à-dire tout état dans l'équateur de la sphère de Bloch défini par $\ket s$ et $\ket{\ell}$, avec une certaine probabilité. Cependant, cela est suffisant pour mettre en œuvre le protocole BB84 à travers le schéma montré dans {numref}`timebin`.

<!--Luke: Maybe we should mention that R is just the coefficient normalizing the state based on T?-->

```{figure} ./TimeBin.png
---
height: 400px
name: timebin
---
Qubits à créneaux temporels : L'information quantique est codée dans un état de photon unique qui peut être dans différents modes temporels. Partie supérieure : dans la situation idéale, le coefficient de transmission du premier séparateur peut être librement choisi. Le deuxième séparateur réfléchit d'abord le photon lorsqu'il prend le chemin court, puis le transmet lorsque le photon prend le chemin long, ce qui permet de préparer de manière déterministe un état de qubit arbitraire. En pratique, il est beaucoup plus simple d'utiliser des séparateurs avec une transmission fixe $T=1/2$. Bien que les photons puissent emprunter le mauvais chemin au deuxième séparateur, cela n'affecte pas les performances du protocole car seuls les cas dans lesquels Bob détecte un photon seront conservés, éliminant ainsi efficacement toutes les situations où le photon a été perdu au niveau du deuxième séparateur. Partie inférieure : mise en œuvre du protocole BB84 avec des créneaux temporels.
```


Pour cela, Alice prépare les quatre états possibles de BB84, $\ket{\pm x}$ et $\ket{\pm y}$, en utilisant l'arrangement précédent et en choisissant une phase $\varphi_A=0,\pi$ pour $\ket{\pm x}$ et $\varphi_A=\pm\pi/2$ pour $\ket{\pm y}$. Ces états sont envoyés à Bob, qui applique le même arrangement interférométrique et détecte quel chemin le photon a emprunté à la fin du processus. Comme il sera expliqué plus loin, $\varphi_B=0$ ($\varphi=\pi/2$) correspond à une mesure dans la base $x$ ($y$). Il est également important de garder à l'esprit que seuls les événements où Bob détecte un photon sont conservés, tous les autres sont rejetés. Si l'on note $T$ le temps nécessaire pour que le photon passe d'Alice à Bob, et par $\Delta T$ le décalage temporel entre les deux bras de l'interféromètre de chaque côté, il y a trois valeurs possibles pour le temps $T_B$ auquel une détection de photon du côté de Bob se produit :

- $T_B=T$ : le photon a pris le chemin court dans les deux interféromètres. Il peut être détecté dans l'un des deux détecteurs avec une probabilité de $1/2$. Ces événements sont rejetés.
- $T_B=T+2\Delta T$ : le photon a pris le chemin long dans les deux interféromètres. Il peut être détecté dans l'un des deux détecteurs avec une probabilité de $1/2$. Ces événements sont rejetés.
- $T_B=T+\Delta T$ : il y a interférence entre les deux possibilités où le photon a d'abord pris le chemin court puis le long, et inversement. Crucialement, cette interférence, et donc la probabilité d'observer le photon dans un détecteur ou l'autre, dépend de la différence de phase appliquée par Alice et Bob. C'est le cas intéressant qui est utilisé pour générer la clé.

Notez que pour définir ces temps d'arrivée, Alice et Bob doivent partager une référence temporelle, c'est-à-dire que Bob doit savoir quand s'attendre à l'arrivée des photons préparés par Alice.

Dans l'implémentation, Bob ne garde que les événements où l'un des deux détecteurs clique à $T_B=T+\Delta T$, tandis que tous les autres événements sont rejetés. Calculons la probabilité d'observer un clic dans l'un des détecteurs à ce moment-là. Il n'y a que deux événements possibles qui peuvent contribuer : (i) le photon d'Alice prend le bras court, est envoyé à Bob, puis prend le bras long ou (ii) le photon d'Alice prend le bras long, est envoyé à Bob, puis prend le bras court. La physique quantique nous dit que pour calculer la probabilité correspondante, nous devons sommer les amplitudes de probabilité de ces deux événements. Pour ce faire, nous travaillons en seconde quantification et introduisons les opérateurs de création et d'annihilation pour chaque mode, que nous notons par $a$, au lieu de la notation plus standard $a^\dagger$, pour simplifier la notation. Notez que nous travaillerons avec des états non normalisés. Un état à un photon $\ket{1}$ est alors écrit comme $\ket{1}=a\ket{0}$, où $\ket{0}$ est maintenant l'état fondamental du champ électromagnétique (aucun de ces états ne doit être confondu avec les éléments de la base computationnelle).

L'état quittant le laboratoire d'Alice est $(a_s+e^{i\varphi_A}a_\ell)\ket{0}$, c'est-à-dire la superposition d'un photon ayant pris le chemin court et le chemin long, avec la phase correspondante. Pour simplifier encore la notation, nous omettons l'état fondamental. L'état arrivant au dernier coupleur de Bob au temps $T+\Delta T$ est $a_{s\ell}e^{i\varphi_B}+a_{\ell s}e^{i\varphi_A}$, où $a_{\ell s}$ ($a_{s\ell}$) est l'opérateur de création pour le photon qui a d'abord pris le chemin long (court) puis court (long). Le coupleur est simplement un séparateur de faisceau équilibré standard, avec un coefficient de transmission $T=1/2$. Il est bien connu qu'un séparateur de faisceau équilibré transforme les modes d'entrée $a_1$ et $a_2$ en modes de sortie $b_1$ et $b_2$ comme suit :

```{math}
:label: beamsplitter
    \begin{pmatrix}b_1 \\b_2 \\\end{pmatrix} =     \begin{pmatrix}\frac{1}{\sqrt 2} & \frac{1}{\sqrt 2} \\\frac{1}{\sqrt 2} & -\frac{1}{\sqrt 2} \\\end{pmatrix} \begin{pmatrix}a_1 \\ a_2 \\\end{pmatrix} .
```

En considérant le montage décrit, nous devons appliquer cette transformation aux modes d'entrée du dernier séparateur de faisceau, $a_{\ell s}$ et $a_{s\ell}$, tandis que les modes de sortie correspondent aux photons allant vers les deux détecteurs, que nous notons $d_1$ et $d_2$. On a donc :

```{math}
:label: 
(d_1+d_2)e^{i\varphi_B}+(d_1-d_2)e^{i\varphi_A}. 
```

Cela implique que les probabilités d'observer le photon dans les détecteurs sont, après avoir réintroduit la normalisation,

```{math}
:label: 
\text{Pr}(d_1 \text{ clicks})&=&\frac{|e^{i\varphi_A}+e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}+e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1+\cos(\varphi_A-\varphi_B)}{2} \nonumber\\
\text{Pr}(d_2 \text{ clicks})&=&\frac{|e^{i\varphi_A}-e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}-e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1-\cos(\varphi_A-\varphi_B)}{2} .
```

Quand les bases d'Alice et Bob sont concordantes et égales à $z$, correspondant à $\varphi_A=0,\pi$ et $\varphi_B=0$, alors le premier détecteur clique de manière déterministe lorsque Alice prépare $\ket{+z}$, correspondant à $\varphi_A=0$, tandis que le deuxième clique pour $\ket{-z}$, correspondant à $\varphi_A=\pi$. Il est facile de voir que le même résultat est observé pour $\varphi_A=\pm\pi/2$ et $\varphi_B=\pi/2$. Lorsque les bases ne sont pas concordantes, par exemple $\varphi_A=0$ et $\varphi_B=\pi/2$, les deux détecteurs cliquent avec la même probabilité, $\text{Pr}(d_1 \text{ clique})=\text{Pr}(d_2 \text{ clique})=1/2$. On obtient donc les mêmes corrélations entre les préparations d'Alice et les mesures de Bob que dans le protocole BB84, comme prévu.

La mise en œuvre de ce schéma est toutefois assez exigeante car elle nécessite la préparation d'états à photon unique. Malgré les progrès considérables dans les sources de photons uniques, il s'agit toujours d'un dispositif coûteux et complexe. Pour surmonter ce problème, Alice remplace les états à photon unique par des états cohérents atténués. Rappelons qu'un état cohérent est donné par la superposition suivante d'états $\ket n$ à $n$ photons :

```{math}
:label: coherentstate
\ket\alpha=e^{-|\alpha|^2/2}\sum_n \frac{\alpha^n}{\sqrt{n!}}\ket n=\sum_n p(n)\ket n,
```

où $\alpha$ est un nombre complexe arbitraire, $\alpha=\alpha_x+i\alpha_p=|\alpha|e^{i\phi}$. La phase de l'état cohérent est $\phi$, tandis que son intensité, que nous notons $\mu$, est égale à $\mu=|\alpha|^2$. En effet, il est important de noter que le nombre moyen de photons dans l'impulsion est

```{math}
:label:
\langle n\rangle=e^{-|\alpha|^2}\sum_n \frac{\alpha^{2n}}{n!} n = \mu.
```

Les états cohérents sont très faciles à préparer, car ils décrivent l'état d'un laser conventionnel. Ainsi, Alice peut approximer l'état à 1 photon requis par un état cohérent atténué, où $\mu<1$. En omettant la normalisation, un état cohérent atténué est approximativement égal à $\ket 0 + \alpha\ket 1$, c'est-à-dire une superposition d'un état de vide quantique (avec 0 photon) et d'un état avec un photon unique. L'idée est que, comme Bob ne garde que les cas où il détecte de la lumière, cela projette effectivement l'état cohérent dans l'état à photon unique, puisque l'état de vide ne peut pas donner de clic du côté de Bob. En d'autres termes, l'état cohérent se comporte comme un état à photon unique pour les événements où Bob détecte de la lumière. Nous avons donc tous les ingrédients pour une mise en œuvre faisable de BB84 et, en fait, la plupart des dispositifs commerciaux utilisant ce protocole reposent sur des interféromètres à fibre, des états cohérents atténués et des détecteurs de lumière.

Le taux auquel ces protocoles fonctionnent peut être estimé comme suit. Les états cohérents sont préparés avec une fréquence de répétition que nous notons $f$. Ils se propagent à travers le canal avec une transmission $\eta_C$, voir l'équation {eq}`channellosses`. Le taux de photons détectés évolue donc comme $R_B=f\eta_C\mu$. À part les termes $f$ et $\mu$, fixés lors de la préparation, le taux est proportionnel à $\eta_C$, c'est-à-dire qu'il décroit exponentiellement avec la distance. Ce n'est pas le taux de clé final, qui dépendra du processus de distillation de la clé (réconciliation de base, correction d'erreurs, amplification de la confidentialité, etc.), mais cela donne un ordre de grandeur du taux du protocole.




