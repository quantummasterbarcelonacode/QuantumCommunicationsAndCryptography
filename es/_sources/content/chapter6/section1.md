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


# BB84 con Codificación en Bloques Temporales y Estados Débilmente Coherentes

La codificación en bloques temporales es una de las soluciones más populares para enviar información cuántica a largas distancias. En principio, la idea es preparar estados de un solo fotón y enviarlos a través de un acoplador de fibra con transmisión $T$. Los dos caminos tienen diferentes longitudes y son recombinados. Se aplica un cambio de fase $\varphi$  a uno de los dos caminos, digamos el más largo, véase {numref}`timebin`. Al manipular la transmisión del acoplamiento y la fase, en principio es posible preparar cualquier estado cúbit, dado que uno tiene $\ket\psi=\sqrt T\ket s+\sqrt Re^{i\varphi}\ket{\ell}$. En la práctica, cambiar la transmisión del primer acoplador es más demandante que cambiar la fase aplicada, por lo que a menudo se emplea una transmisión fija dada por $T=1/2$. Además, recombinar los dos caminos de manera determinística también es un desafío, por lo que a menudo se utiliza otro acoplador nuevamente con una transmisión de $1/2$. Este proceso más simple, por lo tanto, prepara cualquier estado $\ket\psi=(\ket s+e^{i\varphi}\ket{\ell})/\sqrt 2$, es decir, cualquier estado en el ecuador de la esfera de Bloch definido por $\ket{s}$ y $\ket{\ell}$, con cierta probabilidad. Sin embargo, esto es suficiente para implementar el protocolo BB84 a través del esquema en {numref}`timebin`.

<!--Luke: Maybe we should mention that R is just the coefficient normalizing the state based on T?-->

```{figure} ./TimeBin.png
---
height: 400px
name: timebin
---
Cúbits en bloques temporales: La información cuántica se codifica en un estado de un solo fotón que puede estar en diferentes modos temporales. Parte superior: en la situación ideal, el coeficiente de transmisión del primer acoplador puede elegirse libremente. El segundo acoplador primero refleja el fotón cuando toma el camino corto y luego lo transmite cuando toma el camino largo, lo que resulta en la preparación determinística de un estado cúbit arbitrario. En la práctica, es mucho más sencillo trabajar con acopladores de transmisión fija $T=1/2$. Aunque los fotones pueden tomar el camino incorrecto en el segundo acoplador, esto no afecta el rendimiento del protocolo, ya que solo se conservarán los casos en los que Bob detecte un fotón, descartando efectivamente todas las situaciones en las que el fotón se perdió en el segundo acoplador. Parte inferior: implementación del protocolo BB84 utilizando bloques temporales.
```

Para ello, Alice prepara los cuatro posibles estado en BB84, $\ket{\pm x}$ y $\ket{\pm y}$, a través del arreglo anterior y eligiendo una fase $\varphi_A=0,\pi$ para $\ket{\pm x}$ y $\varphi_A=\pm\pi/2$ para $\ket{\pm y}$. Estos estados se envían a Bob, quien aplica el *mismo* arreglo interferométrico y detecta qué camino toma el fotón al final del proceso. Como se aclarará más adelante, $\varphi_B=0$ ($\varphi=\pi/2$) corresponde a la medida en la base $x$ ($y$). También es importante tener en cuenta que solo se conservan los eventos en los que Bob detecta un fotón; todos los demás se descartan. Si denotamos por $T$ el tiempo que le toma al fotón en ir de Alice a Bob, y por $\Delta T$ el desfase temporal entre los dos brazos de interferómetro de cada lado, hay tres valores posibles para el tiempo $T_B$ en el que ocurra la detección de un fotón en el lado de Bob:

- $T_B=T$: el fotón toma el camino corto en ambos interferómetros. Puede ser dectado en cualquiera de los dos detectores con probailidad $1/2$. Estos eventos son descartados.
- $T_B=T+2\Delta T$: el fotón toma el camino largo en ambos interferómetros. Puede ser dectado en cualquiera de los dos detectores con probailidad $1/2$. Estos eventos son descartados.
- $T_B=T+\Delta T$: hay interferencia entre las dos posibilidad en las que el fotón primero tomó el camino corto y luego el largo, y viceversa. Crucialmente, esta interferencia, y por lo tanto la probabilidad de observar el fotón en uno u otro detector, depende de la diferencia de fase aplicada por Alice y Bob. Este es el caso interesante que se utiliza para generar la clave.

Cabe señalar que, para definir estos tiempos de llegada, Alice y Bob deben compartir una referencia temporal, es decir, Bob debe saber cuándo esperar la llegada de los fotones preparados por Alice.

En la implementación, Bob sólo conserva aquellos eventos en los que uno de los dos detectores hace clic en $T_B=T+\Delta T$, mientras que todos los demás eventos se descartan. Vamos a calcular la probabilidad de observar un clic en uno de los detectores en este tiempo. Solo hay dos eventos posibles que pueden contribuir: (i) el fotón de Alice toma el camino corto, es enviado por Bob, y luego toma el camino largo, o (ii) el fotón de Alice toma el camino largo, es enviado a Bob, y luego toma el camino corto. La física cuántica nos dice que, para calcular la probabilidad correspondiente, debemos sumar las amplitudes de probabilidad de estos dos eventos. Para ello, trabajamos en el formalismo de segunda cuantización e introducimos los operadores de creación y aniquilación para cada modo, que denotamos por $a$, en lugar de la notación más estándar $a^\dagger$, para simplificar la notación. Notemos que trabajaremos con estados no normalizados. Un estado de un único fotón $\ket{1}$ entonces se escribe como $\ket 1=a\ket 0$, donde $\ket 0$ es ahora el estado vacío del campo electromagnético (ninguno de estos estados debería confundirse con los elementos de la base computacional).


El estado que sale del laboratorio de Alice es $(a_s+e^{i\varphi_A}a_\ell)\ket 0$, es decir, la superposición de un fotón que tomó el camino corto y el largo, con la fase correspondiente. Para simplificar aún más la notación, omitimos el estado de vacío. El estado que llega al último acoplador de Bob en el tiempo $T+\Delta T$ es $a_{s\ell}e^{i\varphi_B}+a_{\ell s}e^{i\varphi_A}$, donde $a_{\ell s}$ ($a_{s\ell}$) es el operador de creación para el fotón que primero tomó el camino largo (corto) y luego corto (largo). El acoplador no es más que un divisor de haz balanceado estándar, con un coeficiente de transmisión $T=1/2$. Es bien sabido que un divisor de haz balanceado transforma los modos de entrada $a_1$ y $a_2$ en los modos de salida $b_1$ y $b_2$ como sigue:

```{math}
:label: beamsplitter
    \begin{pmatrix}b_1 \\b_2 \\\end{pmatrix} =     \begin{pmatrix}\frac{1}{\sqrt 2} & \frac{1}{\sqrt 2} \\\frac{1}{\sqrt 2} & -\frac{1}{\sqrt 2} \\\end{pmatrix} \begin{pmatrix}a_1 \\ a_2 \\\end{pmatrix} .
```

En la configuración considerada, debemos aplicar esta transformación a los modos de entrada del último divisor de haz, $a_{\ell s}$ y $a_{s\ell}$, mientras que los modos de salida corresponden a los fotones que van a los detectores, que denotamos por $d_1$ y $d_2$. Por lo tanto, tenemos

```{math}
:label: 
(d_1+d_2)e^{i\varphi_B}+(d_1-d_2)e^{i\varphi_A}. 
```

Esto implica que las probabilidades de observar un fotón en los detectores son, después de restaurar la normalizacióm, 

```{math}
:label: 
\text{Pr}(d_1 \text{ clicks})&=&\frac{|e^{i\varphi_A}+e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}+e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1+\cos(\varphi_A-\varphi_B)}{2} \nonumber\\
\text{Pr}(d_2 \text{ clicks})&=&\frac{|e^{i\varphi_A}-e^{i\varphi_B}|^2}{4}=\frac{|e^{i(\varphi_A-\varphi_B)/2}-e^{-i(\varphi_A-\varphi_B)/2}|^2}{4}=\frac{1-\cos(\varphi_A-\varphi_B)}{2} .
```

