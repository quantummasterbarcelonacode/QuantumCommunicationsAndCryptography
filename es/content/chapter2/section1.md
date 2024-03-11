```{math}
\def\compl{{\mathbb{C}}}
```

# The Quantum Bit

The first step is to introduce the basic unit of QI, the quantum bit or qubit. Consider the encoding of a classical bit into a quantum particle. The way of doing this is by means of a two-dimensional system: bit value 0 is encoded into a state $\ket{\psi_0}$, or simply $\ket{0}$, and 1 into $\ket{1}$. Since these two options have to define a classical bit, the states have to be orthogonal and give a basis in $\compl^2$. Thus, a measurement in this basis distinguishes in a deterministic way between the two possibilities, as it happens for a classical bit. For instance,

```{math}
:label:
\ket 0=\begin{pmatrix}1\\0\\\end{pmatrix}\quad\quad
\ket 1=\begin{pmatrix}0\\1\\\end{pmatrix} .
```

A two-dimensional quantum particle can encode a classical bit and then defines a quantum bit. Note however that, because of the superposition principle, any coherent combination of $\ket 0$ and
$\ket 1$ is also allowed, something that is classically impossible. Therefore a quantum bit can be in any state,

```{math}
:label:
    \ket{\psi}=\alpha\ket 0+\beta\ket 1 ,
```

where $\alpha$ and $\beta$ are complex numbers such that $|\alpha|^2+|\beta|^2=1$. It is possible to pictorially represent the state of a qubit, or two-dimensional quantum particle, by means of the Poincaré or Bloch sphere (see {numref}`bloch`). Indeed, using the fact that the global phase of any pure state is irrelevant, $\alpha$ can always be taken real. Then, any quantum bit can be specified by a complex number $\beta$, since $\alpha$ is fixed because of normalization. That is, any state has the form

```{math}
:label: blochv
    \ket\psi=\begin{pmatrix}\cos\left(\frac{\theta}{2}\right)
    \\\sin\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    .
```

Two angles $\theta$ and $\varphi$ suffice to specify any pure state in $\compl^2$, as any point on the surface of a unit sphere. It is important to mention here that given $\ket{\psi}$, the orthogonal vector, $\ket{\psi_\perp}$, reads

```{math}
:label: blochvorth
    \ket{\psi_\perp}=\begin{pmatrix}\sin\left(\frac{\theta}{2}\right)
    \\-\cos\left(\frac{\theta}{2}\right)e^{i\varphi}\\\end{pmatrix}
    ,
```

so orthogonal vectors in $\compl^2$ define antiparallel vectors on
the Bloch sphere. Pauli matrices are going to play a significant role
in all what follows. Their expression is

```{math}
:label: pauli
    \sigma_x=\begin{pmatrix}0&1\\1&0\\\end{pmatrix}\quad
    \sigma_y=\begin{pmatrix}0&-i\\i&0\\\end{pmatrix}\quad
    \sigma_z=\begin{pmatrix}1&0\\0&-1\\\end{pmatrix} .
```

Note that in our definition of the qubit, $\ket 0$ and $\ket 1$ are the eigenvectors of $\sigma_z$ with eigenvalues $\pm 1$, since$\sigma_z\ket i=(-1)^i\ket i$. This is why $\sigma_z$ is oftencalled a phase flip. Note that putting $\theta=0$ (and $\varphi=\pi$) in Eq. [](blochv) and Eq. [](blochvorth), that is, Blochvectors pointing in the $\pm z$ direction, one obtains $\ket 0$and $\ket 1$, the eigenvectors of $\sigma_z$. The effect of $\sigma_x$ in our qubit basis is $\sigma_x\ket i=\ket{1-i}$, i.e. it gives a bit flip. In a similar way as above, substituting$(\theta,\varphi)=(\pi/2,0)$ and $(\theta,\varphi)=(\pi/2,\pi/2)$ in Eq. [](blochv) and Eq. [](blochvorth) gives the two eigenvectors of $\sigma_x$ and $\sigma_y$, often denoted by $\ket{\pm x}$ and $\ket{\pm y}$.

```{figure} ./qubit.png
---
height: 400px
name: bloch
---
$\textbf{Bloch sphere:}$ Any pure quantum bit can be represented  by a point in the surface of the Bloch sphere. The corresponding  unit vector, $\hat n=(\sin\theta\cos\varphi,\sin\theta\sin\varphi,  \cos\theta)$, is known as Bloch vector. Mixed states are inside the sphere.
```




