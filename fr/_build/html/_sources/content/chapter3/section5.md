
# Bennett-Brassard-Mermin Argument

A few months after Ekert's work, Bennett, Brassard and
Mermin {cite}`BBM` wrote an article showing that a QKD protocol à
la Ekert can always be transformed into an equivalent protocol
without entanglement, à la BB84, where states are prepared by
Alice and measured by Bob. Their argument goes as follows.

First of all, the role of a Bell inequality violation in Ekert's
proposal is to certify that Alice and Bob share a two-qubit
maximally entangled state. However, there are other measurements
which can provide the same level of certification. For instance,
it is the only state which gives perfect correlations when both
local parties measure in the $x$ and $z$ basis. That is, it is the
only two-qubit state such that
$\bra{\psi}\sigma_x\otimes\sigma_x\ket{\psi}=
\bra{\psi}\sigma_z\otimes\sigma_z\ket{\psi}=1$. Thus, the detection of the maximally entangled state
can equally be performed via a protocol in which
both Alice and Bob measure in the $x$ and $z$ basis. Note that now
Alice does not need to introduce a third basis to get outcomes
that are perfectly correlated to Bob's.

The remaining step is noting that when measuring her quantum
particle, Alice is effectively preparing a state for Bob. Indeed,
in the ideal case, Alice receives half of a maximally entangled
state. Then, one can see that her measurement projects Bob's
particle into a state which is equal to the measurement result by
Alice. This follows from the simple observation that:

```{math}
:label: 
  _A\bra{\pm x}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm x}_B \nonumber\\
  _A\bra{\pm z}\ket{\Phi^+}_{AB} &=& \frac{1}{\sqrt 2}\ket{\pm
  z}_B .
```

That is, depending on her choice of basis, Alice is preparing a
state in the plus or minus direction with probability equal to
1/2. Clearly, the resulting protocol is equivalent to the original
protocol in terms of security. But the resulting protocol is
nothing but the original BB84 protocol and does not require any
entanglement. Thus, the authors of Ref. {cite}`BBM` concluded that
the approach by Ekert did not provide any new significant insight
into the problem of QKD, because both approaches were equivalent.

Apart from the conceptual implications, the work by Bennett,
Brassard and Mermin was also important from a technical point of
view, as it pointed out a nice correspondence between entanglement-based
à la Ekert and prepare-and-measure protocols à la BB84. On the one hand, most of
the protocols based on entanglement can be mapped into an
equivalent prepare-and-measure protocol using the previous
ideas. On the other hand,
any prepare-and-measure protocol can be mapped into an equivalent
entanglement-based protocol. Indeed, assume that in the initial
prepare-and-measure protocol Alice prepares the states
$\{\ket{\psi_i}\}$ with probabilities $p_i$. This can be done by
Alice by preparing an entangled state

```{math}
:label: 
    \sum_i \sqrt{p_i}\ket{i}_A\otimes\ket{\psi_i}_B ,
```

and measuring now her particle in the basis $\{\ket{i}\}$. 
As we discuss in the next section, this parallelism provides an
important conceptual and technical simplification of security
proofs in QKD. Usually, the security  proofs of QKD protocols are derived in the 
entanglement-based scenario, because there it is simpler to construct them, but the prepare-and-measure equivalent version is implemented in practice, as it just involves the preparation single-particle states and measurements.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

