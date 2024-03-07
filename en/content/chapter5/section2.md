```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Key rate for collective attacks

The importance of studying collective attacks comes from a result by Renner {cite}`renner` who proved that by increasing the number of protocol rounds $N$, 
and for a large family of protocols that includes all those described here, the amount of key that can be distilled in a protocol against general attacks tends to the key rate that can be distilled against the optimal collective attack. In other words, the length of secret key $K$ that can distilled after $N$ rounds satisfies $\lim_{N\rightarrow\infty} K/N=k_C$, where $k_C$ is the key rate against collective attacks. For a practical realisation with a finite number of rounds, there will be corrections to this limit and $k_C$ cannot be attained, as one has $K=k_CN-o(N)$. These corrections are relevant in practical situations and a full security proof is able to compute, or bound them. But $k_C$ is the asymptotically attainable rate. 

Putting everything together, in the entanglement-based picture, the security analysis of a protocol under collective attacks is as follows:

<!--Luke: The extra spaces at the start of the line here are important to maintain the blocks-->

- For all the rounds of the protocol, Eve prepares the tripartite pure state $\ket{\Psi}_{ABE}$, unknown to Alice and Bob, and distributes particles $A$ and $B$ to the honest users, while she keeps $E$ in a quantum memory. The reduced state shared between Alice and Bob is $\rho_{AB}=\tr_E\proj{\Psi}_{ABE}$.
- Alice (Bob) chooses to perform a series of measurements  $M_{a|x}$ ($M_{b|y}$)
    on her (his) particles, where $x$ ($y$) denotes the implemented measurement and $a$ ($b$) the obtained result, with probabilities $p_A(x)$ ($p_B(y)$).
- From their measurement results, Alice and Bob can estimate $p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})$. These probabilities fully or partly characterize their shared state. We denote by $\mathcal{S}_{AB}$ the set of states between Alice and Bob compatible with the observed probability distributions $p(ab|xy)$. 
- For each of these states $\tilde\rho_{AB}\in\mathcal S_{AB}$, Alice and Bob can include Eve's
system because of the Schmidt
decomposition. Indeed, consider the spectral decomposition of
$\tilde\rho_{AB}$, namely $\tilde\rho_{AB}=\sum_i\lambda_i\proj{\lambda_i}$.
If Alice and Bob want to include Eve in the picture, they should
characterise those pure states $\ket{\tilde\Psi}_{ABE}$ compatible with their shared state $\tilde\rho_{AB}$. Any such state can be written as  

    ```{math}
    :label: psiabe
        \ket{\tilde\Psi}_{ABE}=\sum_i
        \sqrt{\lambda_i}\ket{\lambda_i}_{AB}\ket{e_i} ,
    ```  

    where $\{\ket{e_i}\}$ define an orthonormal basis in Eve's space.
Note that Eve's dimensional space is equal to the rank (number of
non-zero eigenvalues) of $\tilde\rho_{AB}$. Given
$\ket{\tilde\Psi}_{ABE}$, which is completely specified by the basis
$\{\ket{e_i}\}$, any other state $\ket{\Phi}_{ABE}$ compatible with $\rho_{AB}$
is such that
$\ket{\Phi}_{ABE}=\one_{AB}\otimes U_E\ket{\tilde\Psi}_{ABE}$. That is,
the only difference between these two states is a unitary
operation on Eve's space, which corresponds to a different basis
$\{\ket{e'_i}\}$. This implies that any of these states is equally
powerful from Eve's point of view. We denote by $\mathcal{S}_{ABE}$ the set of pure states between Alice, Bob and Eve compatible with the observed probability distributions $p(ab|xy)$. Of course the state $\ket{\Psi}_{ABE}$ actually prepared by Eve is an element of this set.
- Alice and Bob focus on those measurements that are used to construct the key, for instance measurements $z$ by Alice and Bob in the BB84 protocol. When they apply these measurements to any of the states $\ket{\tilde\Psi}_{ABE}$, one gets

    ```{math}
    :label: ccq
        \tilde\rho_{ABE}=\sum_{a,b}p(ab)\proj{a}_A \otimes\proj{b}_B\otimes\proj{\tilde e^{ab}}_E,
    ```

    where $p(ab)=\bra{ab}\tilde\rho_{AB}\ket{ab}$ is the probability of
getting outcomes $a$ and $b$ and $\ket{\tilde e^{ab}}$ is Eve's projected
state when Alice and Bob have got these results. Up to normalization, this state is proportional to

    ```{math}
    :label: evestate
        \ket{\tilde e^{ab}}\propto\langle ab\ket{\tilde\Psi}_{ABE} .
    ```

    More precisely, the pure state $\ket{\tilde e^{ab}}$ is given by the right-hand side of the previous equation after normalisation.
The state {eq}`ccq` is often said to contain
classical-classical-quantum (ccq) correlations. In fact, note that, although
the state is given in a quantum form, Alice and Bob share only
classical outcomes whose correlations are encapsulated by the
probability distribution $p(ab)$. On Eve's side, however, she has
a quantum state $\ket{\tilde e^{ab}}$ that depends on, or equivalently, is correlated to Alice and Bob's classical
measurement results.
- Devetak and Winter proved that the key rate distillable $k_C$ from an asymptotically large number of identical copies of a ccq state {eq}`ccq` is lower bounded by the so-called Devetak-Winter bound, which reads {cite}`dwrate`

    ```{math}
    :label: dwbound
        k_C\geq K_{DW}(\tilde\rho_{ABE})=I(A:B)-\chi(A:E) .
    ```

    Clearly, the bound is a function of the ccq state $\tilde\rho_{ABE}$.
    Recall that $I(A:B)=H(A)+H(B)-H(A,B)$ is the mutual information of the
    probability distribution $p(ab)$. The expression $\chi(A:E)$ denotes the
    Holevo quantity {cite}`Holevo` for the effective coding of Alice's measurement
    outcome $a$ on Eve's quantum states. Indeed, any measurement result by
    Alice projects Eve's state into

    ```{math}
    :label: 
        \tilde\rho_E^a=\tr_{AB}(\proj a\otimes\one_{BE}\proj{\tilde\Psi}_{ABE})/p(a),
    ```

    where $p(a)$ is the probability that Alice observes the result $a$, $p(a)=\sum_bp(ab)=\tr(\proj a \otimes \one_{BE}\proj{\Psi}_{ABE})=\tr(\proj a\otimes\one_B\rho_{AB})=\tr(\proj a\rho_A)$, where $\rho_A=\tr_B\rho_{AB}$.
    The Holevo quantity then reads

    ```{math}
    :label: 
        \chi(A:E)=S(\tilde\rho_E)-\sum_a p(a)S(\tilde\rho_E^a) ,
    ```

    where $\tilde\rho_E=\sum_a p(a)\tilde\rho_E^a=\tr_{AB}\proj{\tilde\Psi}_{ABE}$. 
    To compute a valid bound on the the key rate, Alice and Bob should minimise the Devetak-Winter bound over all those states compatible with the observed statistics

    ```{math}
    :label: dwbound
        k_C\geq \min_{\tilde\rho_{ABE}\in\mathcal S_{ABE}}K_{DW}(\tilde\rho_{ABE}) .
    ```

    In fact, Alice and Bob should assume that the prepared state by Eve is the worst possible, that is, the solution to the previous minimisation problem. This minimisation provides the searched asymptotic key rate.

`````{admonition} Exercise 4: Computation of key rates
:class: tip

