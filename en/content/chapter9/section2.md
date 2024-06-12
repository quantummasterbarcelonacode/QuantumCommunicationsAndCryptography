```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Quantum Error Correction

Adapting error correction to the quantum realm is not easy. Error correction builds on redundancy, the repetition of the message, and we know that quantum information cannot be cloned. Also, when decoding, Bob should perform a measurement to read the received state and then decide about how to decode. But quantum measurements perturb the state of the system, hence it seems that the decoding procedure will also introduce errors. In fact, in the early days of quantum information theory, prominent researchers cast doubts on the possibility of quantum error correction {cite}`haroche`.

As first shown by Shor and Steane in {cite}`errcorr1,errcorr2`, quantum error
correction is possible. This breakthrough was based on a clever
translation of the known classical techniques to the quantum
formalism, where again $m$ logical qubits are encoded into codewords made of $n$
physical qubits: $(m=1,n=7)$ for Steane's and $(m=1,n=9)$ for Shor's scheme. Now, with this knowledge, we can rephrase the previous discussion on error correction in quantum terms. Given a channel described by a CPTP map $\Lambda$, Alice encodes an $m$-qubit message into $n$ physical qubits through an $n\rightarrow m$ isometry $\mathcal E$ mapping any state $\ket\psi\in\compl^{\otimes m}$ to $\ket{\psi'}=\mathcal E \ket{\psi}\in\compl^{\otimes n}$. These $n$ qubits are now sent through the noisy channel, so Bob receives the $n$-qubit mixed state $\rho'=\Lambda^{\otimes N}(\proj{\psi'})$. Bob applies the decoding map $\mathcal D$ to this state, getting $\rho=\mathcal D(\rho')$. The goal of the protocol is for this state to be $\epsilon$-close to the encoded state $\ket\psi$, that is, to have $\bra\psi\rho\ket\psi\geq 1-\epsilon$ for a given error threshold $\epsilon$.

It is far from the scope of these
notes to give a detailed explanation of quantum error correction.
However, we provide in what follows a simple scheme that shows how to improve the error rate of
the noisy channel 

```{math}
:label:
\Lambda_x(\rho)=(1-p_x)\rho+p_x\sx\rho\sx ,
```

a channel for which with probability $1-p_x$ the state does not change, while a bit flip $\sx$ is performed with probability $p_x$. It is a rather academic channel, but it is enough to illustrate how
quantum error correcting techniques work.

The goal is to present an encoding and decoding process that does the analogue of the simple classical $1\rightarrow 3$ repetition code described above.
A representation of this scheme is shown in {numref}`errc`. The initial qubit to be transmitted is in an arbitrary state $\ket\psi=\alpha\ket 0 +\beta\ket 1$. Alice encodes it into a 3-qubit state by the isometry in which she adds two new qubits in state $\ket 0$ and performs two CNOT operations as shown in {numref}`errc`. The resulting state is $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. Note that the $1\rightarrow 3$ repetition is somehow achieved while keeping the coherences in the state. This state is now sent through the channel, so the state received by Bob is $\rho'=\Lambda_x^{\otimes 3}(\proj{\psi'})$. It is easy to see that this state can be written as

```{math}
:label:
\rho'=(1-p_x)^3\rho'_0+3(1-p_x)^2p_x\rho'_1+3(1-p_x)p_x^2\rho'_2+p_x^3\rho'_3 ,
```

where

```{math}
:label:
&&\rho'_0=\proj{\psi'}\nonumber\\
&&\rho'_1=\frac{1}{3}\left(\sx\otimes\one\otimes\one\proj{\psi'}\sx\otimes\one\otimes\one+\one\otimes\sx\otimes\one\proj{\psi'}\one\otimes\sx\otimes\one\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\one\otimes\sx \proj{\psi'} \one\otimes\one\otimes\sx\right) \nonumber\\
&&\rho'_2= \frac{1}{3}\left(\sx\otimes\sx\otimes\one \proj{\psi'} \sx\otimes\sx\otimes\one + \sx\otimes\one\otimes\sx \proj{\psi'} \sx\otimes\one\otimes\sx\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\sx\otimes\sx \proj{\psi'} \one\otimes\sx\otimes\sx\right) \nonumber\\
&&\rho'_3= \sx\otimes\sx\otimes\sx \proj{\psi'} \sx\otimes\sx\otimes\sx ,
```

that is, all the different terms where zero, one, two or three errors take place. Note the analogies with the classical case. Now, the goal is to design a map correcting all instances with zero and one error, that is $\mathcal D(\rho'_0)=\mathcal D(\rho'_1)=\proj\psi$. The circuit in {numref}`errc` achieves this, as we are going to show for each of the pure states appearing in these mixed states.

```{figure} ./errcorr.png
---
height: 400px
name: errc
---
Quantum error correction: The figure shows a simple example of encoding and decoding operations correcting at most one bit flip.
  The measurements on the fourth and fifth qubit inform Bob about which unitary operations $U_1$, $U_2$ and $U_3$ to implement to fix the error in one (or none) of the three physical qubits encoding the logical qubit
  in state $\ket{\psi}$.
