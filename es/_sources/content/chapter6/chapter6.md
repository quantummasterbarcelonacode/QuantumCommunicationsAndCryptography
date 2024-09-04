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



# Implementaciones

Aunque siguen siendo desafiantes, los protocolos de QKD (Quantum Key Distribution) son más simples de implementar que otras aplicaciones en información cuántica, como las computadoras cuánticas. Esto es porque "sólo" requieren la preparación de estados de un solo cúbit por parte de Alice, que son enviados inmediatamente a Bob, quien los mide al recibirlos. El principal desafío es que, para que los protocolos de QKD sean prácticos, el estado cuántico debe viajar largas distancias. Por lo tanto, las implementaciones de QKD deben lidiar con el problema de la comunicación cuántica a larga distancia. La luz es el portador ideal para eso, por lo que Alice debería enviar sus estados cuánticos a Bob usando pulsos de luz a nivel cuántico. Hay tres escenarios principales para los protocolos de QKD en configuraciones de preparación y medida:

- **Transmisión en espacio libre**: aquí, Alice y Bob intercambian un estado cuántico a través del espacio libre. La polarización es un grado de libertad conveniente para la codificación. El principal desafío es que los fotones individuales tienen una alta probabilidad de perderse mientras se propagan por la atmósfera debido a la alta presencia de partículas. Por lo tanto, esta solución se adopta para aplicaciones específicas en comunicación segura a cortas distancias, por ejemplo, entre dos edificios dentro de un área metropolitana.

- **Transmisión por fibra óptica**: en nuestra vida cotidiana, las fibras ópticas representan el medio más adecuado para transmitir luz a largas distancias, lo cual también es válido cuando se trata de luz a nivel de fotón único. La polarización no es muy conveniente en este caso porque acopla otros grados de libertad durante la propagación. Una solución bastante estándar consiste en codificar la información cuántica en diferentes pulsos desplazados en el tiempo, también conocido como codificación en bloques temporales. A continuación, discutimos algunos esquemas que utilizan esta codificación. Las pérdidas resultan ser nuevamente el principal desafío. En una fibra óptica, la probabilidad (denotada por $\eta_C$) de que un fotón único sea transmitido por el canal es exponencial con la distancia, $L$, por lo que tenemos que

    ```{math}
    :label: channellosses
        \label{channellosses}
        \eta_C=e^{-\lambda L} .
    ```

    Cuando esta fórmula para el coeficiente de transmisión es expresada en dB, $\eta_C=10^{-\lambda'L/10}$, los valores típicos de $\lambda'$ son del orden de los 0.2 dB/km. Por ejemplo, cuando $L=15$ km uno tiene que $\eta_C=10^{-0.2L/10}\approx 1/2$. Dado que las pérdidas incrementan exponencialmente con la distancia, a distancias muy largas, la tasa de cualquier protocolo, es decir, el número de fotones que Bob recibe por segundo, es insignificante y el protocolo no tiene utilidad. Distancias de, digamos, 200 km se vuelven imprácticas. Por lo tanto, esta solución sólo se adopta en áreas metropolitanas o ciudades cercanas.

- **Comunicación cuántica satelital**: esta es la única solución viable para la directa transmisión cuántica a largas distancias. Dado que la densidad de la atmósfera decrece rápidamente con la altitud, esta solución nos permite alcanzar distancias del orden de varios cientos de kilómetros. La correcta alineación desde el satélite hacia estaciones terrestres es un desafío. Y, por supuesto, esta solución no es barata.

A continuación, discutiremos esquemas para la comunicación cuántica a largas distancias basadas en el entrelazamiento. Estos esquemas también pueden usarse para QKD seguro a largas distancias, pero son mucho más complejos, y en particular, van más allá de la simple transmisión directa usando preparación y medida. Después de esta breve descripción general de los enfoques existentes, discutiremos varias implementaciones de QKD en más detalle. Esto también es útil para ilustrar todas las sutilezas que aparecen al adoptar protocolos de QKD en un escenario realista y cómo surgen nuevas preocupaciones sobre la seguridad al hacerlo.


