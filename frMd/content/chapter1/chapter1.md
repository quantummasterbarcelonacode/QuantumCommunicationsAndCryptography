# Postulats de base de la Mécanique Quantique

L'objectif de cette première section est d'introduire les postulats de base de la mécanique quantique et sa structure mathématique. La plupart du formalisme présenté ici peut être trouvé dans le chapitre 2 de {cite}`nielsen2010quantum`. L'algèbre linéaire est l'étude des espaces vectoriels et des opérateurs linéaires agissant sur ces espaces. En fait, toute la mécanique quantique repose fondamentalement sur de l'algèbre linéaire appliquée à un espace de Hilbert complexe, représentée par la notation Dirac, moins standard. Dans cette notation :

$\ket{\psi}$ représente un vecteur colonne, également appelé ket.
$\bra{\psi}$ représente le vecteur dual de $\ket{\psi}$, également appelé bra.
$\braket{\phi|\psi}$ est le produit scalaire standard entre deux vecteurs $\ket{\phi}$ et $\ket{\psi}$.
La norme d'un vecteur $\ket{\psi}$ est définie comme $||\psi||$ = $\sqrt{\braket{\psi|\psi}}$. En général, la plupart des applications de l'information quantique (IQ) traitent des espaces complexes de dimension finie $d$, notés $\mathbb{C}^d$.


`````{admonition} Exemple
:class: note
Étant donné deux vecteurs dans un espace complexe bidimensionnel, noté $\mathbb{C}^2$,

```{math}
:label:
\ket{\psi} = \begin{pmatrix}1 \\ i\end{pmatrix} \qquad \ket{\phi} = \begin{pmatrix}−3i \\ −1\end{pmatrix},
```

on a

```{math}
:label:
\bra{\psi} = (1 \quad −i) \qquad \bra{\phi} = (3i \quad −1), \\\\
\braket{\phi|\psi} = (3i \quad −1) \begin{pmatrix} 1 \\ i \end{pmatrix} = 2i.
```
`````

## États  purs
Le premier postulat de la mécanique quantique stipule que tout système physique est associé à un espace de Hilbert complexe (un espace vectoriel avec un produit scalaire). L'état du système est décrit par un vecteur normalisé dans cet espace. Inversement, tout vecteur normalisé dans l'espace représente un état possible du système physique. Par conséquent, toutes les informations sur un système physique isolé peuvent être spécifiées au moyen d'un vecteur dans un espace de Hilbert. Il découle de ce postulat et de la définition d'un espace vectoriel que si $\ket{\psi_1}, \ket{\psi_2} \in \mathbb{C}^d$ sont deux états possibles d'un système, alors toute superposition linéaire de ces deux vecteurs, $\ket{\psi} = \alpha\ket{\psi_1} + \beta \ket{\psi_2}$, est un vecteur valide et représente donc aussi un état valide du système. Ici, α et β sont des nombres complexes tels que $||\psi|| = 1$. C'est ce qu'on appelle aussi le principe de superposition et $\ket{\psi}$ est souvent appelé une superposition cohérente de $\ket{\psi_1}$ et $\ket{\psi_2}$.

## Systèmes composites
Considérons maintenant deux systèmes physiques, $A$ et $B$, chacun décrit par son espace de Hilbert correspondant, $\mathcal{H}_A$ et $\mathcal{H}_B$. L'espace de Hilbert associé au système global $AB$, noté $\mathcal{H}$, est constitué du produit tensoriel des deux espaces locaux, $\mathcal{H} = \mathcal{H}_A \otimes \mathcal{H}_B$. Ceci est un autre postulat de la mécanique quantique.

