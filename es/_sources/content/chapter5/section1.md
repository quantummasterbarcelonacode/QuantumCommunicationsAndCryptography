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

# Ataques de Eve

Primero describimos los posibles ataques que Eve puede implementar. Como caso ilustrativo, consideramos un ataque paradigmático al BB84 basado en lo que se llaman máquinas de clonación óptimas. Este es un ejemplo de una familia general de ataques llamados ataques *individuales* en los cuales: (i) Eve intercepta la partícula enviada por Alice a Bob, $\ket{\psi_a}$; (ii) ella agrega otra partícula en un estado de referencia, digamos $\ket{0}$, y realiza una operación unitaria $U_E$ sobre las dos partículas; (iii) Eve envía uno de los estados resultantes a Bob, mientras que mantiene la otra partícula en una memoria cuántica; (iv) una vez que los usuarios honestos anuncian las bases, Eve mide su partícula (ver {numref}`indattacks`), obteniendo el resultado de la medición $e$. Como resultado de este proceso, Alice, Bob y Eve comparten variables aleatorias correlacionadas correspondientes a sus estados preparados y resultados de medición, $a$ y $b$ para los usuarios honestos, y $e$ para Eve, descritos por la distribución de probabilidad $P(a,b,e)$.

```{figure} ./Cloning_Attack.png
---
height: 400px
name: indattacks
---
Estructura de los ataques individuales: Eve interactúa con los estados preparados por Alice y un estado de referencia, digamos $\ket{0}$, a través de una operación unitaria $U_E$. Ella envía una partícula a Bob y guarda la otra, que se mide después de que se anuncien las bases.
```

`````{admonition} Ejercicio 3
:class: tip
Considera un ataque de clonación individual en el que la acción de Eve se describe por una familia de operaciones unitarias parametrizadas por un solo parámetro, $U(\eta)$. Mientras que el teorema de no-clonación establece que un estado cuántico desconocido no puede ser clonado, la clonación aproximada siempre es posible. Considera estados en el ecuador de la esfera de Bloch, es decir,

```{math}
:label: thetast
\ket{\theta}=\frac{1}{\sqrt
2}\left(\ket{0}+e^{i\theta}\ket{1}\right) .
```

Nota que si $\theta=0,\pi/2,\pi,3\pi/2$, se obtienen los cuatro estados $\ket{\pm x}$ y $\ket{\pm y}$ que se pueden usar para BB84. Toma un estado genérico $\ket{\theta}$ y un estado auxiliar $\ket{0}$, y aplica la transformación global (actuando sobre los dos estados) $U(\eta)$, o $U$ para simplificar la notación.

```{math}
:label: 
  U\ket{00} &= \ket{00}, \\
  U\ket{10} &= \cos\eta\ket{10}+\sin\eta\ket{01} .
```

a) Explica brevemente por qué $U$ es una transformación unitaria válida en los estados cuánticos considerados.

b) Calcula el estado final de dos qubits $\ket{\psi(\theta)}_{BE}=U_{BE}\ket{\theta}_B\ket{0}_E$ y los estados reducidos $\rho_B$ y $\rho_E$, donde $\rho_B=\tr_E\proj{\psi(\theta)}$ y de manera similar para $\rho_E$.

c) Calcula la superposición, o fidelidad, de estos dos estados con el estado inicial, es decir, $F_i=\bra{\theta}\rho_i\ket{\theta}$, con $i=B,E$. ¿Dependen estas fidelidades de $\theta$? Encuentra también el valor de $\eta$ para el cual las dos fidelidades se igualan. Finalmente, calcula los estados reducidos cuando $F_B=1$. ¿Cómo interpretas estos resultados?

d) Aplica este ataque al protocolo BB84 cuando Alice y Bob usan los estados $\ket{\pm x}$ y $\ket{\pm y}$, y Eve mide en la misma base que Alice y Bob después de la reconciliación de bases. Calcula la distribución de las variables $P(a,b,e)$ donde $a$ denota el bit codificado por Alice, y $b$ y $e$ los resultados de medida de Bob y Eve, respectivamente. Calcula también la llamada tasa de error cuántico de bits (en inglés Quantum Bit Error Rate, QBER), definida por la probabilidad de que el resultado de Bob sea diferente de la preparación de Alice cuando las bases coinciden, y la información mutua entre Alice y Bob, $I(A:B)$, y entre Alice y Eve, $I(A:E)$, donde $I(X:Y)=H(A)+H(B)-H(AB)$ y $H(X)=-\sum_x p(x)\log(p(x))$.
`````

