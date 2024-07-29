```{math}
\def\compl{{\mathbb{C}}}
```

# Le Bit Quantique


La première étape consiste à introduire l'unité de base de l'information quantique, le bit quantique ou qubit. Considérons l'encodage d'un bit classique dans une particule quantique. On peut le faire au moyen d'un système bidimensionnel : la valeur du bit 0 est codée dans un état $\ket{\psi_0}$, ou simplement $\ket{0}$, et 1 dans $\ket{1}$. Puisque ces deux options doivent définir un bit classique, les états doivent être orthogonaux et former une base dans $\compl^2$. Ainsi, une mesure dans cette base distingue de manière déterministe les deux possibilités, comme c'est le cas pour un bit classique. Par exemple,

```{math}
:label:
\ket 0=\begin{pmatrix}1\\0\\\end{pmatrix}\quad\quad
\ket 1=\begin{pmatrix}0\\1\\\end{pmatrix} .
```

Une particule quantique bidimensionnelle peut coder un bit classique et ainsi définir un bit quantique. Notez cependant que, grâce au principe de superposition, toute combinaison cohérente de $\ket{0}$ et $\ket{1}$ est également permise, ce qui est impossible en physique classique. Ainsi, un bit quantique peut être dans n'importe quel état,


```{math}
:label:
    \ket{\psi}=\alpha\ket 0+\beta\ket 1 ,
```

où $\alpha$ et $\beta$ sont des nombres complexes tels que $|\alpha|^2 + |\beta|^2 = 1$. Il est possible de représenter graphiquement l'état d'un qubit, ou d'une particule quantique bidimensionnelle, au moyen de la sphère de Poincaré ou de Bloch (voir {numref}`bloch`). En effet, en utilisant le fait que la phase globale de tout état pur est sans importance, $\alpha$ peut toujours être considéré comme réel. Ainsi, tout bit quantique peut être spécifié par un nombre complexe $\beta$, puisque $\alpha$ est fixé en raison de la normalisation. Autrement dit, tout état a la forme suivante


```{math}
:label: blochv
    \ket\psi=\begin{pmatrix}\cos\left(\frac{\theta}{2}\right)
    \\\sin\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    .
```

Deux angles, $\theta$ et $\varphi$, suffisent pour spécifier tout état pur dans $\compl^2$, comme n'importe quel point à la surface d'une sphère unité. Il est important de mentionner ici que, étant donné $\ket{\psi}$, le vecteur orthogonal, $\ket{\psi_\perp}$, s'exprime ainsi

```{math}
:label: blochvorth
    \ket{\psi_\perp}=\begin{pmatrix}\sin\left(\frac{\theta}{2}\right)
    \\-\cos\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    ,
```

ainsi les vecteurs orthogonaux dans $\compl^2$ définissent des vecteurs antiparallèles sur la sphère de Bloch. Les matrices dites « de Pauli » vont jouer un rôle significatif dans ce qui suit. Leur expression est la suivante

```{math}
:label: pauli
    \sigma_x=\begin{pmatrix}0&1\\1&0\\\end{pmatrix}\quad
    \sigma_y=\begin{pmatrix}0&-i\\i&0\\\end{pmatrix}\quad
    \sigma_z=\begin{pmatrix}1&0\\0&-1\\\end{pmatrix} .
```

Notez que dans notre définition du qubit, $\ket{0}$ et $\ket{1}$ sont les vecteurs propres de $\sigma_z$ avec les valeurs propres $\pm 1$, puisque $\sigma_z \ket{i} = (-1)^i \ket{i}$. C'est pourquoi $\sigma_z$ est souvent appelée « phase flip ». En mettant $\theta=0$ (et $\theta=\pi$) dans les équations Eq. [](blochv) et Eq. [](blochvorth), c'est-à-dire en définissant des vecteurs de Bloch qui pointent dans les directions $\pm z$, on obtient $\ket{0}$ et $\ket{1}$, les vecteurs propres de $\sigma_z$. L'effet de $\sigma_x$ dans notre base de qubit est $\sigma_x \ket{i} = \ket{1-i}$, c'est-à-dire qu'il effectue un « bit flip ». De manière similaire, en substituant $(\theta,\varphi) = (\pi/2,0)$, $(\pi,0)$, $(\pi/2,\pi/2)$ et $(\pi/2,-\pi/2)$ dans les équations Eq. [](blochv) et Eq. [](blochvorth), on obtient les deux vecteurs propres de $\sigma_x$ et $\sigma_y$, souvent notés $\ket{\pm x}$ et $\ket{\pm y}$.
```{figure} ./qubit.png
---
height: 400px
name: bloch
---
$\textbf{Sphère de Bloch:}$ Tout qubit pur peut être représenté par un point à la surface de la sphère de Bloch. Le vecteur unitaire correspondant, $\hat n=(\sin\theta\cos\varphi, \sin\theta\sin\varphi,  \cos\theta)$, est appelé vecteur de Bloch. Les états mixtes se trouvent à l'intérieur de la sphère.





