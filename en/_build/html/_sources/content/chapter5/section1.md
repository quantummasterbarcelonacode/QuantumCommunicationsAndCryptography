```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Eve's attacks

We first describe the possible attacks that Eve can implement. 
As an illustration, we consider a paradigmatic attack on BB84 based on what are called optimal cloning machines. This is an example of a general family of attacks called *individual* attacks in which: (i) Eve intercepts the particle sent from Alice to Bob, $\ket{\psi_a}$; (ii) adds another particle in a reference state, say $\ket 0$, and performs a unitary operation $U_E$ on the two particles; (iii) Eve forwards one of the resulting states to Bob, while she keeps the other particles in a quantum memory; (iv) once the bases are announced by the honest users, Eve measures her particle, see {numref}`indattacks`, getting the measurement result $e$. As a result of this process, Alice, Bob and Eve share correlated random variables corresponding to their prepared states and measurement results, $a$ and $b$ for the honest users, and $e$ for Eve, described by the probability distribution $P(a,b,e)$.

```{figure} ./Cloning_Attack.png
---
height: 400px
name: indattacks
---
Structure of individual attacks: Eve interacts with the states prepared by Alice and a reference state, say $\ket 0$ through a unitary operation $E_E$. She forwards one particle to Bob and keeps the other one, which is measured after the bases are announced.
```

`````{admonition} Exercise 3
:class: tip
Consider a cloning individual attack in which Eve's action is described by a one-parameter family of unitary operations $U(\eta)$. While the no-cloning theorem states that an unknown quantum state
cannot be cloned, approximate cloning is always possible.
Consider states in the equator of the Bloch sphere, that is,

```{math}
:label: thetast
\ket{\theta}=\frac{1}{\sqrt
2}\left(\ket{0}+e^{i\theta}\ket{1}\right) .
```

Note that if $\theta=0,\pi/2,\pi,3\pi/2$ one gets the four states $\ket{\pm x}$ and $\ket{\pm y}$ that can be used for BB84. Take a generic state $\ket{\theta}$ and an ancillary state
$\ket{0}$ and apply the global transformation (acting on the two
states) $U(\eta)$, or $U$ to simplify the notation, 


```{math}
:label: 
  U\ket{00} &= \ket{00}, \\
  U\ket{10} &= \cos\eta\ket{10}+\sin\eta\ket{01} .
```

a) Briefly explain why $U$ is a valid unitary transformation on the considered quantum states.

b) Compute the final two-qubit state $\ket{\psi(\theta)}_{BE}=U_{BE}\ket{\theta}_B\ket{0}_E$
and the reduced states $\rho_B$ and $\rho_E$, where
$\rho_B=\tr_E\proj{\psi(\theta)}$ and similar for $\rho_E$.

<!--Luke: The partial trace hasn't been defined in this course, no?-->

c) Compute the overlap, or fidelity, of these two states with the initial
state, that is $F_i=\bra{\theta}\rho_i\ket{\theta}$, with $i=B,E$.
Do these fidelities depend on $\theta$? Find also the value of
$\eta$ for which the two fidelities become equal. Finally, compute the
reduced states when $F_B=1$. How do you interpret these results?

d) Apply this attack to the BB84 protocol when Alice and Bob use the states $\ket{\pm x}$ and $\ket{\pm y}$ and Eve measures in the same basis as Alice and Bob after basis reconciliation. Compute the distribution of variables $P(a,b,e)$ where $a$ denotes the bit encoded by Alice, and $b$ and $e$ the measurement results by $e$. Compute also the so-called Quantum Bit Error Rate (QBER) defined by the probability that Bob's result is different from Alice's preparation when the bases agree, and the mutual information between Alice and Bob, $I(A:B)$, and between Alice and Eve, $I(A:E)$, where $I(X:Y)=H(A)+H(B)-H(AB)$ and $H(X)=-\sum_x p(x)\log(p(x))$.
`````

Historically, individual attacks were the first studied in the security of cryptographic protocols. The previous cloning attack is optimal in terms of fidelities because it, for a given fidelity on Bob's side $F_B$, optimises the value of $F_E$. Individual attacks, however, are not the most general because assume that Eve (i) interacts in the same way with all the quantum particles sent from Alice to Bob and (ii) measures her particle at the end of basis reconciliation. Individual attacks may for instance miss the possibility that a correlated interaction among rounds of the protocol could give Eve more information, or that Eve could wait until the end of the key distillation process and use all the information revealed during it to optimise her measurement, or even wait until the key is used. In fact, the security proof should work for the most general situation in which Eve keeps her quantum particle in a quantum memory and does not measure it: if one proves security for this situation, the proof also holds for any measurement Eve could later apply to her quantum system. Individual and the most general attacks are shown in {numref}`attacks`, where we show them in the entanglement-based picture usually employed to prove security. An intermediate attack that happens to be very useful is the so-called *collective* attack in which Eve (i) keeps her information in a quantum form, that is, stores her quantum particles in a memory, but (ii) she applies the same interaction in each round. 

Finally, since in the most general situations we are considering attacks in which Eve keeps her information in a quantum form, the definition of secret key should be adapted to this scenario. Informally, a protocol is able to distill a key of lenght $k$, whenever the result of the protocol is a state $\rho_{ABE}$ that is very close to the ideal state

```{math}
:label: secretkey
\rho_{ABE}^{(k)}=\frac{1}{2}(\proj{00}+\proj{11})_{AB}^{\otimes k}\otimes\proj{E}_E ,
```

that is: Alice and Bob share $k$ perfectly correlated bits that are secret because they are uncoupled from Eve's quantum system, which is in some arbitrary reference state $\ket E$.

```{figure} ./attacks.png
---
height: 400px
name: attacks
---
Structure of eavesdropping attacks: In the individual and collective attacks, Eve prepares $N$ copies of the same state $\ket{\psi}_{ABE}$ and forwards a particle from each state to Alice and Bob who measure them. In the case of individual attacks, Eve also applies the same measurement on each particle after basis reconciliation. In collective attacks, Eve keeps her $N$ quantum systems in a quantum memory for later use. In general attacks, Eve prepares a joint state $\ket{\psi^{(N)}}_{\vec A\vec BE}$, forwards the corresponding particles to Alice and Bob for their measurements, while she keeps a (possibly large) quantum system in a quantum memory. All the attacks are shown in the entanglement-based scenario.
```


