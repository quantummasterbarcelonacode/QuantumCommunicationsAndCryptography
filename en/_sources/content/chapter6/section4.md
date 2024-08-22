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



# Decoy-State Protocols

The final solution to PNS attacks was provided by Hwang {cite}`decoy` in the form of the so-called decoy-state protocols. In their simplest version, Alice chooses randomly whether to encode her bit in a weak coherent state with intensities $\mu_1$ or $\mu_2$. Experimentally, this is not particularly difficult, all what Alice needs to do is to modulate the light intensity. She sends the state to Bob who measures it as expected in a BB84 implementation. At the end of the protocol, Alice also announces the amplitude she actually used in the encoding, so that Bob can estimate the rate of received photons in the two cases, $R_B^{(1)}$ and $R_B^{(2)}$. In what follows, we show how the use of two amplitudes allows the honest party to detect Eve when she implements the standard PNS attack. This is not a full security proof, but it illustrates the main ideas in the protocol.

In the absence of Eve, when Alice and Bob are connected by a purely lossy fibre, the two rates are $R_B^{(i)}=f\mu_i\eta_C$, for $i=1,2$. So the ratio between these two amplitudes is equal to the ratio of the coherent-state amplitudes, $R_B^{(1)} /R_B^{(2)}=\mu_1/\mu_2$. When Eve implements the PNS attacks, the rates obtained are basically given by the two-photon pulses, so one has $R_B^{(i)}\sim p_2^{(i)}\sim\mu_i^2$. Therefore, if Eve applied the attack, Alice and Bob would notice an unexpected ratio between the two rates, which would now scale like the square of the ratio of the intensities and not like the ratio itself. In such case, Alice and Bob stop the insecure communication. Adding more intensities makes Eve's life even harder and it can be proven that the expected rate tends to the ideal one proportional to $\eta_C$. 

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

