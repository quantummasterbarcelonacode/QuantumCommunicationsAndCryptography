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
\def\compl{{\mathbb{C}}}
```

# El Bit Cuántico

El primer paso es introducir la unidad básica de la IC, el bit cuántico o cúbit. Consideremos la codificación de un bit clásico en una partícula cuántica. Esto se puede lograr mediante un sistema bidimensional: el valor del bit 0 se codifica en un estado $\ket{\psi_0}$, o simplemente $\ket{0}$, y el 1 en $\ket{1}$. Dado que estas dos opciones deben definir un bit clásico, los estados tienen que ser ortogonales y formar una base en $\compl^2$. De este modo, una medición en esta base distingue de manera determinista entre las dos posibilidades, tal como ocurre con un bit clásico. Por ejemplo,

```{math}
:label:
\ket 0=\begin{pmatrix}1\\0\\\end{pmatrix}\quad\quad
\ket 1=\begin{pmatrix}0\\1\\\end{pmatrix} .
```

Una partícula cuántica bidimensional puede codificar un bit clásico y, por lo tanto, define un bit cuántico. Sin embargo, es importante notar que, debido al principio de superposición, cualquier combinación coherente de $\ket 0$ y $\ket 1$ también está permitida, algo que es imposible en el ámbito clásico. Por lo tanto, un bit cuántico puede estar en cualquier estado, 

```{math}
:label:
    \ket{\psi}=\alpha\ket 0+\beta\ket 1 ,
```

donde $\alpha$ y $\beta$ son números complejos tales que $|\alpha|^2+|\beta|^2=1$. Es posible representar de manera pictórica el estado de un cúbit, o una partícula cuántica bidimensional, mediante la esfera de Poincaré o de Bloch (ver {numref}bloch). En realidad, utilizando el hecho de que la fase global de cualquier estado puro es irrelevante, $\alpha$ siempre puede tomarse como real. Entonces, cualquier bit cuántico puede especificarse por un número complejo $\beta$, ya que $\alpha$ queda fijado debido a la normalización. Es decir, cualquier estado tiene la forma

```{math}
:label: blochv
    \ket\psi=\begin{pmatrix}\cos\left(\frac{\theta}{2}\right)
    \\\sin\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    .
```

Dos ángulos, $\theta$ y $\varphi$, son suficientes para especificar cualquier estado puro en $\compl^2$, como cualquier punto en la superficie de una esfera unitaria. Es importante mencionar aquí que, dado $\ket{\psi}$, el vector ortogonal, $\ket{\psi_\perp}$, se expresa como

```{math}
:label: blochvorth
    \ket{\psi_\perp}=\begin{pmatrix}\sin\left(\frac{\theta}{2}\right)
    \\-\cos\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    ,
```

por lo tanto, los vectores ortogonales en $\compl^2$ definen vectores antiparalelos en la esfera de Bloch. Las matrices de Pauli van a desempeñar un papel importante en lo que sigue. Su expresión es la siguiente:

```{math}
:label: pauli
    \sigma_x=\begin{pmatrix}0&1\\1&0\\\end{pmatrix}\quad
    \sigma_y=\begin{pmatrix}0&-i\\i&0\\\end{pmatrix}\quad
    \sigma_z=\begin{pmatrix}1&0\\0&-1\\\end{pmatrix} .
```

Observa que en nuestra definición del cúbit, $\ket 0$ y $\ket 1$ son los vectores propios de $\sigma_z$ con valores propios $\pm 1$, ya que $\sigma_z\ket i=(-1)^i\ket i$. Es por esto que $\sigma_z$ se denomina frecuentemente un cambio de fase. Ten en cuenta que al poner $\theta=0$ (y $\theta=\pi$) en la Ec. [](blochv) and Ec. [](blochvorth), es decir, definiendo vectores de Bloch que apuntan en la dirección $\pm z$, se obtienen $\ket 0$ y $\ket 1$, los vectores propios de $\sigma_z$. El efecto de $\sigma_x$ en nuestra base de cúbits es $\sigma_x\ket i=\ket{1-i}$, es decir, produce un cambio de bit. De manera similar a lo anterior, al sustituir $(\theta,\varphi)=(\pi/2,0)$, $(\pi,0)$, $(\pi/2,\pi/2)$ y $(\pi/2,-\pi/2)$ en la Ec. [](blochv) y Ec. [](blochvorth) se obtienen los dos vectores propios de $\sigma_x$ y $\sigma_y$, a menudo denotados como $\ket{\pm x}$ y $\ket{\pm y}$.

```{figure} ./qubit.png
---
height: 400px
name: bloch
---
$\textbf{Esfera de Bloch:}$ Cualquier bit cuántico puro puede representarse por un punto en la superficie de la esfera de Bloch. El vector unitario correspondiente, $\hat n=(\sin\theta\cos\varphi,\sin\theta\sin\varphi, \cos\theta)$, se conoce como vector de Bloch. Los estados mixtos están dentro de la esfera.
```