In the six-state protocol, Alice prepares the eigenstates of $\sigma_x$, $\sigma_y$ and $\sigma_z$, and sends them to Bob, who measures these observables. After basis reconciliation, Alice and Bob keep only those cases in which they use the same basis. In the entanglement-based picture, the protocol is basically equivalent to the preparation of the two-qubit maximally entangled state {eq}`bellstate` on which Alice and Bob measure the three Pauli operators. Consider now that Alice and Bob are connected by the so-called qubit depolarizing channel defined as

```{math}
:label: depchannel
\mathcal D_p(X)=pX + (1-p)\frac{\one}{2}\tr(X) .
```

a) Compute the state between Alice and Bob resulting from applying this channel to half of the maximally entangled state, 

```{math}
:label: 
\rho_{AB}=(\one_A\otimes\mathcal D_p)(\proj{\Phi}_{AB}).
```

b) Compute the probabilities of the results by Alice and Bob when they both measure in the $z$ basis

```{math}
:label: 
P(\pm,\pm)=\bra{\pm z}\bra{\pm z}\rho_{AB} \ket{\pm z}\ket{\pm z} .
```

c) Include Eve in the picture by providing a purification of the state $\rho_{AB}$, that is, a pure state $\ket{\psi}_{ABE}$ such that $\tr_E\proj{\Psi}_{ABE}=\rho_{AB}$.

d) Compute now the state between Alice, Bob and Eve after Alice and Bob measure in the $z$ basis

```{math}
:label: 
\rho_{ABE}=\sum_{a,b=\pm}P(a,b)\proj{a}\otimes\proj{b}\otimes\proj{e^{ab}}_E ,
```

where $\ket{e^{\pm\pm}}_E$ is given by $\bra{\pm z}_A\otimes\bra{\pm z}_B\otimes\one_E\ket{\Psi}_{ABE}$ after normalization.

e) Compute the two terms appearing in the Devetak-Winter bound, $I(A:B)$ and $\chi(A:E)$, where 

```{math}
:label: 
\chi(A:E)=S(\rho_E)-\sum_{a=\pm}p(a)S(\rho^a_E), 
```

$S(\rho)=-\tr(\rho\log\rho)$ is the standard von Neumann entropy, $\rho^a_E=\sum_{b=\pm}p(b|a)\proj{e^{ab}}_E$ and $\rho_E=\sum_a p(a)\rho^a_E=\tr_{AB}\proj{\Psi}_{ABE}$. Calculate the value of $p$ for which the Devetak-Winter bound becomes equal to zero.

`````

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

