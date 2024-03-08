```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Hacking Attacks

All the previous discussion shows that security loopholes appear when moving theoretical protocols to the implementation. However, the existence of PNS attacks could not be a priori discarded, because there was no security proof for a weak-coherent state BB84 implementation and large losses. The attacks in fact proved that such a proof was impossible. And the main merit of decoy-state protocols was that a full security proof for them could be established in an implementation with losses and weak coherent states. This proof seemed to end the discussion.

In 2010, however, several successful hacking attacks were reported on QKD commercial implementations for which, a priori, there was a security proof. Vadim Makarov was one of the most active researchers in these quantum hacking efforts {cite}`Makarov`. In the considered BB84 implementation, the last step on Bob's side consisted of sending the received light pulse into a polarised beamsplitter and detect the output modes, see {numref}`hackingfig`. The hackers modified the working of the detectors on Bob's side by injecting some light into his devices. With this attack, the detectors were no longer sensitive to single photons, but give a click whenever the received light intensity was above a given threshold, $I_{\text{th}}$. Once Eve has modified the working of the detectors, Eve measures the states produced by Alice in a random basis, say $z$, in a given round. She then prepares a new state equal to her result, say $\ket{+z}$, encoded on a light pulse of intensity $I_{\text{th}}<\mu_E<2I_{\text{th}}$  and sends it to Bob through a lossless channel (equivalently, she encodes her bit on a pulse with intensity equal to $\mu_E/\eta_C$, so that what arrives on Bob's side has the right intensity equal to $\mu_E$). Now, if Bob chooses the same measurement as Eve, the pulse will be deterministically sent to one of the two detectors on Bob's side, keeping its intensity above the threshold, and being then detected with the same result as Eve's preparation. If however Bob chooses a different basis than Eve, the coherent state is divided into two pulses of intensities below the threshold and no detection is produced. Bob announces that the photon was lost during the propagation and these rounds are discarded. In total, half of the rounds are discarded, but for those that are kept and later pass basis reconciliation, Alice, Bob and Eve bases agree. Therefore, Eve's attack provides her will full information and her attack does not interfere with Alice's measurement or Bob's preparation. Of course this attack only works if losses are larger than $1/2$, but this is always the case after, approximately, more than 15 kms of optical fibre. 

```{figure} ./Hacking.png
---
height: 400px
name: hackingfig
---
Hacking attack: Eve injects light on Bob's devices so that they are not sensitive to the incoming photons, but they give a result whenever the incoming light intensity is above the threshold $I_{\text{th}}$. In the attack, Eve measures the state sent by Alice and prepares a new coherent state for Bob equal to her measurement result and with intensity $I_{\text{th}}<\mu_E<2I_{\text{th}}$. If Bob and Eve bases agree, all the light pulse is sent to a detector, giving the prepared result. If the bases disagree, the incoming light pulse is divided into two pulses with intensity below the threshold and giving no detection.
```

The hacking attacks were very important because it became understood that  certifying the security of a quantum implementation is subtler than initially thought. Recall that, in principle, there was a mathematical security proof for the hacked protocol. Was this proof wrong? Or were the hackers able to violate a quantum law and then break the protocol? The answer to these questions is negative and what actually happened was that the implementation did not meet the assumptions needed to prove security. There was a mismatch between the theoretical modelling of the experiment and its implementation, which was exploited by the hackers. The security proof was derived under the assumptions of the model, but if the model is not perfectly accurate in describing the experiment, the obtained security proof does not apply to the implementation, which becomes potentially insecure. 

To better understand this point, let us consider again the BB84. In its formulation, Alice and Bob prepare the eigenstates of $\sx$ and $\sz$ and Bob measures these observables. These are all operators acting on qubit space, $\compl^2$. When thinking of an implementation, it is fundamentally impossible to guarantee that any physical system strictly lives in a Hilbert space of dimension two. Therefore, if the assumptions of the protocol are not met, the security proof does not apply. For instance, consider the situation in which  Alice encodes the qubit in a single-photon state with frequency $\omega_0$. However, let us assume that there is a small imperfection on Alice's devices and whenever she encodes in the $x$ basis, she is slightly shifting this frequency to $\omega'_0=\omega_0+\delta\omega$. If Eve notices this imperfection, all what she needs to do to hack the protocol is (i) first measure the frequency of the single-photon state leaving Alice's lab and (ii) measure in the $z$ ($x$) basis if the measured frequency is $\omega_0$ ($\omega_0+\delta\omega$). She then gets all the information and her attack gets unnoticed. Clearly, this attack can be avoided if Alice initially calibrates her device and corrects this shift, but this won't be the case if the sensitivity of Alice's calibration devices is larger than $\delta\omega$, while Eve's devices can discriminate this frequency shift. Note that the previous four states give very good approximations to the four BB84 states, but they are not identical. In fact, they act on a four-dimensional vector space, spanned by $\{\ket{\pm z,\omega_0},\ket{\pm x,\omega'_0}\}$, hence violating the initial assumption used in the security proof that all the states span a two-dimensional space. To strengthen the security Alice and Bob can try to detect and correct all possible errors of this type and enforce that the gap between the model and the implementation is minimal. In fact, after the hacking attack was announced, the QKD providers corrected the detector in such a way that the specific attack of {cite}`Makarov` was no longer possible. However, how can we ensure that no attack exploiting devices' imperfections is possible, especially if we take into account that some assumptions in standard QKD protocols, such as the Hilbert space dimension, are untestable?

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



