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




# Long-Distance Quantum Communication

In the last part of the notes, we focus on the problem of long-distance quantum communication or, more generally, how to reliably send quantum information through a noisy channel. The scenario is quite similar to what discussed until now, with Alice and Bob in distant locations connected by a quantum channel. However, the goal is now to send quantum information, not to distribute a secret key. Therefore, we do not need to include Eve in the study. 

In the considered scenario, it is assumed that Alice and Bob can perform any type of quantum operations locally and can communicate classical information without any errors. This set of operations is called LOCC, for Local Operations and Classical Communication. The users can exchange quantum states, but only through a noisy channel described by a completely-positive trace-preserving (CPTP) map, $\Lambda$. The goal is to characterise the maximum amount of qubits that can be reliably sent from Alice to Bob as a function of the number of uses of the channel. A formal definition will be provided in this section.