```

- No errors: Bob receives the encoded state
    $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. One can see that the state after adding the extra two qubits and implementing the CNOTs in the error correction part is $(\alpha\ket{000}+\beta\ket{111})\ket{00}$. The measurements of the last two qubits give $00$. Basically, this circuit leaves the state in the first three qubits unchanged, as they are controlling the result of the CNOT gates, while the two bits obtained in the measurement, see {numref}`errc`, extract the information about the error: they inform us whether qubit 1 and 2 are identical, or whether qubit 1 and qubit 3 are equal. In the present case, since the result is 00, Bob deduces that the three qubits are equal. This is compatible with no error, or three errors, but the former is more likely, so he does nothing, $U_1=U_2=U_3=\one$. The state entering into the final decoding part is again  $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, which is mapped into $\ket{\psi}=\alpha\ket{0}+\beta\ket{1}$ by the two final CNOT operations and measurements. In fact, these two last measurements are not really needed.
- Error on the first qubit: Bob receives the state
    $\alpha\ket{100}+\beta\ket{011}$. After the series of CNOT gates, one has $(\alpha\ket{100}+\beta\ket{011})\ket{11}$. The two measurements on the last two qubits give 11. This informs Bob that qubit 1 is different from 2, and also from 3. If there was only one error, Bob knows he has to correct the first qubit, so he
    applies $U_1=\sigma_x$ and $U_2=U_3=\one$. The resulting state is again $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, so the final decoding part
    provides the initial state.
- Error on the second qubit: Bob receives the state
    $\alpha\ket{010}+\beta\ket{101}$. The reasoning proceeds as
    above, but now the state before the first measurement is $(\alpha\ket{010}+\beta\ket{101})\ket{10}$. The measurements give 10 and inform Bob that the second qubit was different from the other two, hence he corrects it, $U_2=\sigma_x$ and $U_1=U_3=\one$. The last part is identical to that in the previous step
- Error on the third qubit: Bob receives the state
    $\alpha\ket{001}+\beta\ket{110}$. Same as above, but now the
    measurements on the fourth and fifth qubit give 01, so Bob infers that the third qubit is wrong and applies $U_3=\sigma_x$ and
    $U_1=U_2=\one$.

This simple scheme illustrates how quantum error correction works: (i) Alice encodes the
$m$ initial logical qubits into quantum codewords made of $n$ physical
qubits; (ii) after propagation through the channel, some of the
qubits are measured, providing Bob information about the errors
occurred in the channel; (iii) the error is corrected and the
original quantum state decoded. A real quantum error correcting
method should correct not only bit flips, $\sigma_x$, but also
phase flips, $\sigma_z$, and any arbitrary combination of them. As
said, such schemes do exist and constitute a basic primitive on
any implementation of quantum information processing, especially for quantum computation purposes.

We now have all the ingredients to define the quantum capacity $\text{QC}$ of a quantum channel $\Lambda$. First of all, for $n$ uses of the channel, we define $m^*(n,\epsilon)$ as the maximum number of qubits that can be transmitted with error $\epsilon$. This means that there exist encoding and decoding maps, $\mathcal E$ and $\mathcal D$, such that for all $\ket\psi\in\compl^{\otimes m}$, one has $\bra\psi\rho\ket\psi\geq 1-\epsilon$, where $\rho=(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)$. Then, the quantum capacity of the channel is defined as in Eq. {eq}`capacity`, with this new definition of $m^*(n,\epsilon)$.

While the formal definition of capacities for classical and quantum channels look almost identical, there are several important differences. First of all, and contrary to what happens in the classical case, there exist channels with zero quantum capacity, $\text{QC}=0$, although the state received by Bob depends on Alice's preparation. The easiest examples of such channels are given by the so-called two-shareable channels. These are channels $\Lambda$, say from $A\rightarrow B$, such that there exists another channel $\tilde\Lambda$ from $A\rightarrow B_1B_2$ with the property that, for all input states $\rho$, one has $\tr_1(\tilde\Lambda(\rho))=\tr_2(\tilde\Lambda(\rho))=\Lambda(\rho)$. In fact, supposed that the original channel was such that $\text{QC}>0$. This would mean that there exist encoding and decoding operations such that  $\bra\psi(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)\ket\psi\geq 1-\epsilon$. Now, one could then apply the encoding to a state $\ket\psi$, use it as input to $\tilde\Lambda$ and apply the decoding map to the output states $B_1$ and $B_2$, getting two copies of the initial state of arbitrarily good quality, and therefore violating the no-cloning theorem. That is, the no-cloning theorem implies the existence of non-trivial channels with zero quantum capacity. Note that there are very natural examples of two-shareable channels, possibly the simplest being a lossy channel in which a state is transmitted with probability $1/2$ from $A$ to $B$. It can trivially be shared by a channel in which the state is transmitted either to $B_1$ and $B_2$ with probability $1/2$. Recall that this channel appears in optical fibre communications and, in fact, a transmission below $1/2$ is obtained at relatively short distance. This implies that quantum error correction is of limited use for quantum communication purposes. 

Second, in the quantum case, we do not know whether a single-letter formula for the quantum channel capacity exists and, in fact, it is conceivable that it does not. Third, and this is related to the previous point, the quantum capacity is non-additive {cite}`smithyard`: there exist quantum channels $\Lambda_1$ and $\Lambda_2$ such that (i) $\text{QC}(\Lambda_1)=\text{QC}(\Lambda_2)=0$, but (ii) $\text{QC}(\Lambda_1\otimes\Lambda_2)>0$. In other words, two channels that are individually useless to send quantum communication become useful when combined. This astonishing property of quantum information is in fact more common than initially expected, as there are several operational scenarios in which quantum information properties are not additive, the quantum capacity being one of the most famous examples. This non-additivity property is sometimes encapsulated by the amusing formula $0+0>0$.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


