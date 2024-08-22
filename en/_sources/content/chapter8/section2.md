```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Device-Independent Quantum Key Distribution

We now have most of the ingredients needed to understand the structure of DIQKD protocols. It is important for what follows to understand that in the DI scenario there are two rather different types of players: the users and the provider. The users, Alice and Bob in our case, demand from the provider devices that produce some desired correlations $p(ab|xy)$ that must violate a Bell inequality. These correlations have a specific quantum realisation, but from the user's viewpoint this is not relevant, as they want to establish a secret key independently of the details of this realisation. The provider, however, does care about the realisation and has to prepare a state and measurements leading to the correlations requested by the user, otherwise the user will not buy the devices.

We start the discussion with the ideal case and the simplest scenario of binary inputs and outputs, $a,b,x,y=1,2$. To establish a secret key in the DI setting, Alice and Bob demand devices that produce the maximal quantum violation of the CHSH inequality, namely $\text{CHSH}=2\sqrt 2$. However, if one looks at the correlations attaining this value, there are no inputs of Alice and Bob with perfectly correlated outputs. This is why Bob requires a third possible value for his input, $y=3$, whose output is  now perfectly correlated to the output of one of Alice's inputs, say $x=1$. For these combinations of observables, the two results by Alice and Bob have the same probability, but they are identical, that is $\langle A_1\otimes B_3\rangle=1$. Inputs $x=1$ and $y=3$ will be the ones used to establish the secret key and, in fact, they have $I(A:B)=1$. This arrangement defines the so-called CHSH QKD protocol {cite}`diqkd`, where Alice uses one binary input to check the CHSH Bell inequality and another, $x=1$, to establish the secret key, and Bob has an input that takes three values, where two of them, $y=1,2$ are used to compute the CHSH inequality and the third, $y=3$, to establish the key with Alice. To compute Eve's information, Alice and Bob use the fact that there is basically only one way of getting the maximal violations of the CHSH inequality, which is the one in which Alice and Bob share a Bell state {eq}`bellstate` in which they perform the observables in {numref}`CHSHfig`. It follows from this result, that we are not going to prove, that the observation of $\text{CHSH}=2\sqrt 2$ implies that that shared state between Alice and Bob is a maximally entangled state of two qubits. Since this state is pure, Eve cannot be correlated, hence her information is zero, $\chi(A:E)=0$. The maximal violation of the CHSH inequality therefore certifies that Alice and Bob can establish a perfect secret key, that is a list of perfectly correlated bits, as $I(A:B)=1$, for which Eve has no information, $\chi(A:E)=0$.

What happens when devices are noisy and, therefore, cannot attain the maximal CHSH violation? As with standard QKD, one needs to derive a security proof that allows Alice and Bob to bound Eve's information from their observed correlations. Recall, however, that when deriving this bound, Alice and Bob should not make any assumptions on their devices, apart from the fact that they produce the observed correlations. Because of continuity, some noise tolerance is to be expected. The main question is whether this tolerance is reasonable and attainable in practical situations. The optimisation problem Alice and Bob have to solve is

```{math}
:label: DIHolevo
&&\max_{\rho_{AB},\{M_{a|x}\},\{M_{b|y}\}}\chi(A:E)\\
&&\text{such that }\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})=p(ab|xy) .\nonumber
```

This optimisation is performed over all possible attacks by Eve, that is, all states and measurements in all possible Hilbert spaces compatible with the observed correlations. Note that Eve's Holevo information is a function of the state shared by Alice and Bob and the performed measurements, as the state specifies the purification including Eve, $\ket{\psi}_{ABE}$, to which the measurements are applied to compute $\chi(A:E)$. The optimisation {eq}`DIHolevo` is in general very hard to solve. One can consider a weaker version of it in which only the observed violation of a Bell inequality, denoted by $\beta$, produced by the correlations between Alice and Bob is used as a constraint, that is, one replaces the constraints on the correlations by $\beta(p(ab|xy))=\beta_{\text{obs}}$. The resulting optimisation is again very hard, but it has been solved for the case of CHSH in {cite}`diqkd`. The solution is

```{math}
:label:
\chi(A:E)=h\left(\frac{1+\sqrt{(\text{CHSH}/2)^2-1}}{2}\right) ,
```

where $h(x)=-x\log_2x-(1-x)\log_2(1-x)$ is the binary entropy. This value allows us to compute key rates in the case of collective attacks, like in standard QKD protocols. The resulting rates are shows in {numref}`ratesfig`, together with those obtained for BB84. To make a fair comparison, everything is expressed in terms of the quantum bit error rate (QBER), which also affects the observed Bell inequality violation. The critical QBER, that is, the value for which the Devetak-Winter bound is equal to zero, for the CHSH protocol is $\text{QBER}\approx 7\%$, while it is equal to $\text{QBER}\approx 11\%$ for BB84. The robustness is smaller, as expected because in the DI scenario Eve has more available attacks, but the obtained value of the QBER is realistic and attainable in current experiments.

```{figure} ./Key_Rates.png
---
height: 400px
name: ratesfig
---
Rates for QKD protocols: Comparison of the Devetak-Winter bounds on the key rate obtained for the standard BB84 protocol, and the DIQKD protocol based on the CHSH Bell inequality, as a function of the QBER. The bound becomes zero for $\text{QBER}\approx 11\%$ and $\text{QBER}\approx 7\%$, respectively.
```

The previous discussion provides the main ideas behind DIQKD protocols and shows how it is possible for Alice and Bob to extract a key without making any assumptions on their devices when exploiting quantum correlations violating a Bell inequality. Recently, a general framework to prove the security of DIQKD protocol was obtained in {cite}`EAT`. DIQKD provides the strongest form of quantum security. Unfortunately, the realisation of DQIKD protocols is extremely challenging. As we have seen, in practice, Alice and Bob are connected by a lossy channel and Bell violations are very fragile against losses. This explains why, so far, there exist no commercial devices implementing DIQKD protocols and, in fact, lab demonstrations have only recently been achieved {cite}`diexp1,diexp2,diexp3`. Despite this progress, it remains as a challenging open problem to design ways of observing a Bell inequality violation between distant parties, which in turn can be exploited for secure DIQKD. 

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



