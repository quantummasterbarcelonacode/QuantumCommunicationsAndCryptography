# Basics of Quantum Mechanics

The scope of this first section is to introduce the basic postulates of Quantum Mechanics and its mathematical structure. Most of the formalism presented here can be found in chapter 2 of {cite}`nielsen2010quantum`. Linear algebra is the study of vector spaces and of linear operators acting on those spaces. Actually, all quantum machinery is linear algebra on a complex Hilbert space explained through the less standard Dirac’s notation. In this notation,

- $\ket{\psi}$ stands for a column vector, also known as a ket.
- $\bra{\psi}$ stands for the vector dual to $\ket{\psi}$, also known as a bra.
- $\braket{\phi|\psi}$ is the standard scalar product between two vectors $\ket{\psi}$ and $\ket{\psi}$.

The norm of a vector $\ket{\psi}$ is $||\psi||$ = $\sqrt{\braket{\psi|\psi}}$. In general, most of Quantum Information (QI) applications deal with complex spaces of finite dimension $d$, denoted by $\mathbb{C}^d$.

`````{admonition} Example
:class: note
Given two vectors in a complex two-dimensional space, denoted by $\mathbb{C}^2$,

```{math}
:label:
\ket{\psi} = \begin{pmatrix}1 \\ i\end{pmatrix} \qquad \ket{\phi} = \begin{pmatrix}−3i \\ −1\end{pmatrix},
```

one has

```{math}
:label:
\bra{\psi} = (1 \quad −i) \qquad \bra{\phi} = (3i \quad −1), \\\\
\braket{\phi|\psi} = (3i \quad −1) \begin{pmatrix} 1 \\ i \end{pmatrix} = 2i.
```
`````

## Pure states
The first postulate of Quantum Mechanics says that there is a complex Hilbert space
(vector space with an inner product) associated to any physical system. The description of this system is given by a normalized vector in this space. On the other hand, any normalized vector in the space represents a possible state of the physical system. Therefore, all the information about an isolated physical system can be specified by means of a vector in a Hilbert space. It follows from this postulate and the definition of a vector space that if $\ket{\psi_1}, \ket{\psi_2} \in \mathbb{C}^d$ are two possible states of a system, then any linear superposition of these two vectors, $\ket{\psi} = \alpha\ket{\psi_1} + \beta \ket{\psi_2}$, where α and β are complex numbers and such that $||\psi|| = 1$, is a valid vector and, hence, also represents a valid state of the system. This is also known as the superposition principle and $\ket{\psi}$ is often called a coherent superposition of $\ket{\psi_1}$ and $\ket{\psi_2}$.

## Composite systems
Consider now two physical systems, $A$ and $B$, each described by the corresponding Hilbert space, $\mathcal{H}_A$ and $\mathcal{H}_B$. The Hilbert space associated to the global system $AB$, denoted by $\mathcal{H}$, consists of the tensor product of the two local spaces, $\mathcal{H} = \mathcal{H}_A \otimes \mathcal{H}_B$. This is another postulate of Quantum Mechanics.

## Entanglement
The consequences of these two initial postulates are huge. Indeed, consider two
possible states of the global system, $\mathcal{H}_A \otimes \mathcal{H}_B$: $\ket{\psi_A}\otimes\ket{\psi_B}$ and $\ket{\phi_A}\otimes\ket{\phi_B}$, or more briefly $\ket{\psi_A \psi_B}$ and $\ket{\phi_A \phi_B}$. Then, $\ket{\Psi} = \alpha\ket{\psi_A \psi_B} + \beta\ket{\phi_A \phi_B}$ also gives a possible state of the composite system $AB$. However, this state in general cannot be written as the tensor product of two vectors on each local space, $\ket{\Psi} \ne \ket{\varphi_A \varphi_B}$. If it cannot, it is said that $\ket{\Psi}$ is entangled. Entanglement then appears as a consequence of the tensor product and vector space structure of Quantum Mechanics.

## Unitary evolution
The evolution of an isolated physical system, whose initial state is given by $\ket{\psi}$, is described by the application of a unitary operation, $U$. Thus, the evolved state of the system is $\ket{\phi} = U \ket{\psi}$. Recall that this is another postulate of Quantum Mechanics. A unitary operation on a Hilbert space of dimension $d$ is simply a $d×d$ complex matrix satisfying $U U^† = \mathbb{1}$.

## Mixed states
Consider the previous description of entanglement: a state is entangled when it cannot be written in a product form. That is, although the global state of the system can be described by a vector in $\mathcal{H}_A ⊗ \mathcal{H}_B$ , it is impossible to associate to each local system a vector in $\mathcal{H}_A$ and $\mathcal{H}_B$. This is indeed related to the fact that system A is correlated to B, it is not isolated. Is there a mathematical way of describing non-isolated systems?

