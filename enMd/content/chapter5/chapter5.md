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


# Security Proofs

The previous sections summarised some of the best-known
protocols for secure QKD and concluded with their general structure. The intuition for all of them is that
an attack by Eve introduces detectable errors in the channel. 
The intuitive argument then goes on by saying that Alice and Bob can monitor the
presence of these errors and stop the protocol, aborting the
eavesdropping attack. Clearly, while this intuition suggests that
the scheme may be secure, it is unacceptable when dealing with
practical implementations. In any realistic scenario, there will
be errors which are not due to Eve but are just a consequence of noise
in the channel and/or imperfections in Alice and Bob's labs.
Therefore, we cannot accept that Alice and Bob abort the protocol
whenever they observe errors.

The purpose of a security proof is to deal with a noisy scenario
and make QKD protocols implementable in practice. The main idea is
that Alice and Bob should conclude from the amount of observed
errors whether they can establish a secret key. 
They are able do this because in quantum theory it is
possible to put a bound on the information Eve has access to from
the amount of error (or correlations) between Alice and Bob. If
Alice and Bob have a small amount of error (large correlations), Eve has little
information. A security proof makes this trade-off quantitative.

In what follows we sketch the main steps in a
security proof. Our purpose is not to provide a detailed
derivation of these proofs, as they are usually quite technical
and involved, but to point out the main ideas and results used in
their derivation.



