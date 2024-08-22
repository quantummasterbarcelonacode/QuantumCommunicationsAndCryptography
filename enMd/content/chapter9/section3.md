```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Entanglement-Based Quantum Communication

Quantum error correction provides a solution for solving the
imperfections in the channel. However, if the errors in the
channel are too large, there cannot be any quantum error
correcting code allowing the faithful transmission of quantum
information through the channel. As said, this is in strong contrast to what
happens for classical information: even if the errors in the
channel are very large, there is always an encoding and decoding
process allowing a noise-free error transmission. When dealing with quantum channels, quantum
error correction may be impossible even in situations where Bob's
quantum state is correlated to Alice's initial state. Therefore, the problem of long-distance quantum communication should explore other methods and the solution again comes through entanglement.

Before proceeding, note that in a quantum communication scenario, if the parties are initially assisted by a maximally entangled state, say of two qubits Eq. {eq}`bellstate`, then Alice can perfectly send a qubit to Bob by means of quantum teleportation {cite}`teleportation`. At the end of this protocol, the entanglement is destroyed, so sharing a maximally entangled state is equivalent in this context to use once the identity channel $\Lambda(\rho)=\rho$, that is, a perfect channel with no errors. Let us now see how to make use of this idea.

If Alice and Bob are connected by a channel $\Lambda$, say of one qubit, and Alice is thinking of using teleportation, she can try to establish entanglement with Bob by locally preparing a two-qubit entangled state and then sending half of it through the channel. At the end of this process, Alice and Bob share the state

```{math}
:label:
\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+}) .
```

Now, suppose that this state can be transformed by LOCC into a maximally entangled state with some probability $p$. This process is called *entanglement distillation*. Then, the resulting maximally entangled state can be used to teleport a qubit reliable from Alice and Bob. If they repeat this process $n$ times, Alice and Bob will deterministically get of the order of $np$ maximally entangled states, and will hence be able to transmit of the order of $np$ qubits.

This procedure works for channels that are two-shareable, where quantum error correction is useless. A simple example is the channel with transmission coefficient $1/2$. In fact, it works for any purely lossy channel of transmission $\eta_C$. When sending half of a maximally entangled state, say encoded in two photons, through it, Alice and Bob end up with the state

```{math}
:label:
\rho_{AB}=\eta_C\proj{\Phi^+}+(1-\eta_C)\frac{\one}{2}\otimes\proj\varnothing ,
```

where $\ket\varnothing$ is the state associated to the loss of the photon. Now, Bob can now implement the two output measurement described by the Kraus operators

```{math}
:label:
A_{\text{ok}}=\proj 0+\proj 1, \quad A_{\text{loss}}=\proj\varnothing .
```

This is nothing other than Bob observing whether the particle encoding half of the maximally entangled state, in our example the photon, has made it through the channel without being destroyed. It is an example of the so-called quantum non-demolition measurements, which are challenging but possible.  It is clear than when Bob gets the result $r=\text{ok}$, which happens with probability $\eta_C$, the state between Alice and Bob is projected into $\ket{\Phi^+}$. 
 
 This result shows that quantum information can be transmitted through any purely lossy channel, with a rate that goes at least as $\eta_C$. This is not in contradiction with the previous result using quantum error correction. In fact, the previous expression for the quantum channel capacity was defined in terms of quantum error correction protocols in which information only goes from Alice to Bob. This implies that our previous definition was in fact encapsulating the so-called one-way communication capacity, denoted by $\textbf{QC}^\rightarrow$. In particular, this capacity is zero for two-shareable channels. However, in the previous protocol, using entanglement distillation, Bob needs to communicate with Alice to inform her about the result of his measurement, and this message goes in the opposite direction. A more general protocol could in fact involve several rounds of classical communication from Alice to Bob and viceversa. To take into account this possibility, we will define below the two-way quantum capacity $\text{QC}^\leftrightarrow$. 
 
The previous discussion shows that the problem of long-distance quantum communication is intimately connected to the problem of entanglement distillation through the channel. In fact, imagine that the channel would allow the distribution of states that are distillable, that is, that Alice and Bob could establish after $n$ uses of the channel a state that can be transformed into $m$ maximally entangled states of two qubits. Then, these $n$ uses would allow the exchange of $m$ qubits through teleportation. On the other hand, imagine that,  using $n$ times the channel, Alice and Bob could reliable distribute $m$ qubits. Then, Alice could apply this protocol to reliably send the $m$ halves of $m$ maximally entangled states to Bob, hence perfectly distributing entanglement.
It therefore follows that the two-way quantum capacity can be defined as follows. Consider $n$ uses of the channel acting on the $n$ halves of $n$ maximally entangled states, resulting in a state equal to $n$ copies of $\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+})$. Now, define $m^*(n,\epsilon)$ as the maximum number $m$ of maximally entangled states that can be distilled from this state by LOCC with an error $\epsilon$, that is, $^{\otimes m}\bra{\Phi^+}\text{LOCC}(\rho_{AB}^{\otimes n})\ket{\Phi^+}^{\otimes m}\geq 1-\epsilon$. Then, the two-way quantum capacity is defined as in {eq}`capacity`. For example, it follows from what has been said above that a lossy channel has $\text{QC}^\leftrightarrow>\text{QC}^\rightarrow=0$, proving the advantage of two-way communication strategies.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