Históricamente, los ataques individuales fueron los primeros estudiados en la seguridad de los protocolos criptográficos. El ataque de clonación previo es óptimo en términos de fidelidades porque, para una fidelidad dada en el lado de Bob $F_B$, optimiza el valor de $F_E$. Sin embargo, los ataques individuales no son los más generales porque suponen que Eve (i) interactúa de la misma manera con todas las partículas cuánticas enviadas de Alice a Bob y (ii) mide su partícula al final de la reconciliación de bases. Los ataques individuales, por ejemplo, podrían pasar por alto la posibilidad de que una interacción correlacionada entre rondas del protocolo podría darle a Eve más información, o que Eve podría esperar hasta el final del proceso de destilación de la clave y utilizar toda la información revelada durante el mismo para optimizar su medida, o incluso esperar hasta que se use la clave. De hecho, la prueba de seguridad debería funcionar para la situación más general en la que Eve mantiene su partícula cuántica en una memoria cuántica y no la mide: si se prueba la seguridad para esta situación, la prueba también se sostiene para cualquier medida que Eve pudiera aplicar posteriormente a su sistema cuántico. Los ataques individuales y los más generales se muestran en {numref}`attacks`, donde los mostramos desde el marco de entrelazamiento que se emplea comúnmente para probar la seguridad. Un ataque intermedio que resulta ser muy útil es el llamado *colectivo*, en el que Eve (i) mantiene su información en forma cuántica, es decir, almacena sus partículas cuánticas en una memoria, pero (ii) aplica la misma interacción en cada ronda.

Finalmente, dado que en las situaciones más generales estamos considerando ataques en los que Eve mantiene su información en una forma cuántica, la definición de una clave secreta debe adaptarse a este escenario. De manera informal, un protocolo es capaz de destilar una clave de longitud $k$ siempre que el resultado del protocolo sea un estado $\rho_{ABE}$, es decir, muy cercano al estado ideal.

```{math}
:label: secretkey
\rho_{ABE}^{(k)}=\frac{1}{2}(\proj{00}+\proj{11})_{AB}^{\otimes k}\otimes\proj{E}_E.
```

Aquí: Alice y Bob comparten $k$ bits perfectamente correlacionados que son secretos porque están desacoplados del sistema cuántico de Eve, que se encuentra en algún estado de referencia arbitrario $\ket E$.

```{figure} ./attacks.png
---
height: 400px
name: attacks
---
Estructura de los ataques de espionaje: En los ataques individuales y colectivos, Eve prepara $N$ copias del mismo estado $\ket{\psi}_{ABE}$ y envía una partícula de cada estado a Alice y Bob, quienes las miden. En el caso de los ataques individuales, Eve también aplica la misma medición en cada partícula después de la reconciliación de bases. En un ataque colectivo, Eve guarda sus $N$ sistemas cuánticos en una memoria cuántica para su uso posterior. En un ataque general, Eve prepara un estado conjunto $\ket{\psi^{(N)}}_{\vec A\vec BE}$ y envía las partículas correspondientes a Alice y Bob para sus mediciones, mientras ella conserva un sistema cuántico (posiblemente grande) en una memoria cuántica. Todos los ataques se muestran en el escenario basado en entrelazamiento.
```