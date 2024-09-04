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




# Classical Communication

The problem of sending information in a reliable way through a noisy channel has a long history in classical information theory. There, a classical channel is described by a stochastic map $P(Y|X)$, describing how an input random variable $X$ is transformed into an output variable $Y$. The standard way of correcting channel errors is through *error correction*. 

As an example, consider the simple binary symmetric channel $P_\epsilon$ that flips a bit with probability $\epsilon$, that is, $P_\epsilon(Y=0|X=0)=P_\epsilon(Y=1|X=1)=1-\epsilon$ and $P_\epsilon(Y=0|X=1)=P_\epsilon(Y=1|X=0)=\epsilon$, which defines the error probability. Without losing generality, the error probability satisfies $\epsilon<1/2$. A very simple error correcting code exploits repetition: to transmit a bit $X$ to Bob, Alice sends its value three times through the channel, $X_1=X_2=X_3=X$. To define the value of his bit, Bob uses the majority of the received symbols, $Y=\text{maj}(Y_1,Y_2,Y_3)$. The new error probability is therefore $\epsilon'=3(1-\epsilon)\epsilon^2+\epsilon^3$, which is always smaller than $\epsilon$ when $\epsilon<1/2$.

This example showcases the main ideas of error correction. In general, Alice encodes $m$-bit strings $\vec X=(X_1,\ldots,X_m)$, called logical bits, into $2^m$ sequences of $n$ physical bits $\vec X'=(X'_1,\ldots,X'_n)$, the so-called codewords, through an $m\rightarrow n$ bit encoding map $\mathcal E$. In the previous example, Alice was encoding $m=1$ bits into 2 codewords of $n=3$ bits, namely $000$ and $111$.  On reception, the received message is the one resulting from applying the given channel $P(Y|X)$ to each of the symbols in $\vec X'$. Now, Bob decodes the information by mapping the received $n$-bit string $\vec Y'=(Y'_1,\ldots,Y'_n)$ into an $m$-bit string $\vec Y=(Y_1,\ldots,Y_m)$ through an $n\rightarrow m$ decoding map $\mathcal D$. The error probability for the full protocol is $P(\vec Y\neq\vec X)=\epsilon$ (note that $\epsilon$ now denotes the error probability after error correction). The goal of error correction is, for a given tolerable error $\epsilon$ and $n$ uses of the channel, to maximise the amount of sent bits $m$ over all the possible encoding and decoding maps. We denote this optimum by $m^*(n,\epsilon)$. Now, to understand the ultimate limit for reliable transmission, one should consider the asymptotic rate when the users have access to unlimited uses of the channel and the protocol attains vanishing error probability. This defines the (classical) capacity of the channel, 

```{math}
:label: capacity
C=\lim_{\epsilon\rightarrow 0} \lim_{n\rightarrow \infty}\frac{m^*(n,\epsilon)}{n} .
```

Remarkably, the value of the previous limit is known. Indeed, Shannon proved that the channel capacity $C$ is given by

```{math}
:label: shannoncapacity
C=\max_{P(X)} I(X:Y) ,
```

where $I(X:Y)$ is the mutual information of the joint distribution $P(X,Y)=P(X)P(Y|X)$, where the first term $P(X)$ is the one to be optimised, while the second $P(Y|X)$ is given by the channel. This result is impressive, as shows how a difficult limit involving $n$ uses of the channel can be computed by solving an optimisation problem involving a single use. This type of formula, known as a single-letter formula, gives the asymptotic performance of an object (in this case a channel) for a given task (in this case reliable communication) only in terms of a single copy of the object. This does not mean that the channel capacity can be attained by a single use of the channel, but that for its computation we only need to consider a single copy of it. In a practical situation, where one has access to a finite number $n$ of uses of the channel, one should design an error correction code involving codewords of finite length $n$ that gets as close as possible to the rate $C$. Another consequence of the previous result is that any channel in which the information sent by Alice is not totally erased, that is, any channel where $Y$ is not independent from $X$, $P(Y|X)\neq P(Y)$, can be used for communication. This follows from the fact that $I(X:Y)=0$ if, and only if, $P(X,Y)=P(X)P(Y)$.


