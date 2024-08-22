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
```

# Teorema de Bell

El teorema de Bell es, sin duda, el resultado más contundente que muestra la separación entre la física clásica y la cuántica (y las correspondientes teorías de la información). Históricamente, toda la discusión comenzó con un célebre artículo de Einstein, Podolsky y Rosen (EPR) titulado "¿Puede Considerarse Completa la Descripción Cuántico-Mecánica de la Realidad Física?" {cite}`epr`, donde plantearon dudas sobre la completitud de la teoría cuántica como una teoría local-realista (LR). Su argumento se basaba en tres requisitos que, según EPR, debería cumplir cualquier teoría física:

- "Localidad": Los eventos en regiones separadas espacialmente no pueden tener una relación causal (directa).
- "Realidad": Si, sin perturbar un sistema de ninguna manera, podemos predecir con certeza el valor de una cantidad física, entonces existe un elemento de realidad físico correspondiente a esta cantidad física.
- "Completitud": Todo elemento de la realidad física debe tener un contraparte en la teoría física.

Todas estas condiciones parecen intuitivamente naturales y poco restrictivas. Einstein, Podolsky y Rosen argumentaron que si la teoría cuántica fuera local y realista, entonces no podría ser completa. No cuestionaban necesariamente el poder predictivo de la teoría cuántica, sino que abogaban por la existencia de otra teoría, posiblemente con el mismo poder predictivo que la teoría cuántica, pero completa y, por lo tanto, más satisfactoria.

Durante años, el programa EPR fue principalmente un asunto de debate cuasi-filosófico, hasta el trabajo de J. Bell en 1964 {cite}`bell`. El mérito de Bell fue (i) identificar una serie de condiciones, las llamadas desigualdades de Bell, que cualquier teoría LR cumple y (ii) proporcionar un experimento cuántico que las viola. Por lo tanto, Bell pudo construir una condición verificable experimentalmente para poner a prueba las teorías LR frente a la teoría cuántica. Las demostraciones experimentales de violaciones de las desigualdades de Bell, desde las demostraciones pioneras en {cite}`Aspect,exp1,exp2,exp3` hasta los experimentos más recientes libres de "loopholes" {cite}`hanson,nist,vienna`, cerraron de manera definitiva el programa EPR.

Aquí presentamos el teorema de Bell a través de la desigualdad de Bell más conocida, la llamada desigualdad Clauser-Horne-Shimony-Holt (CHSH) {cite}`CHSH`. De hecho, esta no fue la desigualdad utilizada por Bell para probar su teorema, pero es la más utilizada actualmente y proporciona la demostración más sencilla del resultado de Bell. Para ello, seguimos una formulación más moderna y operativa del problema, sin hacer uso explícito de los conceptos de localidad y realismo.

Un escenario de Bell se define por dos observadores no comunicantes, Alice y Bob, que reciben dos sistemas correlacionados de una fuente. Las partes pueden realizar $m$ mediciones posibles en sus sistemas, cada una con $r$ resultados posibles. Las mediciones realizadas están etiquetadas por $x,y=1,\ldots,m$ y los resultados obtenidos por $a,b=1,\ldots,r$, véase también {numref}`CHSHfig`. Al repetir el experimento varias veces, es posible calcular las probabilidades condicionales $p(ab|xy)$ de observar los diferentes resultados $(a,b)$ para cada configuración de mediciones $(x,y)$. Claramente, estas probabilidades son todas positivas y normalizadas, $p(ab|xy)>0$ y $\sum_{a,b}p(ab|xy)=1$ para todos $(x,y)$. Estas probabilidades definen las estadísticas observadas y a menudo se denominan *correlaciones*. Lo que EPR llamaba un modelo LR se da mediante correlaciones que pueden escribirse como estrategias deterministas locales que especifican la salida dada la entrada y posiblemente correlacionadas a través de las partículas recibidas de la fuente. Estas correlaciones se expresan como

```{math}
:label: lrmodel
p(ab|xy)=\sum_{\lambda}p(\lambda) ~ D_A(a|x\lambda) ~ D_B(a|x\lambda) ,
```

donde $\lambda$ denota las instrucciones recibidas de la fuente, que pueden cambiar de acuerdo con una preparación probabilística $p(\lambda)$, mientras que las funciones $D_A$ y $D_B$ especifican de manera determinista la salida de cada parte dada la entrada y estas instrucciones. Cabe destacar que estas funciones no dependen de la entrada de la otra parte porque se asume que las partes no se comunican. Además, es importante señalar que si se conoce el valor de $\lambda$, que puede interpretarse como el estado preparado por la fuente, entonces es posible predecir la salida de la medición de manera determinista. Es natural esperar que, en la naturaleza, las correlaciones entre dos partes no comunicantes siempre puedan expresarse de esta forma.

```{figure} ./CHSH_Fig.png
---
height: 400px
name: CHSHfig
---
Desigualdad de Bell CHSH: Dos partes miden dos observables de dos resultados, $A_1$ y $A_2$ para Alice, y $B_1$ y $B_2$ para Bob. La elección de la medición está representada por un bit, $x$ para Alice y $y$ para Bob. Los dos posibles resultados están etiquetados por $\pm 1$. Para la violación cuántica, los observables se reemplazan por operadores cuánticos que actúan sobre un estado de dos cúbits        maximamente entrelazado.
```

La desigualdad CHSH {cite}`CHSH` se define en el escenario de Bell más simple, en el cual las partes realizan dos mediciones con dos resultados, $m=r=2$, y la convención es denotar la medición realizada por $x,y=1,2$ y el resultado obtenido por $a,b=\pm 1$. Esta convención es arbitraria, pero esta elección simplifica los cálculos. Luego se considera la siguiente cantidad:

```{math}
:label: CHSHdef
    \text{CHSH}=A_1B_1+A_1B_2+A_2B_1-A_2B_2 ,
