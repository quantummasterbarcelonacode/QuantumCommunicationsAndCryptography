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


# Comunicación Clásica

El problema de enviar información de manera confiable a través de un canal ruidoso tiene una larga historia en la teoría de la información clásica. En este contexto, un canal clásico se describe mediante un mapa estocástico $P(Y|X)$, que describe cómo una variable aleatoria de entrada $X$ se transforma en una variable de salida $Y$. La manera estándar de corregir los errores del canal es a través de la *corrección de errores*.

Como ejemplo, consideremos el simple canal binario simétrico $P_\epsilon$ que invierte un bit con una probabilidad $\epsilon$, es decir, $P_\epsilon(Y=0|X=0)=P_\epsilon(Y=1|X=1)=1-\epsilon$ y $P_\epsilon(Y=0|X=1)=P_\epsilon(Y=1|X=0)=\epsilon$, lo que define la probabilidad de error. Sin pérdida generalidad, la probabilidad de error satisface $\epsilon<1/2$. Un código de corrección de errores muy simple explota la repetición: para transmitir un bit $X$ a Bob, Alice envía su valor tres veces a través del canal, $X_1=X_2=X_3=X$.  Para definir el valor de su bit, Bob utiliza la mayoría de los símbolos recibidos, $Y=\text{maj}(Y_1,Y_2,Y_3)$. Por lo tanto, la nueva probabilidad de error es $\epsilon'=3(1-\epsilon)\epsilon^2+\epsilon^3$, que siempre es menor que $\epsilon$ cuando $\epsilon<1/2$.

Este ejemplo ilustra las ideas principales de la corrección de errores. En general, Alice codifica cadenas de bits de longitud $m$, tal que $\vec X=(X_1,\ldots,X_m)$, llamados bits lógicos, en secuencias de $2^m$ bits físicos de longitud $n$, tal que $\vec X'=(X'_1,\ldots,X'_n)$, las llamadas palabra clave, a través de un mapa de codificación $m\rightarrow n$ denotado por $\mathcal E$. En el ejemplo anterior, Alice estaba codificando $m=1$ bits en 2 palabras claves de $n=3$ bits, por ejemplo, $000$ y $111$.  En recepción, el mensaje recibido es el resultado de aplicar el canal dado $P(Y|X)$ a cada uno de los símbolos en $\vec X'$. Ahora, decodifica la información mapeando la cadena de $n$ bits recibida, $\vec Y'=(Y'_1,\ldots,Y'_n)$, en una cadena de $m$ bits $\vec Y=(Y_1,\ldots,Y_m)$ a través de un mapa de decodificación $n\rightarrow m$ denotado por $\mathcal D$. La probabilidad de error para todo el protocolo es $P(\vec Y\neq\vec X)=\epsilon$ (nótese que $\epsilon$ ahora indica la probabilidad de error después de la corrección de errores). El objetivo de la corrección de errores es, para una tolerancia de error $\epsilon$ dada y $n$ usos del canal, maximizar la cantidad de bits enviados $m$ sobre todos los posibles mapas de codificación y decodificación. Denotamos este óptimo como $m^*(n,\epsilon)$. Ahora, para entender el límite definitivo para una transmisión confiable, se debe considerar la tasa asintótica cuando los usuarios tienen acceso a un número ilimitado de usos del canal y el protocolo alcanza una probabilidad de error que tiende a cero. Esto define la capacidad (clásica) del canal,

```{math}
:label: capacity
C=\lim_{\epsilon\rightarrow 0} \lim_{n\rightarrow \infty}\frac{m^*(n,\epsilon)}{n} .
```

Sorprendentemente, el valor de este límite es conocido. De hecho, Shannon demostró que la capacidad del canal $C$ está dada por

```{math}
:label: shannoncapacity
C=\max_{P(X)} I(X:Y) ,
```

donde $I(X:Y)$ es la información mutua de la distribución conjunta $P(X,Y)=P(X)P(Y|X)$, donde el primer término $P(X)$ es el que se optimiza, mientras que el segundo $P(Y|X)$ es dado por el canal. Este resultado es impresionante, ya que muestra cómo un límite difícil que involucra $n$ usos del canal puede calcularse resolviendo un problema de optimización que involucra un solo uso. Este tipo de fórmula, conocida como fórmula de una sola letra, proporciona el rendimiento asintótico de un objeto (en este caso, un canal) para una tarea dada (en este caso, comunicación confiable) solo en términos de una sola copia del objeto. Esto no significa que la capacidad del canal pueda alcanzarse con un solo uso del canal, sino que para su cálculo solo necesitamos considerar una única copia. En una situación práctica, donde se tiene acceso a un número finito $n$ de usos del canal, se debe diseñar un código de corrección de errores que involucre palabras clave de longitud finita $n$ que se acerque lo más posible a la tasa $C$. Otra consecuencia del resultado anterior es que cualquier canal en el que la información enviada por Alice no sea totalmente borrada, es decir, cualquier canal donde $Y$ no sea independiente de $X$, $P(Y|X)\neq P(Y)$, puede utilizarse para la comunicación. Esto se deduce del hecho de que $I(X:Y)=0$ si, y solo si, $P(X,Y)=P(X)P(Y)$.