## Intrication
Les conséquences de ces deux premiers postulats sont énormes. En effet, considérons deux états possibles du système global, $\mathcal{H}_A \otimes \mathcal{H}_B$ : $\ket{\psi_A}\otimes\ket{\psi_B}$ et $\ket{\phi_A}\otimes\ket{\phi_B}$, ou plus brièvement $\ket{\psi_A \psi_B}$ et $\ket{\phi_A \phi_B}$. Ensuite, $\ket{\Psi} = \alpha\ket{\psi_A \psi_B} + \beta\ket{\phi_A \phi_B}$ donne également un état possible du système composite $AB$. Cependant, cet état, en général, ne peut pas toujours être écrit comme le produit tensoriel de deux vecteurs dans chaque espace local, ce qui signifie $\ket{\Psi} \ne \ket{\varphi_A \varphi_B}$. Dans ce cas, on dit que $\ket{\Psi}$ est intriqué. L'intrication apparaît alors comme une conséquence du produit tensoriel et de la structure des espaces vectoriels de la mécanique quantique.

## Évolution unitaire
L'évolution d'un système physique isolé, dont l'état initial est donné par $\ket{\psi}$, est décrite par l'application d'une opération unitaire, $U$. Ainsi, l'état du système après évolution est $\ket{\phi} = U \ket{\psi}$. Rappelons que ceci est un autre postulat de la mécanique quantique. Une opération unitaire sur un espace de Hilbert de dimension $d$ est simplement une matrice complexe $d×d$ satisfaisant $U U^† = \mathbb{1}$.

## États mixtes
Considérons la description précédente de l'intrication : un état est intriqué lorsqu'il ne peut pas être écrit sous forme de produit. C'est-à-dire que, bien que l'état global du système puisse être décrit par un vecteur dans $\mathcal{H}_A \otimes \mathcal{H}_B$, il est impossible d'associer à chaque système local un vecteur dans $\mathcal{H}_A$ et $\mathcal{H}_B$. Cela est effectivement lié au fait que le système A est corrélé avec B, donc il n'est pas isolé. Existe-t-il un moyen mathématique de décrire les systèmes non isolés ?

Alternativement, considérons le cas où la préparation d'un système est imparfaite, c'est-à-dire que le système peut être dans l'état $|ψ_1〉$ avec une probabilité $p_1$, $|ψ_2〉$ avec une probabilité $p_2$ et ainsi de suite. Quelle est la description mathématique de l'état du système ?
 
Remarquez que dans les deux cas, il y a un manque de connaissance sur l'état du système. Cela est évident dans le second scénario, car la préparation est bruitée. Mais c'est aussi vrai dans le premier cas : en essayant de décrire l'état local d'un système non isolé, toutes les corrélations avec d'autres systèmes ou l'environnement sont ignorées. Étant donné que l'information sur l'état du système n'est pas complète, l'état ne peut pas être pur. Pour prendre en compte ce manque d'information, le concept d'états mixtes est introduit.

La description mathématique d'un système qui peut être dans l'état $|ψ_i〉∈ \mathcal{H}$ avec probabilité $p_i$, où $i = 1, ..., N$, et $N$ est arbitraire, n'est plus donnée par un vecteur dans cet espace de Hilbert, mais par un opérateur agissant sur celui-ci sous la forme
```{math}
:label:
ρ = \sum^N_{i=1} p_i |ψ_i〉〈ψ_i|. 
```

Notez que $\text{tr}(ρ) = ∑ p_i \text{tr}(|ψ_i〉〈ψ_i|) = \sum_i p_i 〈ψ_i|ψ_i〉 = \sum_i p_i = 1$. Si l’état est pur, $\ket{\psi}$, 
il n'y a qu'une seule probabilité non nulle, $p_1 = 1$, et $\rho = \ket{\psi}\bra{\psi}$. Plus généralement, un état $\rho$ est pur si et seulement si $\text{tr}(\rho^2) = 1$.

