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



# Repetidores Cuánticos

El uso de la destilación de entrelazamiento amplía el conjunto de canales que permiten una comunicación cuántica confiable. Sin embargo, esto no es la solución definitiva. De hecho, existen estados de los cuales no se pueden destilar estados de entrelazamiento máximo. El ejemplo más simple son los estados separables: claramente, no se puede destilar entrelazamiento de un estado no entrelazado. Al hablar de canales, existen canales para los cuales cualquier estado de salida es separable. Estos canales se denominan *canales que rompen el entrelazamiento*, por obvias razones. Se sabe que un canal $\Lambda$ rompe el entrelazamiento si, y solo si, el estado obtenido al aplicar el canal a una de las mitades del estado maximalmente entrelazado, es separable. Un ejemplo simple de tal canal es dado por el canal de despolarización, Ec. {eq}`depchannel`, con $0\leq p\leq 1/3$.  Incluso existen canales que permiten la distribución de entrelazamiento, pero los estados entrelazados obtenidos no pueden ser destilados en estados maximalmente entrelazados. Estos estados son conocidos como estados *limitados por el entrelazamiento* {cite}`horodecki`. Los canales que rompen el entrelazamiento, o canales que a lo sumo limitan el entrelazamiento, tienen $\text{QC}^\leftrightarrow=0$. Más allá de estas consideraciones más académicas, incluso para un canal con pérdidas, y a pesar de que dicho canal tiene en principio una capacidad cuántica positiva para todas las pérdidas, la tasa de comunicación cuántica escala con la transmisión del canal, disminuyendo así exponencialmente con la distancia entre Alice y Bob. En una implementación realista, la comunicación cuántica se vuelve impráctica después de, digamos, unos pocos cientos de kilómetros.

De hecho, ya en la teoría de la información clásica, y a pesar de que todos los canales no triviales tienen una capacidad cuántica estrictamente positiva, la transmisión directa se vuelve inservible en algún punto. La solución consiste en dividir el largo canal con pérdidas en segmentos en los cuales colocamos nodos, o repetidores, que lean la información, la corrijan y preparen una copia perfecta para el siguiente nodo. Si se siguiera literalmente esta idea, sería necesario colocar repetidores tan pronto como el canal no permitiera la corrección de errores cuánticos, lo que implicaría que los repetidores serían necesarios después de distancias muy cortas. La solución a esto es combinar la idea de repetidores con el entrelazamiento, llevando al concepto de *repetidor cuántico* {cite}`qrep`.  La idea explota muchas de las herramientas explicadas anteriormente, además del protocolo de intercambio de entrelazamiento. El intercambio de entrelazamiento considera la situación en la cual el protocolo de teleportación se aplica a la mitad de un estado maximalmente entrelazado. Este protocolo ya se discute en el artículo original de teleportación {cite}`teleportation`, y se expande en {cite}`entswap`. Imagina la situación en la que tres partes comparten dos estados maximalmente entrelazados de la siguiente manera: Alice comparte un estado maximalmente entrelazado $\ket{\Phi^+}{AB_1}$ con Bob, quien a su vez comparte otro estado maximalmente entrelazado $\ket{\Phi^+}{B_2C}$ con Charlie. Ahora, si Bob teleporta la partícula $B_1$ a Charlie usando este segundo estado, el entrelazamiento se intercambia y ahora Alice y Charlie comparten un estado $\ket{\Phi^+}_{AC}$, mientras que cualquier entrelazamiento con Bob se destruye. La medición de Bob mapea el entrelazamiento que tiene con Alice y Charlie a un entrelazamiento directo entre ellos.

La idea intuitiva de un repetidor cuántico es la siguiente, ver también {numref}`qrepfig`. Considera dos partes distantes conectadas por un canal muy ruidoso para el cual la comunicación cuántica directa es poco práctica, o incluso imposible. Varias estaciones intermedias, los llamados repetidores, se colocan a lo largo del canal, de modo que el canal efectivo entre cualquier repetidor consecutivo tiene una calidad mucho mejor. Ahora, los estados entrelazados se distribuyen a través de los diferentes nodos. Dado que los canales tienen una mejor calidad, los estados entrelazados menos ruidosos resultantes ahora pueden destilarse en estados maximalmente entrelazados que conectan todos los nodos en el canal. Las partes luego realizan el intercambio de entrelazamiento para que todos los pares entrelazados ahora se compartan entre los dos nodos finales, Alice y Bob. Finalmente, Alice y Bob usan estos pares para intercambiar comunicación cuántica de manera confiable a través de la teleportación. El protocolo, aunque teóricamente atractivo, es sin embargo muy desafiante, ya que los nodos necesitan realizar operaciones en varios cúbits y almacenarlos en memorias sin decoherencia mientras se ejecuta el protocolo. Todavía no se ha conseguido demostrar ninguna configuración de repetidor, ni siquiera con un solo repetidor y en un entorno de laboratorio, aunque varios grupos en todo el mundo están trabajando intensamente en desarrollar todos los ingredientes necesarios para ello.

```{figure} ./QRepeater.png
---
height: 400px
name: qrepfig
---
Repetidores cuánticos: (i) Alice y Bob están conectados por un canal muy ruidoso $\Lambda_L$, donde la comunicación cuántica es poco práctica o incluso imposible. (ii) Se añaden estaciones de repetidores intermedios, de modo que el canal resultante que conecta diferentes nodos, $\Lambda_{L'}$, tiene una calidad mucho mejor y permite la distribución de estados entrelazados destilables. (iii) Las partes utilizan el canal $n$ veces para distribuir entrelazamiento, resultando en $n$ copias de un estado entrelazado mixto. (iv) Estos estados mixtos se destilan en $m$ estados maximalmente entrelazados mediante LOCC. (v) El entrelazamiento se mapea a los nodos finales mediante el intercambio de entrelazamiento, de modo que ahora es posible la comunicación cuántica confiable a través de la teleportación cuántica.
```

Juntando todas estas ideas, llegamos al concepto de *internet cuántico* {cite}`kimble`, donde diferentes nodos tendrán computadoras cuánticas capaces de realizar cualquier operación cuántica en sus estados, almacenarlos en memorias cuánticas e intercambiar bits cuánticos mediante entrelazamiento y teleportación. Este es el objetivo final de la comunicación cuántica.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

