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



# Ekert Protocol

In all the previous protocols, except the last one, entanglement
does not play any role: Alice prepares single-particle states
that are sent to and measured by Bob. In 1991, Artur Ekert proposed
a novel scheme for secure QKD that was based on entangled states
and a Bell inequality violation {cite}`Ekert`. Ekert was not aware of
the previous work by Bennett and Brassard, which appear in the
proceedings of a computer scientist conference. Actually, he
(re)discovered QKD in an independent way. However his approach to
the problem seemed to be completely different, based on the
Bell inequality violations produced by entangled states rather the the
non-orthogonality of quantum states.

The protocol by Ekert works as follows (we provide here a slightly
different version of his original protocol which is simpler but
conceptually equivalent): Alice and Bob receive correlated quantum
bits assumed to be in a maximally entangled state, say the state {eq}`bellstate`. 
Alice and Bob apply each the two measurements $A_1$,
$A_2$ and $B_1$ and $B_2$ given in {numref}`CHSHfig`, which
maximise the value of the CHSH inequality. Moreover Alice applies
a third measurement $A_3$ in the same direction as one of the
measurements by Bob, say $B_1$, to get perfectly correlated
outcomes. The idea is that the honest parties obtain a key from
$A_3$ and $B_1$, which are perfectly aligned, while computing the
CHSH value to guarantee that they share a maximally entangled state. In the ideal
case, this parameter should be equal to $2\sqrt 2$.

The intuition is that if the measurements by Alice and Bob lead to
a Bell inequality violation, there is no local hidden-variable model
reproducing the outcomes. This absence of local hidden-variable model
should guarantee the privacy of the obtained outcomes. In other
words, if Eve could predict the outcomes by the honest parties,
this would constitute a local hidden variable model for the
experiment. However this is impossible because the observed data
violate a Bell inequality violation. Clearly, this is only the
intuitive argument that led Ekert to the construction of this
protocol, but does not represent any security proof. 

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


