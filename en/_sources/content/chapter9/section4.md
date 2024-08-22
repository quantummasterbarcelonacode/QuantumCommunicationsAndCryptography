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



# Quantum Repeaters

The use of entanglement distillation enlarges the set of channels that allow for reliable quantum communication. Still, this is not the final solution. In fact, there exist states from which one cannot distill maximally entangled states. The simplest example is given by separable states: clearly no entanglement can be distilled from a non-entangled state. Moving to channels, there exist channels for which any output state is separable. These channels are called *entanglement breaking*, for obvious reasons. It is known that a channel $\Lambda$ is entanglement breaking if, and only if, the state obtained when applying the channel to half of a maximally entangled state is separable. A simple example of such a channel is given by the depolarising channel, Eq. {eq}`depchannel`, with $0\leq p\leq 1/3$. There are even channels that permit the distribution of entanglement, but the obtained entangled states cannot be distilled into maximally entangled states. These states are known as *bound entangled* states {cite}`horodecki`. Entanglement breaking channels, or channels that at most distribute bound entanglement have $\text{QC}^\leftrightarrow=0$. Beyond these more academic considerations, even for the purely lossy channel, and despite the fact that such a channel has in principle a positive quantum capacity for all losses, the quantum communication rate scales with the transmission of the channel, hence decreasing exponentially with the distance between Alice and Bob. In a realistic implementation, quantum communication becomes impractical after, say, a few hundred kms.

In fact, already in classical information theory, and despite the fact that all non-trivial channels have strictly positive quantum capacity, direct transmission becomes useless at some point. The solution lies in dividing the long lossy channel into segments in which to place nodes, or repeaters, that read the information, correct it and prepare a new perfect copy for the next node. If one literally followed this idea, one would need to place repeaters as soon as the channel does not allow quantum error correction, which would imply that repeaters would be needed after very short distances. The solution to that is then to combine the idea of repeaters with entanglement, leading to the concept of a *quantum repeater* {cite}`qrep`. The idea exploits many of the tools explained above, plus the protocol of entanglement swapping. Entanglement swapping considers the situation in which the teleportation protocol is applied to half of a maximally entangled state. This protocol is already discussed in the original teleportation paper {cite}`teleportation`, and expanded in {cite}`entswap`. Imagine the situation in which three parties share two maximally entangled states as follows: Alice shares a maximally entangled state $\ket{\Phi^+}_{AB_1}$ with Bob, who in turns shares another maximally entangled state $\ket{\Phi^+}_{B_2C}$ with Charlie. Now, if Bob teleports particle $B_1$ to Charlie using this second state, the entanglement is swapped and now Alice and Charlie share a state $\ket{\Phi^+}_{AC}$, while any entanglement with Bob is destroyed. Bob's measurement maps the entanglement he has with Alice and Charlie to direct entanglement between them.

The intuitive idea of a quantum repeater is as follows, see also {numref}`qrepfig`. Consider two distant parties connected by a very noisy channel for which direct quantum communication is impractical, or even impossible. Several intermediate stations, the so-called repeaters, are placed through the channel, so that the effective channel between any consecutive repeaters has a much better quality. Now, entangled states are distributed through the different nodes. Since the channels have a better quality, the resulting less noisy entangled states can now be distilled into maximally entangled states connecting all the nodes in the channel. The parties then perform entanglement swapping so that all the entangled pairs are now shared between the two end nodes, Alice and Bob. Finally, Alice and Bob use these pairs to reliably exchange quantum communication through teleportation. The protocol while theoretically appealing, is however very challenging, as the nodes need to perform operations on several qubits and store them in memories without decoherence while the protocol is executed. No demonstration of any repeater configuration, not even with one single repeater and in a lab environment, has been achieved yet, although several groups worldwide are intensively working on developing all the ingredients needed for that.

```{figure} ./QRepeater.png
---
height: 400px
name: qrepfig
---
Quantum repeaters: (i) Alice and Bob are connected by a very noisy channel $\Lambda_L$, where quantum communication is impractical or even impossible. (ii) Intermediate repeater stations are added, so that the resulting channel connecting different nodes, $\Lambda_{L'}$, has a much better quality and allow for the distribution of distillable entangled states. (iii) The parties use the channel $n$ times to distribute entanglement, resulting in $n$ copies of a mixed entangled state. (iv) These mixed states are distilled into $m$ maximally entangled states by LOCC. (v) The entanglement is mapped to the end nodes by means of entanglement swapping, so that reliable quantum communication is now possible through quantum teleportation.
```

Putting all these ideas together, we arrive at the concept of the *quantum internet* {cite}`kimble`, where different nodes will have quantum computers able to perform any quantum operations on their states and store them in quantum memories and exchange quantum bits though entanglement and teleportation. This is the ultimate goal of quantum communication.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

