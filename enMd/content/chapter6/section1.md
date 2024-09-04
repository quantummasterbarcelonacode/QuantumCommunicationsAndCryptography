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




# BB84 with Time-Bin Encoding and Weak Coherent States

Time bins represent one of the most popular solutions to send quantum information over long distances. In principle, the idea is to prepare single-photon states and send them through a fibre coupler with a given transmission $T$.  The two paths have different lengths and are recombined. A phase shift $\varphi$ is applied to one of the two paths, say the longer one, see {numref}`timebin`. By playing with the transmission of the coupling and the phase, it is in principle possible to prepare any qubit state, as one has $\ket\psi=\sqrt T\ket s+\sqrt Re^{i\varphi}\ket{\ell}$. In practice, changing the transmission of the first coupler is more demanding than changing the applied phase, so one often employs a fixed transmission given by $T=1/2$. Also, recombining the two paths in a deterministic way is also challenging, so one often uses another coupler again with transmission $1/2$. This simpler process therefore prepares any state $\ket\psi=(\ket s+e^{i\varphi}\ket{\ell})/\sqrt 2$, that is, any state in the equator of the Bloch sphere defined by $\ket s$ and $\ket{\ell}$, with some probability. This is however sufficient to implement the BB84 protocol through the scheme in {numref}`timebin`.

<!--Luke: Maybe we should mention that R is just the coefficient normalizing the state based on T?-->

```{figure} ./TimeBin.png
---
height: 400px
name: timebin
---
Time-bin qubits: Quantum information is encoded in a single-photon state that can be in different temporal modes. Upper part: in the ideal situation, the transmission coefficient of the first coupler can be freely chosen. The second coupler first reflects the photon when it takes the short path, and then transmits when the photon takes the long path, resulting in the deterministic preparation of an arbitrary qubit state. In practice, it is much simpler to act with couplers of fixed transmission $T=1/2$. While photons may take the wrong path at the second coupler, this does not affect the protocol performance because only those cases in which Bob detects a photon will be kept, effectively discarding all the situations in which the photon was lost at the second coupler.  Lower part: time-bin implementation of BB84 protocol.
```


For that, Alice prepares the four possible BB84 states $\ket{\pm x}$ and $\ket{\pm y}$ through the previous arrangement and by choosing a phase $\varphi_A=0,\pi$ for $\ket{\pm x}$ and $\varphi_A=\pm\pi/2$ for $\ket{\pm y}$. These states are sent to Bob, who applies the *same* interferometric arrangement and detects which path the photon takes at the end of the process. As it will become clear below, $\varphi_B=0$ ($\varphi=\pi/2$) corresponds to a measurement in the $x$ ($y$) basis. It is also important to keep in mind that only those events where Bob detects a photon are kept, all the rest are discarded. If we denote by $T$ the time it takes the photon to go from Alice to Bob, and by $\Delta T$ the time shift between the two arms of the interferometer at each side, there are three possible values for the time $T_B$ at which a photon detection on Bob's side occurs:

- $T_B=T$: the photon took the short path in both interferometers. It can be detected in any of the two detectors with probability $1/2$. These events are discarded.
- $T_B=T+2\Delta T$: the photon took the long path in both interferometers. It can be detected in any of the two detectors with probability $1/2$. These events are discarded.
- $T_B=T+\Delta T$: there is interference between the two possibilities in which the photon first took the short and then long path, and viceversa. Crucially, this interference, and hence the probability of observing the photon in one or the other detector, depends on the phase difference applied by Alice and Bob. This is the interesting case that is used to generate the key.

Note that to define these arrival times, Alice and Bob should share a time reference, that is, Bob should know when to expect the arrival of the photons prepared by Alice.

In the implementation, Bob only keeps those events in which one of the two detectors click at $T_B=T+\Delta T$, while all the other events are discarded. Let's compute the probability of observing a click in one of the detectors at this time. There are only two possible events that can contribute: (i) Alice's photon takes the short arm, is sent to Bob, and then takes the long arm or (ii) Alice's photon takes the long arm, is sent to Bob, and then takes the short arm. Quantum physics tells us that to compute the corresponding probability, we should sum the probability amplitudes of these two events. To do so, we work on second quantization and introduce the creation and annihilation operators for each mode, which we denote by $a$, instead of the more standard notation $a^\dagger$, to simplify the notation. Note that we will work with non-normalized states. A one-photon state $\ket{1}$ is then written as $\ket 1=a\ket 0$, where $\ket 0$ is now the vacuum state of the electromagnetic field (none of these states should be confused with the elements of the computational basis).