Alternatively, consider the case in which the preparation of a system is imperfect, that is, the system can be in state $|ψ_1〉$ with probability $p_1$, $|ψ_2〉$ with probability $p_2$ and so on. What’s the mathematical description of the state of the system? Notice that in both cases there is a lack of knowledge about the state of the system. This is evident in the second scenario, since the preparation is noisy. But the same also happens in the first case: when trying to describe the local state of a non-isolated system, all the correlations with other systems, the environment, are ignored. Since the information on the state of the system is not complete, the state cannot be pure. In order to take into account this lack of information, the concept of mixed states is introduced.

The mathematical description of a system that can be in state $|ψ_i〉∈ \mathcal{H}$ with probabilities $p_i$, where $i = 1, ..., N$ and $N$ is arbitrary, is no longer given by a vector in this Hilbert space, but by an operator acting on it with the form

```{math}
:label:
ρ = \sum^N_{i=1} p_i |ψ_i〉〈ψ_i|. 
```

Note that $\text{tr}(ρ) = ∑ p_i \text{tr}(|ψ_i〉〈ψ_i|) = \sum_i p_i 〈ψ_i|ψ_i〉 = \sum_i p_i = 1$. If the state is pure, $\ket{\psi}$, there is only one non-vanishing probability, $p_1 = 1$, and $ρ = \ket{\psi}〈ψ|$. More generally, a state $ρ$ is pure if and only if $\text{tr}(ρ^2) = 1$.

## Noisy evolution
Having introduced the mixed-state formalism, one can specify how an open quantum
system evolves, or how to describe a noisy evolution. In this case, a quantum system in a pure state may loose its purity and become mixed. The general formalism is given by trace preserving completely positive maps. Indeed, any evolution of any (possibly mixed) initial state, $ρ_i$, into a state $ρ_f$, can be represented as

```{math}
:label:
ρ_f = \sum_k A_k ρ_i A^†_k,
```

where $A_k$ are operators such that $∑_k A_k A_k^† = \mathbb{1}.$ Note that $ρ_f$ is positive and has trace one.

## Measurements
The last process to consider is a measurement. Any measurement of $m$ outcomes on a system whose associated Hilbert space has dimension $d$ can be represented by the so-called Positive-Operator Valued Measure (POVM), defined by $r$ positive operators ${M_i ≥ 0}$, where $i = 1, ..., r$, such that $\sum_i M_i = \mathbb{1}$. Denote by $ρ$ the state to be measured. Then, outcome $i$ is obtained with probability $p(i|ρ) = \text{tr}(ρ M_i)$. This value is positive because $M_i$ are positive. It also follows that $\sum_i p(i|ρ) = \sum_i \text{tr}(ρ M_i) = \text{tr}(ρ \sum_i M_i) = \text{tr}(ρ) = 1$.

## General evolution
Collecting all the previous processes, a general evolution, consisting of a sequence
of measurements and possibly noisy evolutions can always be specified through a set of operators 
$A^i_k$ describing a map transforming any state $ρ$ into

```{math}
:label: eqnref5
ρ_i = \frac{\sum_k A^i_k ρ A^{i†}_k}{\text{tr}(\sum_k A^i_k ρ A^{i†}_k)} \quad \text{with probability} \quad p_i = \text{tr}(\sum_k A^i_k ρ A^{i†}_k).
```

Standard von Neumann measurements are covered by the previous formalism. A von Neumann, or projective, measurement in a $d$-dimensional system has $d$ possible outcomes and the corresponding operators are the projectors onto a basis in this space. More precisely: consider a basis in $\mathbb{C}^d$, defined by $d$ orthonormal vectors $|i〉$ such that $〈i|j〉= δ_{ij}$. A measurement in this basis is represented by the projectors $A_i = |i〉〈i|$. Note that if the initial state is $ρ$, the probability of obtaining outcome $i$, see Eq. [](eqnref5), is

```{math}
:label:
p_i = \text{tr}(|i〉〈i|ρ|i〉〈i|) = 〈i|ρ|i〉,
```

while the state is mapped into

```{math}
:label:
ρ_i = \frac{|i〉〈i|ρ|i〉〈i|}{\text{tr}(|i〉〈i|ρ|i〉〈i|)} = |i〉〈i|.
```

For the pure-state case, ρ = $\ket{\psi}\bra{\psi}$, these expressions read

```{math}
:label:
p_i = \text{tr}(|i〉〈i|\ket{\psi}〈ψ||i〉〈i|) = |〈i\ket{\psi}|^2,
```

and

```{math}
:label:
|ψ_i〉 = |i〉,
```

that is, the initial state $\ket{\psi}$ collapses into $|i〉$ with probability given by the square of the overlap, $|〈i\ket{\psi}|^2$. The previous formulae also imply that there is no measurement (physical process) distinguishing $\ket{\psi}$ from $e^{iγ} \ket{\psi}$. Thus, the state of a physical system is actually described by a vector in a Hilbert space, up to an irrelevant global phase.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

