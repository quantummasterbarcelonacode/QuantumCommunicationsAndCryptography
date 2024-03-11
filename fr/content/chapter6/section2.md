# The Photon-Number Splitting Attack

The replacement of single-photon states by weak coherent states seemed to offer a good compromise between feasibility and security. However this initial intuition was challenged by the so-called Photon-Number Splitting (PNS) attack, introduced in {cite}`PNS`. It considers a realistic implementation with weak coherent states and through a standard fibre, where losses are exponential with distance. The attack exploits the presence of losses and the fact that a weak-coherent state incidentally contains clones of the prepared state. To simplify the explanation of the attack, we consider a protocol in which Alice encodes the information in the polarisation of the prepared light states, but it equally applies to other encodings, such as the time bins explained above. The attack works as follows:

1) After the light state is prepared by Alice, Eve intercepts it and measures its number of photons in a non-destructive way, that is, if she measures $n$ photons she knows that the state has been projected into the $n$-photon state $\ket{n}$. Note that this measurement only looks at the number of photons, but does not perturb the degree of freedom used by Alice to encode the information, polarisation in our example. Eve gets result $n$ with probability $p(n)=e^{-|\alpha|^2} \mu^n/n!$, see Eq. {eq}`coherentstate`.

2) Depending on the measured number of photons:
    - If $n=0$, Eve does nothing.
    - If $n=1$, Eve blocks the state and does not forward anything to Bob.
    - If $n>1$, Eve keeps one of the $n$ photons in her quantum memory and forwards $n-1$ to Bob through a perfect noiseless fibre. 

3) Eve waits until the bases are announced and then measures the photon kept in her quantum memory, getting all the information about Alice's preparation.

In a noiseless realisation, this attack is noticed by Alice and Bob because Eve is blocking most of the pulses. However, if the losses are large, this attack remains unnoticed because Eve can perfectly simulate the lossy channel, getting all the information without being detected. This happens when she can simulate with the pulses she forwards through her perfect lossless fibres the expected rate by Bob, equal to $R_B=f\mu\eta_C$. If the coherent state is weak, the probability that Eve detects $n>1$ photons is basically the same as the one of detecting two photons, $\text{Pr}(n>1)\approx p(2)=e^{-\mu}\mu^2/2$, therefore the rate produced by her attack is of the order of $R_E\sim f\mu^2$, where constant terms were removed for simplicity. Equating the two rates, one has that the PNS attack is successful whenever $\mu^2\sim \mu\eta_C$, that is when the losses are of the order of the light intensity $\mu\sim\eta_C$. To prevent from this attack, Alice should choose the amplitude of her prepared states as a function of the channel losses: if the honest parties are connected by a channel with transmission $\eta_C$, Alice's weak coherent states should satisfy $\mu\lesssim\eta_C$. Therefore, the protocol rate is $R_B=f\mu\eta_C\sim\eta_C^2$, that is no longer linear but quadratic in $\eta_C$, which additionally limits the rates achievable at large distances.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

