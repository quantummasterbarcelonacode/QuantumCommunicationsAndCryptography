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

# Tasa de Clave para Ataques Colectivos

La importancia de estudiar ataques colectivos proviene de un resultado de Renner {cite}`renner`, quien demostró que, al aumentar el número de rondas del protocolo $N$, para una gran familia de protocolos, incluyendo todos los descritos aquí, la cantidad de clave que se puede destilar en un protocolo bajo ataques generales tiende a la tasa de clave que se puede destilar bajo el ataque colectivo óptimo. En otras palabras, la longitud de la clave secreta $K$ que se puede destilar después de $N$ rondas satisface $\lim_{N\rightarrow\infty} K/N=k_C$, donde $k_C$ es la tasa de clave contra ataques colectivos. Para una realización práctica con un número finito de rondas, habrá correcciones a este límite y $k_C$ no se puede alcanzar, ya que se tiene $K=k_CN-\mathcal{O}(N)$. Estas correcciones son relevantes en situaciones prácticas y una prueba de seguridad completa es capaz de calcularlas o acotarlas. Aun así, $k_C$ es la tasa asintóticamente alcanzable.

En resumen, en el escenario basado en entrelazamiento, el análisis de seguridad de un protocolo bajo ataques colectivos es el siguiente:

- Para todas las rondas del protocolo, Eve prepara el estado puro tripartito $\ket{\Psi}_{ABE}$, desconocido para Alice y Bob, y distribuye las partículas $A$ y $B$ a los usuarios honestos, mientras ella mantiene $E$ en una memoria cuántica. El estado reducido compartido entre Alice y Bob es $\rho_{AB}=\tr_E\proj{\Psi}_{ABE}$.
- Alice (Bob) elige realizar una serie de mediciones $M_{a|x}$ ($M_{b|y}$) en sus partículas, donde $x$ ($y$) denota la medición realizada y $a$ ($b$) el resultado obtenido, con probabilidades $p_A(x)$ ($p_B(y)$).
- A partir de sus resultados de medición, Alice y Bob pueden estimar $p(ab|xy)=\tr(\rho_{AB}M_{a|x}\otimes M_{b|y})$. Estas probabilidades caracterizan total o parcialmente su estado compartido. Denotamos por $\mathcal{S}_{AB}$ el conjunto de estados entre Alice y Bob compatibles con las distribuciones de probabilidad observadas $p(ab|xy)$.
- Para cada uno de estos estados $\tilde\rho_{AB}\in\mathcal{S}_{AB}$, Alice y Bob pueden incluir el sistema de Eve utilizando la descomposición de Schmidt. De hecho, consideren la descomposición espectral de $\tilde\rho_{AB}$, es decir, $\tilde\rho_{AB}=\sum_i\lambda_i\proj{\lambda_i}$. Si Alice y Bob quieren incluir a Eve en el escenario, deben caracterizar aquellos estados puros $\ket{\tilde\Psi}_{ABE}$ compatibles con su estado compartido $\tilde\rho_{AB}$. Cualquier estado con estas características puede ser escrito como

```{math}
:label: psiabe
    \ket{\tilde\Psi}_{ABE}=\sum_i
    \sqrt{\lambda_i}\ket{\lambda_i}_{AB}\ket{e_i} ,
```  