```
donde $A_x$ ($B_y$) denota el resultado de la medición hecha por Alice (Bob) al implementar la medición $x$ ($y$). Es muy sencillo ver que si los resultados de las mediciones están fijados de manera determinista, es decir, para cualquier asignación de $\pm 1$ a estos valores, la expresión CHSH satisface $|CHSH|=2$. Esto implica que, incluso si la asignación cambia según una preparación probabilística en la fuente $p(\lambda)$, como en la Ec. {eq}`lrmodel`, el valor esperado de esta expresión siempre satisface

```{math}
:label: CHSHineq
    \langle CHSH\rangle \leq 2.
```

La Ec. {eq}`CHSHineq` es la famosa desigualdad CHSH, cuya derivación matemática es sorprendentemente simple. La violación máxima de una desigualdad para modelos LR se llama el límite local, que es igual a 2 para CHSH.

Ahora consideremos una implementación cuántica de un escenario de Bell CHSH en el cual el estado preparado por la fuente es el estado de dos cúbits maximamente entrelazado

```{math}
:label: bellstate
    \ket{\Phi^+}=\frac{1}{\sqrt 2}(\ket{00}+\ket{11}) ,
```

y las mediciones realizadas por cada una de las dos partes están definidas por los observables $A_1=\sx$, $A_2=\sz$, $B_1=(\sx+\sz)/\sqrt 2$ y $B_2=(\sx-\sz)/\sqrt 2$, véase {numref}`CHSHfig`. Tras algunos cálculos, es posible ver que el valor cuántico de la expresión CHSH para esta configuración es

```{math}
:label: tsirelson
    \langle \text{CHSH}\rangle =\langle A_1B_1\rangle +\langle A_1B_2\rangle +\langle A_2B_1\rangle -\langle A_2B_2\rangle =2\sqrt 2 > 2,
```

demostrando que las correlaciones cuánticas no tienen una descripción en términos de un modelo EPR {eq}`lrmodel`. El valor $2\sqrt{2}$ es el mayor posible en la física cuántica y se conoce como el límite de Tsirelson {cite}`tsirelson`.

`````{admonition} Ejercicio 1
:class: tip
Calcula el valor cuántico de cada uno de los cuatro términos $\langle A_x\otimes B_y\rangle$, con $x,y=1,2$, en la expresión CHSH para el estado {eq}`bellstate` y con los ajustes como en {numref}`CHSHfig`, y verifica que la suma sea $2\sqrt{2}$.
`````

Las implicaciones de esta violación son enormes. En primer lugar, no existe ninguna teoría LR capaz de dar un valor de CHSH mayor a 2, por lo que o las predicciones de la teoría cuántica son incorrectas o el programa EPR no es posible. De este modo, Bell pudo mapear el debate EPR en una condición medible. Lo único que quedaba era diseñar la situación experimental para probar la violación de cualquiera de estas cantidades. La verificación experimental rigurosa de la violación de una desigualdad de Bell se realizó casi dos décadas después del trabajo seminal de Bell {cite}`Aspect`. Desde entonces, se han llevado a cabo otras pruebas experimentales, cuyos resultados han favorecido al formalismo cuántico {cite}`hanson,nist,vienna`.

Aquí se deben mencionar dos hechos. Primero, cabe señalar que, aunque solo se presenta una desigualdad, existen muchas condiciones similares que caracterizan el conjunto de distribuciones de probabilidad alcanzables en una teoría LR {eq}`lrmodel`. El hecho de que la teoría cuántica prediga la existencia de correlaciones que conducen a una violación de una desigualdad de Bell significa que estas correlaciones cuánticas no pueden escribirse de esta forma.

En segundo lugar, a pesar de que la teoría cuántica predice la violación de estas desigualdades, en el formalismo cuántico no se permite la comunicación más rápida que la luz. Esto correspondería al caso en el que la medición de Alice pudiera cambiar las estadísticas de medición de Bob. Es sencillo demostrar que esto no es posible. Considera la situación en la que Alice y Bob comparten un estado cuántico $\rho_{AB}$ sobre el cual aplican mediciones ${M_{a|x}}$ y ${M_{b|y}}$ de manera que

```{math}
:label: qcorr
p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y}) .
```

La probabilidad de que Alice obtenga el resultado $a$ cuando ella mide $x$ y Bob mide $y$ es

```{math}
:label:
    p_A\,(a|xy)=\sum_b p\,(ab|xy)=\sum_b\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})
    =\tr(\rho_{AB}M_{a|x}\otimes \one_B) =\tr(A_x\rho_A) ,
```

donde hemos utilizado que $\sum_b M_{b|y}=\one_B$ para todo $y$ y donde $\rho_A=\tr_B(\rho_{AB})$. Aquí, $\tr_B$ es la traza parcial sobre el subsistema $B$. Esto significa que las estadísticas de medición local de Alice no pueden verse afectadas por ninguna medición de Bob (y viceversa), ya que no dependen de la medición implementada $y$, por lo que no es posible la comunicación más rápida que la luz (de hecho, instantánea).

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```