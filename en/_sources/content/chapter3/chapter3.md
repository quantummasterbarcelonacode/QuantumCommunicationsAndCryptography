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


# Quantum Cryptography

The no-cloning theorem shows that QIT offers new possibilities but
also limitations to the way information on quantum states can be
processed. The derivation of this theorem is astonishingly simple. In fact, it turns out be connected to a better known
limitation of the quantum formalism: that the measurement process
perturbs the state of the system. Indeed, perfect cloning would
obviously violate the fact that the state of a single quantum
system cannot be perfectly known. If perfect cloning were
possible, one could know everything of the state of a single
particle without even measuring it, just by producing clones and
measuring these, leaving the initial state untouched. On the other hand, if perfect estimation was possible, 
one could easily clone by first perfectly measuring the state and then preparing as many copies of it as desired.

Remarkably, these limitations can be converted into something
positive, as beautifully demonstrated by quantum cryptography:
since the measurement process perturbs the state of a system, the
action of any adversary trying to read quantum information propagating
through a channel has a detectable effect on the sent
state. Or in other words, the action of the adversary, also known as
the eavesdropper, is limited by the impossibility of producing a
perfect copy of the quantum state. These two ideas lie at the
basis of any quantum cryptography protocol. In what follows, we
present several of the main results on quantum cryptography. More
precisely, we focus all our analysis on quantum key distribution.
This is the most advanced quantum cryptography application, both
from a theoretical and experimental point of view. However, it should
be made clear that "quantum cryptography" is a general term that
refers to any cryptographic protocol exploiting the quantum formalism.