The state leaving Alice's lab is $(a_s+e^{i\varphi_A}a_\ell)\ket 0$, that is, the superposition of a photon that took the short and the long arm, with the corresponding phase. To further simplify the notation, we omit the vacuum state. The state arriving to Bob's last coupler at time $T+\Delta T$ are $a_{s\ell}e^{i\varphi_B}+a_{\ell s}e^{i\varphi_A}$, where $a_{\ell s}$ ($a_{s\ell}$) is the creation operator for the photon that first took the long (short) and then short (long) paths. The coupler is nothing but a standard balanced beamsplitter, with transmission coefficient $T=1/2$. It is well-known that a balanced beamsplitter transforms the input modes $a_1$ and $a_2$ into the output modes $b_1$ and $b_2$ as follows:

```{math}
:label: beamsplitter
    \begin{pmatrix}b_1 \\b_2 \\\end{pmatrix} =     \begin{pmatrix}\frac{1}{\sqrt 2} & \frac{1}{\sqrt 2} \\\frac{1}{\sqrt 2} & -\frac{1}{\sqrt 2} \\\end{pmatrix} \begin{pmatrix}a_1 \\ a_2 \\\end{pmatrix} .
```

In the considered setup, we should apply this transformation to the input modes of the last beamsplitter, $a_{\ell s}$ and $a_{s\ell}$, while the output modes correspond to the photons going to the two detectors, which we denote by $d_1$ and $d_2$. One therefore has

```{math}
:label: 
(d_1+d_2)e^{i\varphi_B}+(d_1-d_2)e^{i\varphi_A}. 
```

This implies that the probabilities of observing the photon in the detectors are, after restoring normalisation,

```{math}
:label: 
\text{Pr}(d_1 \text{ clicks})&=&\frac{|e^{i\varphi_A}+e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}+e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1+\cos(\varphi_A-\varphi_B)}{2} \nonumber\\
\text{Pr}(d_2 \text{ clicks})&=&\frac{|e^{i\varphi_A}-e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}-e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1-\cos(\varphi_A-\varphi_B)}{2} .
```

When Alice and Bob bases agree and are equal to $z$, corresponding to $\varphi_A=0,\pi$ and $\varphi_B=0$, then the first detector deterministically clicks when Alice prepare $\ket{+z}$, corresponding to $\varphi_A=0$, while the second does it for $\ket{-z}$, corresponding to $\varphi_A=\pi$. It is easy to see that the same is observed for $\varphi_A=\pm\pi/2$ and $\varphi_B=\pi/2$. When the bases do not agree, say $\varphi_A=0$ and $\varphi_B=\pi/2$, the two detectors click with the same probability, $\text{Pr}(d_1 \text{ clicks})=\text{Pr}(d_2 \text{ clicks})=1/2$. One therefore obtains the same correlations between Alice's preparations and Bob's measurements as in the BB84 protocol, as announced.

The implementation of this scheme is still quite demanding because it requires the preparation of single-photon states. Despite tremendous progress in single-photon sources, this is still an expensive and challenging device. To overcome this problem, Alice replaces single-photon states by weak coherent states. Recall that a coherent state is given by the following superposition of photon-number states:

```{math}
:label: coherentstate
\ket\alpha=e^{-|\alpha|^2/2}\sum_n \frac{\alpha^n}{\sqrt{n!}}\ket n=\sum_n p(n)\ket n,
```

where $\alpha$ is an arbitrary complex number, $\alpha=\alpha_x+i\alpha_p=|\alpha|e^{i\phi}$. The phase of the coherent state is $\phi$, while its intensity, which we denote by $\mu$, is equal to $\mu=|\alpha|^2$. In fact, note that the average number of photons in the pulse is 

```{math}
:label:
\langle n\rangle=e^{-|\alpha|^2}\sum_n \frac{\alpha^{2n}}{n!} n = \mu.
```

Coherent states are very easy to prepare, because they describe the state of a conventional laser. So, Alice can approximate the required single-photon state by an attenuated coherent state, where $\mu<1$. Up to normalisation, an attenuated coherent state is approximately equal to $\ket 0 + \alpha\ket 1$, that is, a superposition of vacuum and single-photon states. Now, the idea is that, since Bob is going to keep only those cases in which he detects light, this effectively projects the coherent state into the single-photon component, as the vacuum state cannot give any click on Bob's side. In other words, the coherent state sort of behaves like the single-photon state for those events where Bob detected light. We therefore have all the ingredients for a feasible implementation of BB84 and, in fact, most of the commercial devices running this protocol are based on fibre interferometers, weak coherent states and light detectors.

The rate at which these protocols work can be estimated as follows. Coherent states are prepared with a repetition rate that we denote by $f$. They propagate through the channel with transmission $\eta_C$, see Eq. {eq}`channellosses`. The rate of detected photons therefore goes like $R_B=f\eta_c\mu$. Up to the terms $f$ and $\mu$, fixed in the preparation, the rate is proportional to $\eta_C$, that is, exponential with the distance. This is not the final key rate, which will depend on the key distillation process (basis reconciliation, error correction, privacy amplification,...), but it captures the order of magnitude of the protocol rate.




