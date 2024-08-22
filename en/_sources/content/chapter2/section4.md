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


```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
```

# Bell's Theorem

Bell's theorem is arguably the strongest result showing the separation between classical and quantum physics (and the corresponding information theories). Historically, the whole discussion started with a celebrated article by Einstein, Podolsky and
Rosen (EPR) "Can Quantum-Mechanical Description of Physical Reality
Be Considered Complete?" {cite}`epr`, where they raised doubts about the
completeness of quantum theory as a local-realistic (LR) theory. Their argument was based on three requirements that any physical theory, according to EPR, should satisfy:

- “Locality”: Events in space-like separated regions cannot have
a (direct) causal relation.
- “Reality”: If, without disturbing a system in any way, we
can predict with certainty the value of a physical quantity,
then there exists an element of physical reality corresponding
to this physical quantity.
- “Completeness”: Every element of the physical reality must
have a counterpart in the physical theory.

All these conditions seem intuitively natural and hardly
restrictive. Einstein, Podolsky and Rosen argued that if quantum theory was local and realistic, then it could not be complete. They did not necessarily question the predictive power of quantum theory, but advocated for the existence of another theory, possibly with the same predictive power as quantum theory, but complete and hence more satisfactory. 

For years the EPR program was mainly a matter of
quasi-philosophical debate, until the work of J. Bell in 1964 {cite}`bell`. Bell's merit was to (i) identify a series of
conditions, the so-called Bell inequalities, that any LR theory
satisfies and (ii) provide a quantum experiment violating them.
Therefore, Bell was able to construct an experimentally verifiable
condition testing LR theories against quantum theory. The experimental
demonstrations of Bell inequality violations, from the pioneering demonstrations in {cite}`Aspect,exp1,exp2,exp3` to the most recent loophole-free experiments {cite}`hanson,nist,vienna`, definitively closed the EPR program. 

Here we present Bell's theorem through the best-known Bell inequality, the
so-called Clauser-Horne-Shimony-Holt (CHSH) inequality {cite}`CHSH`. In fact, this was not the inequality used by Bell to prove his theorem, but it is now the most used one and it provides the simplest demonstration of Bell's result. To do that, we follow a more modern and operational formulation of the problem, without making explicit use of the concepts of locality and realism. 

A Bell scenario is defined by two non-communicating observers, Alice and Bob, who receive two correlated systems from a source. The parties can perform $m$ possible measurements on their systems, each with $r$ possible outcomes. The performed measurements are labelled by $x,y=1,\ldots,m$ and the obtained results by $a,b=1,\ldots,r$, see also {numref}`CHSHfig`. By repeating the experiment several times, it is possible to compute the conditional probabilities $p(ab|xy)$ of observing the different results $(a,b)$ for each configuration of measurements $(x,y)$. Clearly, these probabilities are all positive and normalised, $p(ab|xy)>0$ and $\sum_{a,b}p(ab|xy)=1$ for all $(x,y)$. These probabilities define the observed statistics and are often dubbed *correlations*. What EPR called a LR model is given by correlations that can be written as local deterministic strategies specifying the output given the input and possibly correlated through the particles received from the source. These correlations read

```{math}
:label: lrmodel
p(ab|xy)=\sum_{\lambda}p(\lambda) ~ D_A(a|x\lambda) ~ D_B(a|x\lambda) ,
```

where $\lambda$ denote the instructions received from the source, possibly changing according to a probabilistic preparation $p(\lambda)$, while the functions $D_A$ and $D_B$ deterministically specify the output of each party given the input and these instructions. Note that these functions do not depend on the other party's input because it is assumed that the parties do not communicate. Also, note that if the value of $\lambda$ is known, which can be interpreted as the state prepared by the source, then it is possible to predict the measurement output in a deterministic way. It is natural to expect that, in nature, correlations between two non-communicating parties can always be expressed in this form.

```{figure} ./CHSH_Fig.png
---
height: 400px
name: CHSHfig
---
CHSH Bell inequality: Two
  parties measure two two-outcome observables, $A_1$
  and $A_2$ for Alice, and $B_1$ and $B_2$ for Bob. The choice of
  measurement is represented by a bit, $x$ for Alice and $y$ for Bob.
  The two possible
  outcomes are labeled by $\pm 1$. For the quantum violation, observables are replaced by quantum operators and they act on a two-qubit maximally entangled state.
```

The CHSH inequality {cite}`CHSH` is defined in the simplest Bell scenario in which the parties perform two measurements of two outputs, $m=r=2$, and the convention is to denote the performed measurement by $x,y=1,2$ and the obtained result by $a,b=\pm 1$. This convention is arbitrary but this choice simplifies the calculations. One then considers the following quantity:

```{math}
:label: CHSHdef
    \text{CHSH}=A_1B_1+A_1B_2+A_2B_1-A_2B_2 ,
```

where $A_x$ ($B_y$) denotes the measurement result by Alice (Bob) when implementing measurement $x$ ($y$). It is very simple to see that if the measurement results are deterministically fixed, that is for any assignments of $\pm 1$ to these values, the CHSH expression satisfies $|CHSH|=2$. This implies that even if the assignment changes according to a probabilistic preparation at the source $p(\lambda)$,  as in Eq. {eq}`lrmodel`, the expectation value of this expression always satisfies

```{math}
:label: CHSHineq
    \langle CHSH\rangle \leq 2.
```

Eq. {eq}`CHSHineq` is the famous CHSH inequality, whose mathematical derivation is astonishingly simple. The maximal violation of an inequality for LR models is called the local bound, equal to 2 for CHSH.

Let us now consider a quantum implementation of a CHSH Bell scenario in which the state prepared by the source is the two-qubit maximally entangled state 

```{math}
:label: bellstate
    \ket{\Phi^+}=\frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

and the measurements by each of the two parties are defined by the observables $A_1=\sx$, $A_2=\sz$, $B_1=(\sx+\sz)/\sqrt 2$ and $B_2=(\sx-\sz)/\sqrt 2$, see {numref}`CHSHfig`. After some calculations, it is possible to see that the quantum value of the CHSH expression for this configuration is 

```{math}
:label: tsirelson
    \langle \text{CHSH}\rangle =\langle A_1B_1\rangle +\langle A_1B_2\rangle +\langle A_2B_1\rangle -\langle A_2B_2\rangle =2\sqrt 2 > 2,
```

proving that quantum correlations do not have a description in terms of an EPR model {eq}`lrmodel`. The value $2\sqrt 2$ is the largest possible in quantum physics and is known as the Tsirelson bound {cite}`tsirelson`.

<!--\textbf{Exercise 1}: Compute the quantum value of each of the four terms $\langle A_x\otimes B_y\rangle$, with $x,y=1,2$, in the CHSH expression for the state {eq}`bellstate` and settings as in {numref}`CHSHfig` and verify that they sum up to $2\sqrt 2$.-->

`````{admonition} Exercise 1
:class: tip
Compute the quantum value of each of the four terms $\langle A_x\otimes B_y\rangle$, with $x,y=1,2$, in the CHSH expression for the state {eq}`bellstate` and settings as in {numref}`CHSHfig` and verify that they sum up to $2\sqrt 2$.
`````

The implications of this violation are huge. First of all, there is no LR
theory able to give a value of CHSH larger than 2, so either the predictions of quantum theory are wrong or the EPR program is not possible. Bell was thereby able to
map the EPR debate into a measurable condition. The only thing
left was to design the experimental situation for testing the
violation of any of these quantities. The rigorous experimental
verification of the violation of a Bell inequality came almost two
decades after Bell's seminal paper {cite}`Aspect`. Since then, other
experimental tests have been performed, all of who's results favored the
quantum formalism {cite}`hanson,nist,vienna`.

Two facts should be mentioned here. First, note that, although only
one inequality is presented here, there are many similar
conditions that characterize the set of probability distributions
achievable in a LR theory {eq}`lrmodel`. The fact
that quantum theory predicts the existence of correlations leading to a Bell inequality violation means that these quantum correlations cannot be written in this form.
Second, despite the fact that quantum theory predicts the violation of these
inequalities, no faster-than-light communication is allowed in the
quantum formalism. This would correspond to the case where Alice's measurement
could change Bob's measurement statistics. It is straightforward
to prove that this is not possible. Consider the situation where
Alice and Bob share a quantum state $\rho_{AB}$ on which they
apply measurements $\{M_{a|x}\}$ and $\{M_{b|y}\}$ so that

```{math}
:label: qcorr
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y}) .
```

The probability that Alice obtains outcome $a$ when she measures $x$ and Bob measures $y$ is
```{math}
:label:
    p_A\,(a|xy)=\sum_b p\,(ab|xy)=\sum_b\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})
    =\tr(\rho_{AB}M_{a|x}\otimes \one_B) =\tr(A_x\rho_A) ,
```

and we used that $\sum_b M_{b|y}=\one_B$ for all $y$ and where $\rho_A=\tr_B(\rho_{AB})$. Here $\tr_B$ is the partial trace over subsystem $B$. This means that Alice's local measurement statistics
cannot be affected by any measurement by Bob (and vice versa), as they do not depend on the implemented measurement $y$, so
no faster-than-light (in fact, instantaneous) communication is possible. 

<!--TODO Luke: I think this above section could be clearer, regarding the partial trace etc. -->

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```






