```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Physical Correlations

The main reason why DI applications are possible is because it is assumed that the devices are compatible with a physical theory, in our case quantum mechanics, and this enforces some non-trivial constraints on the observed correlations.

The weakest constraints that can be imposed is that the correlations do not allow for any form of communication between Alice and Bob. As said, this is one of the few assumptions of the formalism, which can for instance be enforced by means of space-time considerations. Some correlations are compatible with this assumption if, and only if, the marginal probability distribution seen by one of the parties, say Alice, is independent of the input used by the other, Bob. In fact, if it was not the case, Bob, by choosing his input, could produce a noticeable effect on Alice, that is to say that he could signal to her. These constraints  are known as no-signalling conditions and give rise to the so-called *non-signalling* correlations. They imply that correlations satisfy the linear constraints

```{math}
:label: nscorrelations
\forall y: p_A(a|x)=\sum_b p(ab|xy), \quad\quad
\forall x: p_B(b|y)=\sum_a p(ab|xy).
```

The set of non-signalling correlations, denoted by $\mathcal{NS}$, is convex and it can be proven that for finite $m$ and $r$ it has a finite number of extreme points, which defines what is called a polytope.

Before the advent of quantum theory, the standard way of describing correlations was by means of deterministic classical models. This defines the so-called *classical* correlations, which are those that can be written as

```{math}
:label:
p(ab|xy)\sum_\lambda p(\lambda)D_A(a|x\lambda)D_B(b|y\lambda) ,
```

where $\lambda$ denotes a correlated classical variables hidden in the devices described by the probability distribution $p(\lambda)$, while $D_A$ and $D_B$ are deterministic functions producing the outputs depending on the inputs and this variable. Classical correlations are nothing but the EPR correlations introduced in {cite}`epr`. For finite $m$ and $r$, the set of classical correlations $\mathcal C$ is again a polytope, that is, a convex set with a finite number of points.

Finally, the set of interest here is that of quantum correlations. This is defined by those correlations that can be obtained when performing local measurements on a two-party quantum state. We therefore have that some correlations are quantum whenever there exists a state acting on a composite Hilbert space $\mathcal H_A\otimes\mathcal H_B$ and local measurement in each Hilbert space defined by POVMs elements $M_{a|x}$ and $M_{b|y}$, all positive operators such that $\sum_a M_{a|x}=\one_A$ for all $x$ and $\sum_a M_{b|y}=\one_B$ for all $y$, such that

```{math}
:label: qcorrelations
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{a|x}) .
```

Note that we do not impose any specific conditions on the Hilbert spaces used to derive these correlations, they are arbitrary. In particular, the Hilbert space dimension are not specified, that is, the measured systems can be qubits, qutrits, or even have infinite dimension. In fact, the characterisation of quantum correlations, that is, which conditional probability distributions can be expressed as in Eq. {eq}`qcorrelations`, is very hard, as, intuitively, one needs to explore all possible Hilbert spaces. The set of quantum correlations $\mathcal Q$ is again convex but does not have a finite number of extreme points. 

The relation among these three physical sets is relatively well understood and one has $\mathcal C \subsetneq \mathcal Q \subsetneq \mathcal{NS}$. A pictorial representation of these sets is given in {numref}`difig`, which reflects the most salient properties of these sets. The first strict inclusion is nothing but a consequence of Bell's theorem, that is the existence of quantum correlations with no classical analogue. In fact, the facets of the classical set define Bell inequalities, hyperplanes defining linear conditions expressed in terms of the observed correlations that are satisfied by all classical correlations (as the set of classical correlations is fully contained on one side of the hyperplane). The second inclusion was proven by Tsirelson and, independently Popescu and Rohrlich {cite}`PRbox`. They derived the so-called Popescu-Rohrlich (PR) box, a conditional probability distribution $p(ab|xy)\in\mathcal{NS}$ that has no quantum realisation. This distribution is obtained for the case of binary inputs and outputs, $m=r=2$. Denoting the values of inputs and outputs by bits, the PR-box is such that $p(ab|xy)=\delta_{a\oplus b=xy}/2$. Here $\oplus$ is the classical XOR, while $xy$ is the AND of these two bits. To understand the notation, we give two examples: $p(a=1,b=1|x=1,y=1)=\delta_{1\oplus 1=AND(1,1)}/2=\delta_{0,1}/2=0$ and $p(a=0,b=0|x=0,y=1)=\delta_{0\oplus 0=AND(0,1)}/2=\delta_{0,0}/2=1/2$. In a more compact way, when $xy=0$ ($xy=1$) the outputs of Alice and Bob are perfectly (anti-) correlated and occur with the same probability. The proof that these correlations are not quantum follows from the fact that they lead to a CHSH value of 4, larger than the maximum allowed by quantum physics, equal to $2\sqrt 2$ {cite}`tsirelson`. To see that these correlations produce a CHSH value equal to $4$ is convenient to relabel the outputs as $a,b=\pm 1$ and the inputs as $x,y=1,2$. When the two or one input is equal to 1 (0 in the bit notation used to specify the PR-box), the outputs are perfectly correlated, hence $ab=+1$, so $A_1B_1=A_1B_2=A_2B_1=+1$, while when both inputs are equal to 2 (1 in the bit notation), outputs are perfectly anti-correlated, so one has $A_2B_2=-1$. These values produced the announced non-quantum value of $\text{CHSH}=4$.

After this small parenthesis, devoted to motivate why correlations become non-trivial when combined with a physical theory or even just a physical principle, we present the main ideas to construct device-independent quantum information protocols. Note that in the DI scenario, for Alice and Bob to obtain a result not possible in classical information theory, they should observe correlations that do not have a classical model, that is, correlations that violate a Bell inequality. In fact, Bell inequalities are witnesses of the intrinsically quantum or non-classical origin of these correlations. Since we are going to assume that the devices are quantum, we can focus on correlations in $\mathcal Q$ and discard those correlations in $\mathcal{NS}$ that do not have a quantum realisation.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


