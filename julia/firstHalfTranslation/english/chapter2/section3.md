```{math}
\def\compl{{\mathbb{C}}}
\def\L{{\cal L}}
```

# The No-Cloning Theorem

The previous sections have shown that a quantum bit is richer than its classical counterpart
because it can exist in superposition states.
Interestingly, the encoding of information on quantum states also
suffer from limitations that do not appear in Classical
Information Theory. One of the most important differences is encapsulated by the quantum
No-cloning Theorem, that shows that quantum information cannot be
copied. At first sight this is serious drawback for an information
theory. However, there are ways of circumventing this problem, as explained 
below. Moreover, this limitation can be turned into an
advantage, as shown by Quantum Cryptography. But let us
start by proving the No-cloning Theorem, first presented by Wootters
and Zurek in {cite}`wootters1982single`.

Assume there is a machine duplicating the quantum state of a
system, i.e. for any  $\ket\psi\in\compl^d$, the
machine outputs $\ket{\psi}\ket{\psi}$. This quantum process has to be
mathematically described by a linear map $\L$,

```{math}
:label: clmach
    \L(\ket{\psi}\otimes\ket{C})=\ket{\psi}\otimes\ket{\psi} ,
```

where $\ket{C}$ is the state of the machine where the clone is
produced. Since this machine is assumed to work for any initial
state, when applied to two orthogonal states, one gets

```{math}
:label: clclon
  \L(\ket{0}\otimes\ket{C}) &=& \ket{0}\otimes\ket{0} \nonumber\\
  \L(\ket{1}\otimes\ket{C}) &=& \ket{1}\otimes\ket{1} .
```

If we now look to a superposition state, say $(\ket 0+\ket 1)/\sqrt 2$, and since any quantum operation $\L$ is linear,

```{math}
:label: 
    \L\left(\frac{1}{\sqrt 2}(\ket 0+\ket 1)\ket C\right)=
    \frac{1}{\sqrt 2}(\L\left(\ket 0\ket C\right)+\L\left(\ket 1\ket C\right))=
    \frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

which is not equal to two copies of the initial state,

```{math}
:label: 
    \frac{1}{\sqrt 2}(\ket 0+\ket 1)\otimes
    \frac{1}{\sqrt 2}(\ket 0+\ket 1) .
```

Therefore, the linearity of Quantum Mechanics makes the cloning
process impossible. Note that one can indeed construct a cloning
machine producing two copies of two orthogonal states
(Eq. {eq}`clclon`), a classical cloning machine. Unfortunately, it
fails when cloning any coherent superposition of these two states.
In other words, nonorthogonality is at the heart of the No-cloning
Theorem.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

