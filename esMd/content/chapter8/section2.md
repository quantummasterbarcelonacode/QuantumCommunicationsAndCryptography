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



```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Distribución Claves Cuánticas Independiente del Dispositivo

Ahora tenemos gran parte de los ingredientes necesarios para entender la estructura de los protocolos DIQKD. Es importante comprender que en el escenario DI existen dos tipos de jugadores bastante diferentes: los usuarios y el proveedor. Los usuarios, Alice y Bob en nuestro caso, exigen al proveedor dispositivos que produzcan algunas correlaciones deseadas $p(ab|xy)$ que deben violar una desigualdad de Bell. Estas correlaciones tienen una realización cuántica específica, pero desde el punto de vista del usuario esto no es relevante, ya que desean establecer una clave secreta independiente de los detalles de esta realización. Sin embargo, al proveedor sí le importa la realización y tiene que preparar un estado y mediciones que conduzcan a las correlaciones solicitadas por el usuario, de lo contrario, el usuario no comprará el dispositivo.

Comenzamos la discusión con el caso ideal y el escenario más simple de entradas y salidas binarias, $a,b,x,y=1,2$. Para establecer una clave secreta en el contexto DI, Alice y Bob exigen dispositivos que produzcan la violación cuántica máxima de la desigualdad CHSH, es decir, $\text{CHSH}=2\sqrt 2$. Sin embargo, si alguien observa que las correlaciones alcanzan este valor, no hay entradas de Alice y Bob con salidas perfectamente correlacionadas. Es por eso que Bob requiere un tercer valor posible para su entrada, $y=3$, cuya salida ahora está perfectamente correlacionada con la salida de una de las entradas de Alice, digamos $x=1$. Para estas combinaciones de observables, los dos resultados de Alice y Bob que tienen la misma probabilidad, pero son idénticos, es decir $\langle A_1\otimes B_3\rangle=1$. 


Las entradas $x=1$ e $y=3$ serán las que se utilizarán para establecer una clave secreta y, de hecho, $I(A:B)=1$. Este arreglo define el llamado protocolo CHSH QKD {cite}`diqkd`, donde Alice usa una entrada binaria para verificar que la desigualdad de Bell CHSH y otra, $x=1$, para establecer la clave secreta, y Bob tiene una entrada que toma tres valores, de los cuales dos, $y=1,2$, son usado para calcular la desigualdad CHSH y el tercero, $y=3$, para establecer la clave con Alice. Para calcular la información de Eve, Alice y Bob usan el hecho de que básicamente solo hay una forma de obtener una violación máxima de la desigualdad CHSH, que es aquella en la que Alice y Bob comparten un estado de Bell {eq}`bellstate` y utilizan los observables mostrados en {numref}`CHSHfig`.  Se sigue de este resultado, que no vamos a demostrar, que la observación de $\text{CHSH}=2\sqrt 2$ implica que el estado compartido entre Alice y Bob es un estado maximalmente entrelazado de dos cúbits. Dado que este estado es puro, Eve no puede estar correlacionada, por lo tanto, su información es cero, $\chi(A:E)=0$. Por lo tanto, la violación máxima de la desigualdad de Bell certifica que Alice y Bob pueden establecer una clave secreta perfecta, es decir, una lista de bits perfectamente correlacionados, ya que $I(A:B)=1$, donde Eve no tiene ninguna información, $\chi(A:E)=0$.

¿Qué sucede cuando los dispositivos son ruidosos y, por lo tanto, no pueden alcanzar la violación máxima de CHSH? Al igual que con QKD estándar, se necesita derivar una prueba de seguridad que permita a Alice y Bob limitar la información de Eve a partir de sus correlaciones observadas. Sin embargo, recuerde que al derivar este límite, Alice y Bob no deben hacer suposiciones sobre sus dispositivos, aparte del hecho de que producen las correlaciones observadas. Por continuidad, se espera cierta tolerancia al ruido. La pregunta principal es si esta tolerancia es razonable y alcanzable en situaciones prácticas. El problema de optimización que Alice y Bob tienen que resolver es

```{math}
:label: DIHolevo
&&\max_{\rho_{AB},\{M_{a|x}\},\{M_{b|y}\}}\chi(A:E)\\
&&\text{such that }\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})=p(ab|xy) .\nonumber
```

Esta optimización se realiza sobre todos los posibles ataques de Eve, es decir, todos los estados y mediciones en todos los espacios de Hilbert posibles compatibles con las correlaciones observadas. Tenga en cuenta que la información de Holevo de Eve es una función del estado compartido por Alice y Bob y las mediciones realizadas, ya que el estado especifica la purificación que incluye a Eve, $\ket{\psi}_{ABE}$, a la que se aplican las mediciones para calcular $\chi(A:E)$. La optimización {eq}`DIHolevo` es en general muy difícil de resolver. Se puede considerar una versión más débil de ella en la que solo se usa como restricción la violación observada de una desigualdad de Bell, denotada por $\beta$, producida por las correlaciones entre Alice y Bob, es decir, se reemplazan las restricciones en las correlaciones por $\beta(p(ab|xy))=\beta_{\text{obs}}$. La optimización resultante es nuevamente muy difícil, pero se ha resuelto para el caso de CHSH en {cite}`diqkd`. La solución es

```{math}
:label:
\chi(A:E)=h\left(\frac{1+\sqrt{(\text{CHSH}/2)^2-1}}{2}\right) ,
```

donde $h(x)=-x\log_2x-(1-x)\log_2(1-x)$ ies la entropía binaria. Este valor nos permite calcular tasas de claves en el caso de ataques colectivos, como en los protocolos de QKD estándar. Las tasas resultantes se muestran en {numref}`ratesfig`, junto con las obtenidas para BB84. Para hacer una comparación justa, todo se expresa en términos de la tasa de errores de bits cuánticos (quantum bit error rate, QBER), que también afecta la violación observada de la desigualdad de Bell. El QBER crítico, es decir, el valor para el cual el límite de Devetak-Winter es igual a cero, para el protocolo CHSH es $\text{QBER}\approx 7\%$, mientras que para BB84 es igual a $\text{QBER}\approx 11\%$. La robustez es menor, como se esperaba, porque en el escenario DI Eve tiene más ataques disponibles, pero el valor obtenido de QBER es realista y alcanzable en experimentos actuales.

```{figure} ./Key_Rates.png
---
height: 400px
name: ratesfig
---
Tasa para protocolos de QKD: Comparación de los límites de Devetak-Winter en la tasa de clave obtenidos para el protocolo BB84 estándar y el protocolo de DIQKD basado en la desigualdad de Bell CHSH, en función de la QBER. El límite se vuelve cero para $\text{QBER}\approx 11\%$ y $\text{QBER}\approx 7\%$, respectivamente.
```

La discusión anterior proporciona las ideas principales detrás de los protocolos DIQKD y muestra cómo es posible que Alice y Bob extraigan una clave sin hacer ninguna suposición sobre sus dispositivos al explotar correlaciones cuánticas que violan una desigualdad de Bell. Recientemente, se obtuvo un marco general para demostrar la seguridad del protocolo DIQKD en {cite}`EAT`. DIQKD proporciona la forma más fuerte de seguridad cuántica. Desafortunadamente, la realización de los protocolos DIQKD es extremadamente desafiante. Como hemos visto, en la práctica, Alice y Bob están conectados por un canal con pérdidas y las violaciones de Bell son muy frágiles frente a las pérdidas. Esto explica por qué, hasta ahora, no existen dispositivos comerciales que implementen protocolos DIQKD y, de hecho, las demostraciones en laboratorio solo se han logrado recientemente {cite}`diexp1,diexp2,diexp3`. A pesar de este progreso, sigue siendo un problema abierto y desafiante diseñar formas de observar una violación de la desigualdad de Bell entre partes distantes, que a su vez puedan ser explotadas para DIQKD seguro. 

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```



