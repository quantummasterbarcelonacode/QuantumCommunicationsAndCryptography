
# SARG Protocol

The PNS attack was an important limitation for QKD implementations, but several solutions appeared after its formulation, the first one is given by the Scarani-Acin-Ribordy-Gisin (SARG) protocol {cite}`SARG`, which shows how a simple change in the way information is processed in a BB84 implementation using weak coherent states diminishes the impact of PNS attacks. In SARG, Alice prepares the same four states as in BB84, and Bob also makes the same two measurements. Therefore, at the quantum level, both protocols are identical and there is no need to change any quantum hardware to shift from BB84 to SARG.  Alice however encodes her bit as shown in {numref}`SARGfig`: bit $0$ ($1$) is encoded on $\ket{\pm z}$ ($\ket{\pm x}$), that is, the basis encodes the bit.

Let's now see how Alice and Bob make the reconciliation after the states have been prepared and measured. Alice announces the actual sent state and one of its neighbours in the Bloch sphere. For instance, if she has encoded bit $0$ in the state $\ket{+z}$ she announces this state and one of the two states $\ket{\pm x}$. Without losing generality, let's assume that she announces $(+z,+x)$. Is there a situation in which Bob can deterministically conclude which state Alice was sending from his implemented measurement and result? If Bob measures in the $z$ basis, he will get the result $+1$ with probability one. This output is however compatible with the two states announced by Alice, hence Bob cannot reach an unambiguous discrimination and this instance is discarded. When Bob measures in the $x$ basis, he can get the two possible results with probability $1/2$. If he gets $+1$, this result is again compatible with the two announced states so this instance is discarded. However, if he gets $-1$, Bob concludes that the sent states was not $\ket{+x}$, so it has to be $\ket{+z}$, that is, Alice is encoding a $0$. Note that the symbols that are kept after this reconciliation are, on average, half of those in which Alice and Bob use different bases. So, in an ideal situation with no losses and single-photon states, this protocol is worse than BB84. 

```{figure} ./SARG.png
---
height: 400px
name: SARGfig
---
SARG encoding: In the SARG protocol, Alice prepares the same states as in BB84, but the encoding is different. Now, the sent bit is encoded in the prepared basis.
```

The main advantage of the protocol appears when implementing it with weak coherent states because of its robustness against PNS attacks. Recall that the leading order of the attack is given by pulses in which Alice prepares two photons, with probability $p(2)$. In these cases, Eve keeps one photon and waits until the reconciliation to measure her particle. However, in SARG, and contrary to what happens in BB84, Eve has to distinguish between non-orthogonal states, $\ket{+x}$ and $\ket{+z}$ in the previous example, so she cannot perfectly distinguish them and she cannot have full information. It is beyond the scope of the present notes, but it can be proven that for the SARG protocol, and actually for any protocol employing the four BB84 states, Eve can apply another type of PNS attack which gives her full information when using the pulses with three photons. This attack therefore works whenever $p(3)\sim\eta_C\mu$, which gives $\mu^2\sim\eta_C$. Or, in other words, the rate for SARG scales as $R_B\sim \eta_C^{3/2}$, an intermediate scaling between the noiseless case and BB84. 

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


