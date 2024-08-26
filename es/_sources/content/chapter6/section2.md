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


# El Ataque de División del Número de Fotones

La sustitución de estados de fotones individuales por estados débilmente coherentes parecía ofrecer un buen balance entre implementabilidad y seguridad. Sin embargo, esta intuición inicial fue cuestionada por el llamado ataque de División del Número de Fotones (Photon-Number Splitting, PNS), introducido en {cite}`PNS`. Este ataque considera una implementación realista con estados coherentes débiles a través de una fibra estándar, donde las pérdidas son exponenciales con la distancia. El ataque explota la presencia de pérdidas y el hecho de que un estado coherente débil contiene incidentalmente clones del estado preparado. Para simplificar la explicación del ataque, consideramos un protocolo en el que Alice codifica la información en la polarización de los estados de luz preparados, aunque también se aplica a otros métodos de codificación, como los bloques temporales explicados anteriormente. El ataque funciona de la siguiente manera:

1) Después de que Alice prepara el estado de luz, Eve lo intercepta y mide el número de fotones de manera no destructiva, es decir, si mide $n$ fotones, sabe que el estado ha sido proyectado en el estado de $n$ fotones $\ket{n}$. Cabe destacar que esta medición solo observa el número de fotones, pero no perturba el grado de libertad utilizado por Alice para codificar la información, en nuestro ejemplo, la polarización. Eve obtiene el resultado $n$ con una probabilidad $p(n)=e^{-|\alpha|^2} \mu^n/n!$, ver Ec. {eq}`coherentstate`.

2) Dependiendo del número de fotones medidos:
    - Si $n=0$, Eve no hace nada.
    - Si $n=1$, Eve bloquea el estado y no envía nada a Bob.
    - Si $n>1$, Eve retiene uno de los $n$ fotones en su memoria cuántica y envía $n-1$ a Bob a través de una fibra perfecta libre de ruido.

3) Eve espera hasta que las bases sean anunciadas y luego mide el fotón retenido en su memoria cuántica, obteniendo toda la información sobre la preparación de Alice.

En una implementación sin ruido, Alice y Bob notarían este ataque porque Eve está bloqueando la mayoría de los pulsos. Sin embargo, si las pérdidas elevadas, este ataque pasa desapercibido porque Eve puede simular perfectamente el canal con pérdidas, obteniendo toda la información sin ser detectada. Esto ocurre cuando ella puede simular con los impulsos que transmite a través de sus fibras perfectas sin pérdidas la tasa esperada por Bob, igual a $R_B=f\mu\eta_C$. Si el estado coherente es débil, la probabilidad de que Eve detecte $n>1$ fotones es básicamente la misma que la de detectar dos fotones, $\text{Pr}(n>1)\approx p(2)=e^{-\mu}\mu^2/2$, por lo tanto, la tasa producida por su ataque es del orden de $R_E\sim f\mu^2$, donde los términos constantes se han eliminado para simplicidad. Igualando las dos tasas, se tiene que el ataque PNS es exitoso siempre que $\mu^2\sim \mu\eta_C$, es decir, cuando las pérdidas son del orden de la intensidad de la luz $\mu\sim\eta_C$. Para prevenir este ataque, Alice debe elegir la amplitud de sus estados preparados en función de las pérdidas del canal: si las partes honestas están conectadas por un canal con transmisión $\eta_C$, los estados coherentes débiles de Alice deben satisfacer $\mu\lesssim\eta_C$. Por lo tanto, la tasa del protocolo es $R_B=f\mu\eta_C\sim\eta_C^2$, la cual ya no es lineal, sino cuadrática en $\eta_C$, lo que limita adicionalmente las tasas alcanzables a largas distancias.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

