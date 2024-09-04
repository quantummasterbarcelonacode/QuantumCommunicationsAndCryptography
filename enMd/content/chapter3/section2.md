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




# The BB84 Protocol

After introducing the idea of QKD,
we present the first protocol, introduced in 1984 by Bennett
and Brassard and known as BB84 {cite}`BB84`. Recall that the goal
of the protocol is to establish a shared secret key, which is
later consumed to run the one-time pad. In
the case of BB84, the key is established as follows:

- Alice chooses randomly one of the four possible states
    ```{math}
    :label: bb84enc
    \ket{\pm x}=\frac{1}{\sqrt 2}(\ket 0\pm\ket 1)\quad
    \ket{\pm y}=\frac{1}{\sqrt 2}(\ket 0\pm i\ket 1) .
    ```
- The bit 0 (1) is encoded onto $\ket{+x}$ and $\ket{+y}$
($\ket{-x}$ and $\ket{-y}$). The vectors $\ket{\pm x}$ and
$\ket{\pm y}$ define the so-called $x$ and $y$ basis.
- Bob measures randomly in one of these two bases. He maps his result into a classical bit using the same convention as Alice.
- Alice and Bob announce the bases used in the preparation and measurement, respectively. In case the bases agree, the outputs produced by the protocol are kept, otherwise discarded. This process is known as basis reconciliation.

Note that if Alice and Bob's bases agree, their bits are perfectly
correlated. On the other hand, if the bases are different, Alice's
preparation and Bob's result are completely uncorrelated. Indeed,
assume that Alice has sent $\ket{\pm x}$ and Bob measures in the
$y$ basis. He will obtain the outcome corresponding to $\ket{\pm y}$
with probability $p(\pm y|\pm x)=|\langle \pm x\ket{\pm y}|^2=1/2$. 
This is equivalent to Bob discarding Alice's state and flipping a coin.
Therefore, after the basis reconciliation, Alice and Bob discard
all the bad instances and share a list of perfectly correlated
random bits. Before proceeding, note that Alice and Bob can use any pair of bases in the Bloch sphere satisfying the previous overlap condition. The $x$ and $y$ bases appeared in the original formulation of the protocol, but one could equally formulate it using the $x$ and $z$ bases. In fact, this choice is equivalent but often simpler in terms of notation.

Let us briefly analyze why Eve cannot break this protocol. She has
to interact with the quantum particle, say a photon, encoding the
information while it propagates to Bob. The no-cloning theorem
implies that she cannot make a perfect copy of it, forward the
first clone to Bob and keep the second one. She can however try to
measure the quantum state of the particle and read the
information. However, at this time in the protocol, she does not
know the basis chosen by Alice. Consider first that Eve measures
in the right basis. Then, she obtains all the information and can
prepare a new copy of the state to Bob. She obtains full
information about Alice's symbol and introduces no errors on Bob's
side. Now consider the case where Eve's measurement basis is
different from Alice's. Eve will obtain the right bit with
probability one half, which means that her information is zero. She now prepares a new state for Bob according to her measurement result, 
which may not be equal to the one sent by Alice. Focus now on the cases where Bob's basis is the
same as Alice's (after all, these are the only cases that are kept after the
basis reconciliation process). Since Eve has prepared a "wrong"
state, Bob will obtain the expected result with probability one
half. That is, Eve's strategy is introducing errors on Bob's side.
Alice and Bob can detect Eve's intervention by making public a
fraction of the symbols where their bases agree. If there are no
errors, it is very likely that nobody has tried to eavesdrop their
communication, and they can safely employ the remaining bits as
a secret key. If they see errors,
someone may be eavesdropping the channel, so they abort. Therefore,
what BB84 prevents is that an eavesdropper reads
the key Alice and Bob are exchanging without being
detected.

It is crucial for the security of the protocol that the channel is authenticated, that is, that Alice and Bob know to communicate to each other, for instance in the process of basis reconciliation. If this is not the case, Eve could separately run the protocol with Alice and Bob, establish two different secret keys with them, and hack the a posteriori communication. Alice and Bob therefore need to authenticate their channel, which is possible if they initially share a secret key. This introduces a form of circularity in the argument, but the main point is that the amount of secret key bits needed to authenticate the channels can be small. Once this is done and the QKD process has started, new generated key can be used when needed for authentication.

Operationally, this description of the protocol is far from complete. First, we have
analyzed a specific intercept and resend attack by Eve in which (i) she intercepts the sent qubits, (ii) measures them, and (iii) prepares a new state for Bob based on the obtained result. However the goal is to prove
the security of the protocol against any possible attack by Eve.
Second, from a practical point of view, it is useless to design a
protocol which is aborted whenever errors are seen. It would be
aborted in any realistic, and therefore noisy, implementation!
Fortunately, these two problems can be solved and one can design
general security proofs which are valid against any attack in a
noisy situation. In fact, the scope of a security proof is to show how Alice and Bob can distill a secret key in the presence of errors. 
We present the main ideas to build a general
security proof for QKD protocols below. But first,
we discuss other examples of protocols, showing that many variants are possible.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


