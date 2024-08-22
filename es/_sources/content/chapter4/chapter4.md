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


# Estructura General de los Protocolos QKD

La estructura general de un protocolo QKD es la siguiente:

1) Repetir $N$ veces: Alice prepara el estado $\ket{\psi_a}$ con probabilidad $p_a$ y lo envía a Bob a través de un canal inseguro. Bob realiza la medición $M_j$ con probabilidad $p_j$ sobre la partícula recibida, obteniendo el resultado $r$. Después de este proceso, Alice y Bob tienen una lista de $N$ símbolos correspondientes a los estados preparados por Alice $\vec a=(a_1\ldots a_N)$ y las mediciones realizadas por Bob $\vec b=(b_1\ldots b_N)$. Cabe destacar que aquí hemos combinado la medición elegida por Bob $j$ y el resultado obtenido $r$ en $b$, es decir, $b=(j,r)$.
2) Alice y Bob anuncian el estado preparado, la medición realizada y el resultado para $n$ de estas rondas. Esto les permite estimar las frecuencias de obtener el resultado $r$ al realizar la medición $j$ sobre el estado $\ket{\psi_i}$.
3) Usando esta información y la prueba de seguridad, Alice y Bob pueden procesar sus listas clásicas de símbolos $\vec a$ y $\vec b$ para destilar una clave secreta de longitud $K$, $\vec k=(k_1\ldots k_K)$. La longitud de esta clave depende de la ronda de estimación previa. Si la calidad del canal es excesivamente mala, Alice y Bob concluyen que no es posible destilar una clave, $K=0$, y el protocolo se aborta.

Aquí son importantes varias observaciones:

- En principio, cuanto mayor sea el número total de rondas $N$, mejor será el rendimiento del protocolo: tener más rondas reduce la fluctuación estadística al estimar las propiedades del canal, de modo que Alice y Bob tienen una comprensión mucho más precisa del proceso de destilación de la clave. En el límite de $N\rightarrow\infty$, se puede definir la tasa de clave $k=\lim_{N\rightarrow\infty} K/N$.
- El número de rondas anunciadas $n$ debe ser suficiente para lograr una estimación confiable de las propiedades del canal, es decir, para acumular suficientes estadísticas para que estas propiedades se determinen con un nivel de confianza preestablecido. No obstante, para optimizar el rendimiento del protocolo, no debe ser mucho mayor que esto, ya que estas rondas no contribuyen a la clave secreta. En el límite de un $N$ grande, se pueden tener valores muy grandes de $n$, y por lo tanto una estimación arbitrariamente buena de las propiedades del canal, pero tal que $n\ll N$. En otras palabras, la estimación apenas afecta la tasa de clave asintótica.
- La prueba de seguridad, discutida a continuación, es crucial en el paso 3 para comprender cómo Alice y Bob deben destilar la clave a partir de la lista ruidosa de símbolos $\vec a$ y $\vec b$.

En el caso de BB84, $a=(b_A,p)$, donde $b_A$ especifica la elección de base de Alice y $p$ el elemento preparado de la base, de modo que $a$ puede ser igual a $(z,\pm 1)$ o $(x,\pm 1)$. Estos cuatro estados se preparan con la misma probabilidad, igual a $1/4$. En el lado de Bob, también podemos escribir $b=(b_B,r)$, donde $b_B$ ahora denota la elección de base de Bob. Como parte del proceso de destilación de clave en el paso 3, Alice y Bob realizan un proceso de reconciliación de bases en el que solo conservan aquellos símbolos donde $b_A=b_B$, mapeando la lista inicial de símbolos obtenida en el paso 1 en la clave final.

El protocolo en el marco de entrelazamiento es muy similar, pero el paso 1 ahora se reemplaza por:

1) Repetir $N$ veces: Alice prepara el estado $\ket{\Psi}_{AA'}=\sum_a \sqrt{p_a}\ket a_A\otimes\ket{\psi_a}_{A'}$, donde $\{\ket{a}\}$ define una base arbitraria en el sistema $A$. Ella mide el sistema $A$ en esta base obteniendo el resultado $a$ con probabilidad $p_a$. Luego envía el sistema $A'$, que está en el estado $\ket{\psi_a}$, a Bob a través del canal inseguro. Bob realiza una de las mediciones $M_j$ con probabilidad $p_j$ sobre la partícula recibida, obteniendo el resultado $r$. Después de este proceso, Alice y Bob tienen cada uno una lista de $N$ símbolos correspondientes al resultado de la medición en el lado de Alice $\vec a=(a_1\ldots a_N)$ y la medición implementada en el lado de Bob $\vec b=(b_1\ldots b_N)$. Aquí se ha combinado la medición elegida por Bob $j$ y el resultado obtenido $r$ contenido en $b$, es decir, $b=(j,r)$.

En el caso particular de BB84, los cuatro estados pueden agruparse en dos bases. Esto simplifica el protocolo equivalente basado en el entrelazamiento, que, como se mencionó, puede interpretarse como la medición de las bases $x$ y $z$ en la mitad de un estado maximamente entrelazado. Sin embargo, agrupar los estados preparados en más de una base no es posible en general, como es el caso para el protocolo B92.