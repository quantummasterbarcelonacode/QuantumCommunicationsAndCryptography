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



# Implementations

While still challenging, QKD protocols are simpler to implement than other quantum information applications, such as quantum computers. This is because they "only" require the preparation of single-qubit states by Alice that are immediately sent to Bob, who measures them upon reception. The main challenge is that, for QKD protocols to be practical, the quantum state must travel over long distances. Therefore, QKD implementations have to deal with the problem of long-distance quantum communication. Light is the ideal carrier for that, so Alice should send her quantum states to Bob using light pulses at the quantum level. There are three main scenarios for QKD protocols in prepare-and-measure configurations:

- **Free-space transmission**: here, Alice and Bob exchange quantum states through free space. Polarisation is a convenient degree of freedom for the encoding. The main challenge is that single photons are very likely to be lost while propagating through the atmosphere because of the presence of particles. This solution is therefore adopted for some specific applications of short-distance secure communications, for instance between two buildings within a metropolitan area. 

- **Fibre optic transmission**: in our daily lives, fibre optics represent the most suitable means of transmitting light over long distances, which also holds true when dealing with light at the single-photon level. Polarisation is not very convenient in this case because it couples to other degrees of freedom through the propagation. A rather standard solution consists of encoding quantum information in different pulses shifted in time, also known as time-bin encoding. We discuss below some schemes using this encoding. Losses turn out to be again the main challenge. In a fibre optic, the probability (denoted by $\eta_C$) that a single photon is transmitted through the channel is exponential with the distance, $L$, so one has 

    ```{math}
    :label: channellosses
        \label{channellosses}
        \eta_C=e^{-\lambda L} .
    ```

    When this formula for the transmission coefficient is expressed in dB, $\eta_C=10^{-\lambda'L/10}$, typical values of $\lambda'$ are of the order of 0.2 dB/km. For instance, when $L=15$ km one has $\eta_C=10^{-0.2L/10}\approx 1/2$. Since losses increase exponentially with distance, at very long distances the rate of any protocol, that is the number of photons that Bob receives per second, is negligible and the protocol is of no use. Distances of, say, 200 km become impractical. This solution is therefore adopted only within metropolitan areas or close cities.
- **Satellite quantum communication**: this is the only viable solution for direct quantum transmission over long distances. Since the atmosphere density quickly decreases with altitude, this solution allows us to reach distances of the order of several hundreds of kms. The correct pointing of light from the satellite to the earth stations is challenging. And, of course, this solution is not cheap. 

Below, we also discuss schemes for entanglement-based long-distance quantum communication. These schemes can also be used for long-distance secure QKD, but they are much more complex and, in particular, go beyond simple prepare-and-measure direct transmissions. After this quick overview of the existing approaches, we now discuss several implementations of QKD in more detail. This is also useful to illustrate all the subtleties that appear when adopting QKD protocols to a practical scenario and how new security concerns appear in doing so.


