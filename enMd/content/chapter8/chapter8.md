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



# The Device-Independent Scenario

The solution to the previous hacking attacks is provided by the so-called device-independent (DI) scenario {cite}`diqkd`. In this approach, quantum devices are seen as black boxes with which the users can interact, providing a classical input and getting a classical output. The DI approach is quite general and can, in fact, can be applied to any quantum information protocol, but in what follows we focus on QKD. 

As said, in the DI scenario devices are seen as quantum black boxes processing a classical input to produce a classical output. It is assumed that the input-output process in a given device takes place locally, meaning it is not causally influenced by what happens in the other devices. This can for instance be enforced by synchronising the devices so that these input-output processes define space-like separated events and there is therefore no time for any signal, not even those propagating at the speed of light, to go from one device to another. However, there may be other ways of enforcing this no-communication assumption.  In a QKD context, Alice and Bob have one device each, see {numref}`difig`. Without loss of generality, we assume that their inputs, labelled by $x$ and $y$, can take $m$ possible values and their outputs, labelled by $a$ and $b$, can take $r$ possible results, that is $x,y=1,\ldots,m$ and $a,b=1,\ldots,r$. Alice and Bob test their devices using different inputs, collecting the statistics they generate. This is encapsulated by the conditional probability distribution $p(ab|xy)$, which gives the probability that Alice and Bob observe result $a$ and $b$, respectively, when they use inputs $x$ and $y$. We therefore have a list of $m^2r^2$ real numbers such that $p(ab|xy)\geq 0$ and $\sum_{ab}p(ab|xy)=1$ for all $x$ and $y$. This conditional probability distribution is also dubbed as *correlations*. The goal of a DIQKD protocol is to conclude from these observed correlations, and from them alone, that the parties can distill a secret key. If this is the case, there cannot be any mismatch between modelling and implementation. This is because no modelling is made on these devices, apart from the fact that whatever happens inside to produce the output given the input should be compatible with the quantum laws.

```{figure} ./Correlations.png
---
height: 400px
name: difig
---
Device-independent scenario: Alice and Bob model their devices as quantum black boxes producing a classical output given a classical input. The description of the setup is by means of the observed statistics, given by the conditional probability distribution $p(ab|xy)$. There are three main sets of physical correlations: classical, quantum and non-signalling. The first one is strictly includes in the second that, in turn, is also strictly included in the third.
```

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


