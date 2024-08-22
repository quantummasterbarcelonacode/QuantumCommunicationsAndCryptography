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
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Other Protocols

The BB84 protocol distributes a secret key from Alice and Bob
using quantum states that are prepared by Alice, sent through the
insecure channel and measured by Bob. This type of protocol is
known as *prepare and measure*. Clearly, the construction is much more
general than BB84 and one can design many other protocols for secure key
distribution based on this idea. The main purpose of this section
is to present some of them. One can find many more QKD
protocols in the literature. Here, we choose those that represented
an important theoretical advance.

## B92

The main reason why Eve cannot read the information 
encoded on the sent quantum states is that Alice is choosing them from a set that contains non-orthogonal quantum states.
Being non-orthogonal, Eve cannot clone or measure all of them
without introducing detectable errors. In 1992, Bennett showed that two non-orthogonal states
are enough for secure QKD {cite}`B92`. The interest of this protocol comes from
the fact that it is the one involving the minimal number of prepared states, namely two.

The protocol works as follows. Alice encodes a random bit into two non-orthogonal states, $\ket{\psi_0}$ and $\ket{\psi_1}$, and sends the prepared state to Bob through an insecure channel. Again, Eve's attack is limited by the non-orthogonality of the states. A possible simple measurement by Bob is as follows: he randomly chooses to measure in the basis defined by $\ket{\psi_0}$ and its orthogonal state, denoted by $\ket{\psi^\perp_0}$ and such that $\langle \psi^\perp_0\ket{\psi_0}=0$, or the basis $\{\ket{\psi_1},\ket{\psi^\perp_1}\}$. When Bob gets the output corresponding to any of the orhogonal states for any of the two measurements, say outcome corresponding to $\ket{\psi^\perp_0}$ when measuring $\{\ket{\psi_0},\ket{\psi^\perp_0}\}$, he knows that the state was for sure not $\ket{\psi_0}$ because $\langle \psi^\perp_0\ket{\psi_0}=0$, and hence it has to be $\ket{\psi_1}$. Therefore, in this reconciliation, Bob announces those instances in which his measurement gave an outcome corresponding to any of the states orthogonal to those prepared by Alice. A more efficient but also experimentally demanding measurement is given by the one attaining the optimal unambiguous discrimination of the states $\ket{\psi_0}$ and $\ket{\psi_1}$. 

`````{admonition} Exercise 2 - Unambiguous discrimination of two non-orthogonal pure states
:class: tip
Consider two non-orthogonal pure states $\ket{\psi_0}$ and $\ket{\psi_1}$, with $\langle \psi_0\ket{\psi_1}>0$. Without loss of generality, the two states can be rotated to be in the $XZ$ plane and with the $+z$ axis as bisector, so that they read:

```{math}
:label: states
\ket{\psi_0}=\left(\begin{array}{c}\cos\theta \\ \sin\theta\end{array}\right) \quad\quad
\ket{\psi_1}=\left(\begin{array}{c}\cos\theta \\ -\sin\theta\end{array}\right) ,
```

with $0<\theta\leq\pi/4$. Let $\ket{\psi}$ be an unknown state chosen between these two with equal probability. Consider a three-outcome measurements defined by the operators:

```{math}
:label: povm
M_0=\mu\proj{\psi_1^\perp} \quad\quad  M_1=\mu\proj{\psi_0^\perp}   \quad\quad  M_?=\one-M_0-M_1 ,
```

where $\ket{\psi_i^\perp}$ denotes the state orthogonal to $\ket{\psi_i}$. 

a) Find the range of values of $\mu$ so that the measurement is well defined, that is, all the three measurement operators are positive semi-definite. 

b) For this value of $\mu$, compute the probabilities of obtaining the three outputs for each of the two states. What's the operational meaning of this three-outcome measurement? 

<!--Luke: Should this not be "values" or "range of values" rather than "value"?-->

c) Finally, determine the value of $\mu$ that minimises the average probability of obtaining the third outcome, that is:
```{math}
:label:
P_?=\frac{1}{2}\left(p(?|0)+p(?|1)\right) .
```
How does it relate to the overlap between the two states?
`````


## Six-state Protocol

The six-state protocol, introduced by BruÃŸ {cite}`6state`, 
goes in the opposite direction: it involves more states to make
Eve's attack more difficult. In the BB84 protocol, only four states
belonging to a given equator in the Bloch sphere, say the plane
$xy$, are used. However, one could consider more elaborate
protocols in which Alice prepares states that are better
distributed over the sphere. This is precisely the main idea
behind the six-state protocol: Alice prepares a state from the
six-state set $\{\ket{\pm x},\ket{\pm y},\ket{\pm z}\}$. Bob now
measures along these three bases, $x$, $y$ and $z$. Clearly, after basis reconciliation,
Alice and Bob are assumed to derive a list of perfectly correlated
bits. From Eve's point of view, her task becomes more complex as
she has to clone, or distinguish, among more non-orthogonal
states. However, from Alice and Bob's point of view, only 1/3 of the rounds are kept after basis reconciliation. 
After all, the improvement in security is moderate, while in some implementations the technological
requirements to prepare the six states are more demanding, so the protocol has hardly been adopted in practice.

## Goldenber-Vaidman Protocol

The last protocol that we present in this part was introduced by
Goldenber and Vaidman {cite}`vaidman`. The protocol uses entanglement and proves that secure key
distribution is still possible using two orthogonal states if
these two states are used in a careful way. The idea of the
protocol is as follows: Bob prepares a two-qubit maximally
entangled state, $\ket{\Phi^+}=(\ket{00}+\ket{11})/\sqrt 2$. He
sends only one of the particles to Alice. Alice now applies nothing, that is $\one$,
or $\sigma_z$ depending on the bit she wants to transmit, and sends
the qubit back to Bob. The two states, depending on Alice's random
bit, are $\ket{\Phi^\pm}$, where now $\ket{\Phi^-}=(\ket{00}-\ket{11})/\sqrt 2$. On reception, Bob
can perfectly discriminated between these two states and read the result because they are orthogonal.
Although, as said, the information encoding by Alice produces two
orthogonal states, this fact cannot be exploited by Eve. She only has
access to one of the two
quantum particles prepared and transmitted  by Bob, while the other particle always remains in
Bob's lab, and is hence never accessible to Eve. This makes the quantum measurement by Eve on the two
orthogonal states impossible. In fact, the qubit Eve can access to is always in the reduced state of $\ket{\Phi^\pm}$, equal to $\one/2$ for both states, which guarantees the protocol's security.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