Cuando las bases de Alice y Bob coinciden y son iguales a $z$, correspondientes a $\varphi_A=0,\pi$ y $\varphi_B=0$, entonces el primer detector hace clic de manera determinística cuando Alice prepara $\ket{+z}$, correspondiente a $\varphi_A=0$, mientras que el segundo lo hace para $\ket{-z}$, correspondiente a $\varphi_A=\pi$. Es fácil ver que lo mismo se observa para $\varphi_A=\pm\pi/2$ y $\varphi_B=\pi/2$. Cuando las bases no coinciden, digamos $\varphi_A=0$ y $\varphi_B=\pi/2$, los dos detectores hacen clic con la misma probabilidad, $\text{Pr}(d_1 \text{ clicks})=\text{Pr}(d_2 \text{ clicks})=1/2$. Por lo tanto, obtenemos la mis correlación entre la preparación de Alice y las medidad de Bob como en el protocolo BB84, como fue anunciado.

La implementación de este esquema sigue siendo bastante exigente porque requiere la preparación de estados de fotón único. A pesar del tremendo progreso en las fuentes de fotones individuales, este sigue siendo un dispositivo costoso y desafiante. Para superar este problema, Alice reemplaza los estados de fotón único por estados débilmente coherentes. Recordemos que un estado coherente es dado por la siguiente superposición de estados número:

```{math}
:label: coherentstate
\ket\alpha=e^{-|\alpha|^2/2}\sum_n \frac{\alpha^n}{\sqrt{n!}}\ket n=\sum_n p(n)\ket n,
```

donde $\alpha$ es un número complejo arbitrario, $\alpha=\alpha_x+i\alpha_p=|\alpha|e^{i\phi}$. La fase del estado coherente es $\phi$, mientras que su intensidad, que denotamos por $\mu$, es igual a $\mu=|\alpha|^2$. De hecho, se puede notar que el número promedio de fotones en el pulso es

```{math}
:label:
\langle n\rangle=e^{-|\alpha|^2}\sum_n \frac{\alpha^{2n}}{n!} n = \mu.
```

Los estados coherentes son muy fáciles de preparar, ya que describen el estado de un láser convencional. Así que Alice puede aproximar el estado de fotón único requerido mediante un estado coherente atenuado, donde $\mu<1$. Omitiendo la normalización, un estado coherente atenuado es aproximadamente igual a $\ket 0 + \alpha\ket 1$, es decir, una superposición de estados de vacío (con cero fotones) y de fotón único. Ahora, la idea es que, dado que Bob solo conservará aquellos casos en los que detecte luz, esto proyecta efectivamente el estado coherente al estado de fotón único, ya que el estado vacío no puede generar un clic por parte de Bob. En otras palabras, el estado coherente se comporta de alguna manera como un estado de fotón individual en aquellos eventos donde Bob detectó luz. Por lo tanto, tenemos todos los ingredientes para una implementación factible del protocolo BB84 y, de hecho, la mayoría de los dispositivos comerciales que ejecutan este protocolo se basan en interferómetros de fibra, estados débilmente coherentes y detectores de luz.

La tasa a la que funcionan estos protocolos se puede estimar de la siguiente manera. Los estados coherentes se preparan con una tasa de repetición que denotamos por $f$. Ellos se propagan a través del canal con una transmisión $\eta_C$, ver Ec. {eq}`channellosses`. Por lo tanto, la tasa de fotones detectados sigue la relación $R_B=f\eta_c\mu$. Dejando aparte los términos $f$ and $\mu$ fijados en la preparación, la tasa es proporcional a $\eta_C$, es decir, exponencial con la distancia. Esta no es la tasa final de la clave, la cual dependerá del proceso de destilación (reconciliación de bases, corrección de errores, amplificación de privacidad,...), pero captura el orden de magnitud de la tasa del protocolo.