## Évolution bruitée
Après avoir introduit le formalisme des états mixtes, on peut spécifier comment un système quantique ouvert évolue, ou comment décrire une évolution bruitée. Dans ce cas, un système quantique dans un état pur peut perdre sa pureté et devenir mixte. Le formalisme général est donné par des applications complètement positives et conservant la trace. En effet, toute évolution d'un état initial (possiblement mixte) $\rho_i$ vers un état $\rho_f$ peut être représentée comme suit :
```{math}
:label:
ρ_f = \sum_k A_k ρ_i A^†_k,
```
où $A_k$ sont des opérateurs tels que $\sum_k A_k A_k^† = \mathbb{1}$. Notez que $\rho_f$ a une trace égale à 1, est hermitien et est semi-défini positif (n'a que des valeurs propres non négatives).

## Mesures
Le dernier processus à considérer est la mesure. Toute mesure à $m$ résultats sur un système dont l'espace de Hilbert associé a une dimension $d$ peut être représentée par ce qu'on appelle une Positive-Operator Valued Measure (POVM), définie par $r$ opérateurs positifs ${M_i \geq 0}$, où $i = 1, ..., r$, tels que $\sum_i M_i = \mathbb{1}$. 
Soit $\rho$ l'état à mesurer. Le résultat $i$ est obtenu avec une probabilité $p(i|\rho) = \text{tr}(\rho M_i)$. Cette valeur est positive car les $M_i$ sont positifs. Il en résulte également que $\sum_i p(i|\rho) = \sum_i \text{tr}(\rho M_i) = \text{tr}(\rho \sum_i M_i) = \text{tr}(\rho) = 1$.

## Évolution générale
En réunissant tous les processus précédents, une évolution générale, consistant en une séquence de mesures et éventuellement d'évolutions bruitées, peut toujours être spécifiée par un ensemble d'opérateurs $A^i_k$ décrivant une application transformant tout état $\rho$ en
```{math}
:label: eqnref5
ρ_i = \frac{\sum_k A^i_k ρ A^{i†}_k}{\text{tr}(\sum_k A^i_k ρ A^{i†}_k)} \quad \text{avec une probabilité} \quad p_i = \text{tr}(\sum_k A^i_k ρ A^{i†}_k).
```

Les mesures standard de von Neumann sont prises en compte par ce formalisme. Une mesure de von Neumann, ou mesure projective de rang un, dans un système de dimension $d$ a $d$ résultats possibles et les opérateurs correspondants sont les projecteurs sur une base dans cet espace. Plus précisément : considérons une base dans $\mathbb{C}^d$, définie par $d$ vecteurs orthonormaux $|i〉$ tels que $〈i|j〉 = \delta_{ij}$. Une mesure dans cette base est représentée par les projecteurs $A_i = |i〉〈i|$. Notez que si l'état initial est $ρ$, la probabilité d'obtenir le résultat $i$, voir Eq.[](eqnref5), est
```{math}
:label:
p_i = \text{tr}(|i〉〈i|ρ|i〉〈i|) = 〈i|ρ|i〉,
```

tandis que l’état est transformé en
```{math}
:label:
ρ_i = \frac{|i〉〈i|ρ|i〉〈i|}{\text{tr}(|i〉〈i|ρ|i〉〈i|)} = |i〉〈i|.
```

Dans le cas de l'état pur, ρ = $\ket{\psi}\bra{\psi}$, ces expressions se lisent

```{math}
:label:
p_i = \text{tr}(|i〉〈i|\ket{\psi}〈ψ||i〉〈i|) = |〈i\ket{\psi}|^2,
```

et

```{math}
:label:
|ψ_i〉 = |i〉,
```
c’est-à-dire, l'état initial $\ket{\psi}$ s'effondre en $|i〉$ avec une probabilité donnée par le module au carré du produit scalaire, $|〈i\ket{\psi}|^2$. Les formules précédentes impliquent également qu'il n'y a pas de mesure (processus physique) distinguant $\ket{\psi}$ de $e^{iγ} \ket{\psi}$. Ainsi, l'état d'un système physique est décrit par un vecteur (normalisé) dans un espace de Hilbert, à une phase globale non pertinente près.

## Bibliography de la section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