donde $\{\ket{e_i}\}$ define una base ortonormal en el espacio de Eve. 
Note que el espacio dimensional de Eve es igual al rango (número de valores propios no nulos) de $\tilde\rho_{AB}$. Dado $\ket{\tilde\Psi}_{ABE}$, que está completamente especificado por la base $\{\ket{e_i}\}$, cualquier otro estado $\ket{\Phi}_{ABE}$ compatible con $\rho_{AB}$ es tal que $\ket{\Phi}_{ABE}=\one_{AB}\otimes U_E\ket{\tilde\Psi}_{ABE}$. Es decir, la única diferencia entre estos dos estados es una operación unitaria en el espacio de Eve, que corresponde a una base diferente $\{\ket{e'_i}\}$. Esto implica que cualquiera de estos estados es igual de poderoso desde el punto de vista de Eve. Denotamos por $\mathcal{S}_{ABE}$ el conjunto de estados puros entre Alice, Bob y Eve compatibles con las distribuciones de probabilidad observadas $p(ab|xy)$. Naturalmente, el estado $\ket{\Psi}_{ABE}$ realmente preparado por Eve es un elemento de este conjunto.
Alice y Bob se concentran en aquellas mediciones que se utilizan para construir la clave, por ejemplo, las mediciones $z$ realizadas por Alice y Bob en el protocolo BB84. Cuando aplican estas mediciones a cualquiera de los estados $\ket{\tilde\Psi}_{ABE}$, obtienen

```{math}
:label: ccq
    \tilde\rho_{ABE}=\sum_{a,b}p(ab)\proj{a}_A \otimes\proj{b}_B\otimes\proj{\tilde e^{ab}}_E,
```

donde $p(ab)=\bra{ab}\tilde\rho_{AB}\ket{ab}$ es la probabilidad conjunta de obtener los resultados $a$ y $b$, y $\ket{\tilde e^{ab}}$ es el estado proyectado de Eve cuando Alice y Bob han obtenido estos resultados. Salvo por un factor de normalización, este estado es proporcional a

```{math}
:label: evestate
    \ket{\tilde e^{ab}}\propto\langle ab\ket{\tilde\Psi}_{ABE} .
```

Más precisamente, el estado puro $\ket{\tilde e^{ab}}$ se obtiene de la parte derecha de la ecuación anterior después de la normalización. El estado {eq}`ccq` se dice a menudo que contiene correlaciones clásicas-clásicas-cuánticas (ccc). De hecho, aunque el estado se da en forma cuántica, Alice y Bob comparten solo resultados clásicos cuyas correlaciones están encapsuladas por la distribución de probabilidad $p(ab)$. Por otro lado, Eve tiene un estado cuántico $\ket{\tilde e^{ab}}$ que depende de, o de forma equivalente, está correlacionado con los resultados de medición clásicos de Alice y Bob.
Devetak y Winter demostraron que la tasa de clave $k_C$ destilable a partir de un número asintóticamente grande de copias idénticas de un estado ccc {eq}`ccq` está acotada inferiormente por el llamado límite Devetak-Winter, que se expresa en {cite}`dwrate`.

```{math}
:label: dwbound
    k_C\geq K_{DW}(\tilde\rho_{ABE})=I(A:B)-\chi(A:E) .
```

Evidentemente, el límite es una función del estado ccc $\tilde\rho_{ABE}$. Recuerde que $I(A:B)=H(A)+H(B)-H(A,B)$ es la información mutua de la distribución de probabilidad $p(ab)$. La expresión $\chi(A:E)$ denota la cantidad de Holevo {cite}`Holevo` para la codificación efectiva del resultado de la medición de Alice $a$ en los estados cuánticos de Eve. De hecho, cualquier resultado de medición de Alice proyecta el estado de Eve en

```{math}
:label: 
    \tilde\rho_E^a=\tr_{AB}(\proj a\otimes\one_{BE}\proj{\tilde\Psi}_{ABE})/p(a),
```

donde $p(a)$ es la probabilidad de que Alice observe el resultado $a$, $p(a)=\sum_b p(ab)=\tr(\proj a \otimes \one_{BE} \proj{\Psi}_{ABE})=\tr(\proj a \otimes \one_B \rho_{AB})=\tr(\proj a \rho_A)$, donde $\rho_A=\tr_B \rho_{AB}$. La cantidad de Holevo entonces se expresa como

```{math}
:label: 
    \chi(A:E)=S(\tilde\rho_E)-\sum_a p(a)S(\tilde\rho_E^a) ,
```

donde $\tilde\rho_E=\sum_a p(a) \tilde\rho_E^a=\tr_{AB}\proj{\tilde\Psi}_{ABE}$. Para calcular un límite válido sobre la tasa de clave, Alice y Bob deben minimizar el límite Devetak-Winter sobre todos los estados compatibles con las estadísticas observadas.

```{math}
:label: dwbound
    k_C\geq \min_{\tilde\rho_{ABE}\in\mathcal S_{ABE}}K_{DW}(\tilde\rho_{ABE}) .
```

En realidad, Alice y Bob deben asumir que el estado preparado por Eve es el peor posible, es decir, la solución al problema de minimización anterior. Esta minimización proporciona la tasa de clave asintótica deseada.

`````{admonition} Ejercicio 4: Cálculo de tasas de clave
:class: tip

En el protocolo de seis estados, Alice prepara los estados propios de $\sigma_x$, $\sigma_y$ y $\sigma_z$, y los envía a Bob, quien mide estos observables. Después de la reconciliación de bases, Alice y Bob conservan solo aquellos casos en los que usan la misma base. En la perspectiva basada en entrelazamiento, el protocolo es básicamente equivalente a la preparación del estado maximamente entrelazado de dos qubits {eq}`bellstate`, sobre el cual Alice y Bob miden los tres operadores de Pauli. Consideremos ahora que Alice y Bob están conectados por el llamado canal de despolarización de cúbits definido como

```{math}
:label: depchannel
\mathcal D_p(X)=pX + (1-p)\frac{\one}{2}\tr(X) .
```

a) Calcula el estado entre Alice y Bob resultante de aplicar este canal a la mitad del estado maximamente entrelazado,

```{math}
:label: 
\rho_{AB}=(\one_A\otimes\mathcal D_p)(\proj{\Phi}_{AB}).
```

b) Calcula las probabilidades de los resultados para Alice y Bob cuando ambos miden en la base $z$,

```{math}
:label: 
P(\pm,\pm)=\bra{\pm z}\bra{\pm z}\rho_{AB} \ket{\pm z}\ket{\pm z} .
```

c) Incluye a Eve en el escenario proporcionando una purificación del estado $\rho_{AB}$, es decir, un estado puro $\ket{\psi}{ABE}$ tal que $\tr_E\proj{\Psi}{ABE}=\rho_{AB}$.

d) Ahora calcula el estado entre Alice, Bob y Eve después de que Alice y Bob midan en la base $z$,

```{math}
:label: 
\rho_{ABE}=\sum_{a,b=\pm}P(a,b)\proj{a}\otimes\proj{b}\otimes\proj{e^{ab}}_E ,
```

donde $\ket{e^{\pm\pm}}_E$ está dado por $\bra{\pm z}_A\otimes\bra{\pm z}B\otimes\one_E\ket{\Psi}{ABE}$ después de la normalización.

e) Calcula los dos términos que aparecen en el límite de Devetak-Winter, $I(A)$ y $\chi(A)$, donde

```{math}
:label: 
\chi(A:E)=S(\rho_E)-\sum_{a=\pm}p(a)S(\rho^a_E), 
```

donde $S(\rho)=-\tr(\rho\log\rho)$ es la entropía de von Neumann estándar, $\rho^a_E=\sum_{b=\pm}p(b|a)\proj{e^{ab}}E$ y $\rho_E=\sum_a p(a)\rho^a_E=\tr{AB}\proj{\Psi}_{ABE}$. Calcula el valor de $p$ para el cual el límite de Devetak-Winter se vuelve igual a cero.

`````

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```
