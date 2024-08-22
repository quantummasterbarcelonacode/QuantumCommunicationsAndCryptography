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

# Correlaciones Físicas

La razón principal por la que las aplicaciones DI son posibles es porque se asume con los dispositivos son compatibles con una teoría física, en nuestro caso, la mecánica cuántica, lo que impone algunas restricciones no triviales en las correlaciones observadas.

La restricción más débil que puede ser impuesta es que las correlaciones no permiten ninguna forma de comunicación entre Alice y Bob. Como se mencionó, esta es una de las pocas suposiciones del formalismo, que se puede imponer, por ejemplo, mediante consideraciones de espacio-tiempo. Algunas correlaciones son compatibles con esta suposición si, y solo si, la probabilidad marginal observada por una de las partes, digamos Alice, es independiente de la entrada usada por la otra parte, Bob. De hecho, si no fuera así, Bob, al elegir su entrada podría producir un efecto perceptible en Alice, es decir, podría enviarle una señal. Estas restricciones son conocidas como condiciones de no señalización y dan a lugar a las llamadas *correlaciones de no señalización*. Esto implica que las correlaciones satisfacen las restricciones lineales

```{math}
:label: nscorrelations
\forall y: p_A(a|x)=\sum_b p(ab|xy), \quad\quad
\forall x: p_B(b|y)=\sum_a p(ab|xy).
```

El conjunto de correlaciones de no señalización, denotado por $\mathcal{NS}$, es convexo y se puede demostrar que para valores finitos de $m$ y $r$, tiene un número finito de puntos extremos, lo que define lo que se llama un politopo.

Antes de la aparición de la teoría cuántica, la forma estándar de describir las correlaciones era mediante modelos clásicos determinísticos. Estos definen las llamadas correlaciones *clásicas*, que son aquellas que se pueden escribir como

```{math}
:label:
p(ab|xy)\sum_\lambda p(\lambda)D_A(a|x\lambda)D_B(b|y\lambda) ,
```

donde $\lambda$ denota las variables clásicas correlacionadas ocultas en los dispositivos descritas por la distribución de probabilidad $p(\lambda)$, mientras que $D_A$ y $D_B$ son funciones determinísticas que producen las salidas dependiendo de las entradas y la variable $\lambda$. Las correlaciones clásicas no son más que correlaciones EPR introducidas en {cite}`epr`. Para $m$ y $r$ finitos, el conjunto de correlaciones clásicas $\mathcal C$ es nuevamente un politopo, es decir, un conjunto convexo con un número finito de puntos.

Finalmente, el conjunto de interés aquí es el de correlaciones cuánticas. Este es definido por aquellas correlaciones que se pueden obtener al realizar mediciones locales en un estado cuántico de dos partes. Por lo tanto, tenemos que las correlaciones son cuánticas siempre que exista un estado actuando en un espacio de Hilbert compuesto $\mathcal H_A\otimes\mathcal H_B$ y una medición local en cada espacio de Hilbert definida por los elementos de POVM $M_{a|x}$ y $M_{b|y}$, donde cada uno de los operadores son positivos, tal que $\sum_a M_{a|x}=\one_A$ para todo $x$ y $\sum_a M_{b|y}=\one_B$ y para todo $y$, de modo que

```{math}
:label: qcorrelations
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{a|x}) .
```
Notemos que no imponemos ninguna condición específica sobre los espacios de Hilbert utilizados para derivar estas correlaciones: son arbitrarios. En particular, la dimensión del espacio de Hilbert no está especificada, es decir, los sistemas medidos pueden ser cúbits, cutrits o incluso sistemas con dimensión infinita. De hecho, la caracterización de las correlaciones cuáticas, es decir, aquellas cuya distribución de probabilidad se puede expresar como en la Ec. {eq}`qcorrelations`, es muy difícil, ya que, intuitivamente se necesita explorar todos los posibles espacios de Hilbert. El conjunto de correlaciones cuánticas $\mathcal Q$ es nuevamente convexo, pero no tiene un número finito de puntos extremos. 

La relación entre estos tres conjuntos físicos es entendida relativamente bien, teniendo que $\mathcal C \subsetneq \mathcal Q \subsetneq \mathcal{NS}$. Un representación pictórica de estos conjuntos se muestra en {numref}`difig`, que refleja las propiedades más destacadas de estos conjuntos. La primera inclusión estricta no es más que una consecuencia del teorema de Bell, es decir, la existencia de correlaciones cuánticas sin un análogo clásico. De hecho, las facetas del conjunto clásico definen desigualdades de Bell, hiperplanos que definen condiciones lineales expresadas en términos de las correlaciones observadas que son satisfechas para toda correlación clásica (ya que el conjunto de correlaciones clásicas está completamente contenido en uno de los lados del hiperplano). La segunda inclusión fue probada por Tsirelson e independientemente por Popescu y Rohrlich {cite}`PRbox`. Ellos derivaron la llamada caja Popescu-Rohrlich (PR), una distribución de probabilidad $p(ab|xy)\in\mathcal{NS}$ no tiene realización cuántica. Esta distribución se obtiene para caso de entradas y salidas binarias, $m=r=2$. Denotando los valores de las entradas y salidas por bits, la caja PR es tal que $p(ab|xy)=\delta_{a\oplus b=xy}/2$. Aquí $\oplus$ es el operador XOR clásico, mientras que $xy$ es el AND de estos dos bits. Para entender la notación, damos dos ejemplos:

```{math}
p(a=1,b=1|x=1,y=1)=\delta_{1\oplus 1=AND(1,1)}/2=\delta_{0,1}/2=0,\\
p(a=0,b=0|x=0,y=1)=\delta_{0\oplus 0=AND(0,1)}/2=\delta_{0,0}/2=1/2.
```

De manera más compacta, cuando $xy=0$ ($xy=1$), las salidas de Alice y Bob están perfectamente (anti) correlacionadas y ocurren con la misma probabilidad. La prueba que estas correlaciones no son cuánticas se basa en el hecho de que conducen a un valor de CHSH igual a 4, superior al máximo permitido por la física cuántica, igual a $2\sqrt 2$ {cite}`tsirelson`. Para ver que estas correlaciones producen un valor de CHSH igual a 4, es conveniente volver a etiquetar las salidas como $a,b=\pm 1$ y las entradas como $x,y=1,2$. Cuando al menos una entrada es igual a 1 (0 en la notación binaria utilizada para especificar la caja PR), las salidas están perfectamente correlacionadas, por lo que $ab=+1$, entonces $A_1B_1=A_1B_2=A_2B_1=+1$, mientras que cuando ambas entradas son iguales a 2 (1 en la notación binaria), las salidas están anti correlacionadas, por lo que se tiene $A_2B_2=-1$. Estos valores producen el máximo valor no cuántico de $\text{CHSH}=4$.

Luego de este pequeño paréntesis, nos dedicamos a motivar por qué estas correlaciones se vuelven no triviales cuando se combinan con una teoría física o incluso con un simple principio físico. Presentamos las ideas principales para construir protocolos independiente del dispositivo en información cuántica. Es importante destacar que en un escenario DI, para que Alice y Bob obtengan un resultado que no es posible en la teoría de la información clásica, necesitan observar correlaciones que no tengan un modelo clásico, es decir, correlaciones que violen la desigualdad de Bell. De hecho, las desigualdades de Bell son indicadores del origen intrínsecamente cuántico o no clásico de estas correlaciones. Dado que asumimos que los dispositivos son cuánticos, podemos centrarnos en las correlaciones en $\mathcal Q$ y descartar aquellas en $\mathcal{NS}$ que no tienen una realización cuántica.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


