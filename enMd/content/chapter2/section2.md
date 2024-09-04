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



# Quantum Gates

Although these notes focus on quantum communication and cryptography, let us briefly
review here, for the sake of completeness, the basic logical operations
acting on a qubit. Recall that any classical computation consists of a
sequence of logical gates on a string of bits. Any of these gates
can always be decomposed in terms of AND  and NOT gates. These two
operations, then, give a universal set of gates for classical
computation. One would conclude that what is needed in order to
adapt classical to quantum computation is (i) to encode the classical
bits into quantum bits as above, $i\rightarrow\ket i$, and (ii)
to implement the quantum version of these gates.

When dealing with quantum information processing in a controlled (closed)
system, any evolution is described by a unitary operation $U$.
These operations are reversible, i.e. knowing the operation and
the output state, one can always reconstruct the input state. Note
however that the OR and AND gates are irreversible, since the output bit
is not enough to infer the two input bits.
Therefore, in order to embed standard classical computation into the
quantum formalism, one first has to make it reversible. This is
indeed possible, as shown by Bennett in {cite}`bennett1973logical`: any
classical computation can be made reversible without an
exponential increase of the required resources. This implies that
any classical computation can be simulated by quantum means, as
follows: first construct the equivalent reversible classical
computation and then replace the classical bits, or cbits, by qubits. In this scheme, the
corresponding quantum and reversible version of an operation $f$
on a bit string $\vec b$ reads

```{math}
:label: revf
    U_f\ket{\vec b}\ket 0=\ket{\vec b}\ket{f(\vec b)} .
```

For example, the quantum AND can be as follows: an ancillary state
in state $\ket{0}$ is appended to the two input qubits in states $\ket i$
and $\ket j$. It is easy to see that there exists a unitary acting
on a three-qubit system mapping $\ket i\ket j\ket 0\rightarrow\ket
i\ket j\ket{i\cdot j}$. 

<!--Luke: rather than a dot, maybe $i \text{AND} j$ would be better?) -->

The previous discussion shows that any classical computation can
be embedded on a quantum computer, a device able to manipulate
quantum states. However, one would like to see whether it is
possible to go further. In order to do that, it is important to
characterize the set of all quantum operations on a quantum state.
For instance, it would be interesting to identify, as in the
classical case, a set of elementary gates in which to decompose
any unitary operation acting on an initial state of $N$ qubits. A seminal
result in this direction was provided in {cite}`barenco1995elementary`: the set
of all one-qubit operations plus the CNOT gate is
universal. More precisely, any unitary operation acting on an $N$-qubit
system, $U\in SU(2^N)$, can be decomposed as a sequence
of single-qubit operations and CNOT gates. In fact, it turns out that any two-qubit
entangling operation is sufficient for quantum
computation when assisted with single-qubit operations
{cite}`bremner2002practical`. From a more practical point of view, it has been
shown that the so-called Hadamard ($U_H$), phase ($U_{ph}$), $\pi/8$ ($U_{\pi/8}$) and CNOT gates are universal, i.e. any $N$-qubit
unitary operation can be decomposed in terms of these
gates {cite}`boykin1999universal`. Their expressions are

```{math}
:label:
  U_H = \frac{1}{\sqrt 2}\begin{pmatrix}1 & 1 \\
  1 & 1\\\end{pmatrix}\quad
  U_{ph} = \begin{pmatrix}1 & 0 \\
  0 & i\\\end{pmatrix}\quad
  U_{\pi/8} = \begin{pmatrix}1 & 0 \\
  0 & e^{i\pi/4}\\\end{pmatrix} .
```

The implementation of the previous three single-qubit operations
and the CNOT gate is sufficient for any experimental proposal of a
quantum computer. 

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


