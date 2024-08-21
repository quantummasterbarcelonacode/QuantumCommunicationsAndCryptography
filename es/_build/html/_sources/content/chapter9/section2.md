```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Corrección de Errores Cuánticos

Adaptar la corrección de errores al mundo cuántico no es fácil. La corrección de errores se basa en la redundancia, la repetición del mensaje, y sabemos que la información cuántica no puede ser clonada. Además, al decodificar, Bob debería realizar una medición para leer el estado recibido y luego decidir cómo decodificar. Pero las mediciones cuánticas perturban el estado del sistema, por lo que parece que el proceso de decodificación también introducirá errores. De hecho, en los primeros días de la teoría de la información cuántica, investigadores prominentes dudaban de la posibilidad de la corrección de errores cuánticos {cite}`haroche`.

Como mostraron por primera vez Shor y Steane en {cite}`errcorr1,errcorr2`, la corrección de errores cuánticos es posible. Este avance se basó en una ingeniosa traducción de las técnicas clásicas conocidas al formalismo cuántico, donde nuevamente $m$ cúbits lógicos son codificados en palabras clave formadas por $n$ cúbits físicos: $(m=1,n=7)$ en el esquema de Steane y $(m=1,n=9)$ en el esquema de Shor. Ahora, con este conocimiento, podemos reformular la discusión anterior sobre la corrección de errores en términos cuánticos. Dado un canal descrito por un mapa CPTP $\Lambda$, Alice codifica un mensaje de $m$ cúbits en $n$ cúbits físicos a través de una isometría $\mathcal E$ que mapea cualquier estado $\ket\psi\in\compl^{\otimes m}$ a $\ket{\psi'}=\mathcal E \ket{\psi}\in\compl^{\otimes n}$. Estos $n$ cúbits ahora se envían a través del canal ruidoso, por lo que Bob recibe el estado mixto de $n$ cúbits $\rho'=\Lambda^{\otimes N}(\proj{\psi'})$. Bob aplica un mapa de decodificación $\mathcal D$ a este estado, obteniendo $\rho=\mathcal D(\rho')$. El objetivo del protocolo es que este estado sea $\epsilon$ cercano al estado codificado $\ket\psi$, es decir, que se cumpla $\bra\psi\rho\ket\psi\geq 1-\epsilon$ para un umbral de error dado $\epsilon$.

Está fuera del alcance de estas notas dar una explicación detallada de la corrección de errores cuánticos. Sin embargo, proporcionamos a continuación un esquema simple que muestra cómo mejorar la tasa de error del canal ruidoso

```{math}
:label:
\Lambda_x(\rho)=(1-p_x)\rho+p_x\sx\rho\sx ,
```

un canal para el cual, con probabilidad $1-p_x$ el estado no cambia, mientras que el bit sea invertido $\sx$ ocurre con probabilidad $p_x$. Es un canal bastante académico, pero es suficiente para ilustrar cómo funcionan las técnicas de corrección de errores cuánticos.

El objetivo es presentar un proceso de codificación y decodificación que haga el análogo del simple código de repetición clásico $1\rightarrow 3$ descrito anteriormente. Una representación de este esquema se muestra en {numref}`errc`. El cúbit inicial que se va a transmitir está en un estado arbitrario $\ket\psi=\alpha\ket 0 +\beta\ket 1$. Alice los codifica en un estado de tres cúbits mediante la isometría en la que añade dos nuevos cúbits en estado $\ket 0$ y realiza dos operaciones CNOT como se muestra en {numref}`errc`. El estado resultante es $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. Cabe destacar que de alguna manera se logra la repetición $1\rightarrow 3$ manteniendo las coherencias en el estado. Este estado ahora se envía a través del canal, por lo que el estado que recibe Bob es $\rho'=\Lambda_x^{\otimes 3}(\proj{\psi'})$. Es fácil ver que este estado se puede escribir como

```{math}
:label:
\rho'=(1-p_x)^3\rho'_0+3(1-p_x)^2p_x\rho'_1+3(1-p_x)p_x^2\rho'_2+p_x^3\rho'_3 ,
```

donde

```{math}
:label:
&&\rho'_0=\proj{\psi'}\nonumber\\
&&\rho'_1=\frac{1}{3}\left(\sx\otimes\one\otimes\one\proj{\psi'}\sx\otimes\one\otimes\one+\one\otimes\sx\otimes\one\proj{\psi'}\one\otimes\sx\otimes\one\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\one\otimes\sx \proj{\psi'} \one\otimes\one\otimes\sx\right) \nonumber\\
&&\rho'_2= \frac{1}{3}\left(\sx\otimes\sx\otimes\one \proj{\psi'} \sx\otimes\sx\otimes\one + \sx\otimes\one\otimes\sx \proj{\psi'} \sx\otimes\one\otimes\sx\right.\nonumber\\
&\quad&\left.\quad\quad+\one\otimes\sx\otimes\sx \proj{\psi'} \one\otimes\sx\otimes\sx\right) \nonumber\\
&&\rho'_3= \sx\otimes\sx\otimes\sx \proj{\psi'} \sx\otimes\sx\otimes\sx ,
```

es decir, todos los diferentes términos donde ocurren cero, uno, dos o tres errores. Note las analogías con el caso clásico. Ahora, el objetivo es diseñar un mapa que corrija todos los casos con cero y un error, es decir, $\mathcal D(\rho'_0)=\mathcal D(\rho'_1)=\proj\psi$. El circuito en {numref}`errc`  logra esto, como vamos a mostrar para cada uno de los estados puros que aparecen en estos estados mixtos.

```{figure} ./errcorr.png
---
height: 400px
name: errc
---
Corrección de errores cuánticos: La figura muestra un ejemplo simple de operaciones de codificación y decodificación que corrigen como máximo un bit invertido. Las mediciones en el cuarto y quinto cúbit informan a Bob sobre qué operaciones unitarias $U_1$, $U_2$ y $U_3$ implementar para corregir el error en uno (o ninguno) de los tres cúbits físicos que codifican el cúbit lógico en el estado $\ket{\psi}$.
```

- Sin errores: Bob recibe el estado codificado
    $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$. Se puede ver que el estado después de agregar los dos cúbits adicionales y realizar las CNOT en la parte de corrección de errores es $(\alpha\ket{000}+\beta\ket{111})\ket{00}$. Las mediciones de los dos últimos cúbits dan $00$. Básicamente, este circuito deja el estado en los primeros tres cúbits sin cambios, ya que están controlando el resultado de las puertas CNOT, mientras que los dos bits obtenidos en la medición, ver {numref}`errc`, extraen la información sobre el error: informan si el cúbit 1 y el cúbit 2 son idénticos, o si el cúbit 1 y el cúbit 3 son iguales. En el presente caso, dado que el resultado es 00, Bob deduce que los tres cúbits son iguales. Esto es compatible con ningún error o tres errores, pero es más probable el primero, por lo que no hace nada, $U_1=U_2=U_3=\one$. El estado que entra en la parte final de decodificación es nuevamente  $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, que se mapea a $\ket{\psi}=\alpha\ket{0}+\beta\ket{1}$ mediante las dos últimas operaciones CNOT y mediciones. De hecho, estas dos últimas mediciones no son realmente necesarias.
- Error en el primer cúbit: Bob recibe el estado
    $\alpha\ket{100}+\beta\ket{011}$. Después de la serie de puertas CNOT, se obtiene $(\alpha\ket{100}+\beta\ket{011})\ket{11}$. Las dos mediciones en los últimos dos cúbits dan 11. Esto informa a Bob que el cúbit 1 es diferente del 2, y también del 3. Si hubo solo un error, Bob sabe que debe corregir el primer cúbit, por lo que aplica $U_1=\sigma_x$ y $U_2=U_3=\one$. El estado resultante es nuevamente $\ket{\psi'}=\alpha\ket{000}+\beta\ket{111}$, por lo que la parte final de decodificación proporciona el estado inicial.
- Error en el segundo cúbit: Bob recibe el estado
    $\alpha\ket{010}+\beta\ket{101}$. El razonamiento procede como
se explicó anteriormente, pero ahora el estado antes de la primera medición es $(\alpha\ket{010}+\beta\ket{101})\ket{10}$. Las mediciones dan 10 e informan a Bob que el segundo cúbit es diferente de los otros dos, por lo tanto, lo corrige, $U_2=\sigma_x$ y $U_1=U_3=\one$. La última parte es idéntica a la del paso anterior.
- Error en el tercer cúbit: Bob recibe el estado
    $\alpha\ket{001}+\beta\ket{110}$. Igual que antes, pero ahora las
mediciones en el cuarto y quinto cúbit dan 01, por lo que Bob infiere que el tercer cúbit es incorrecto y aplica $U_3=\sigma_x$ y
    $U_1=U_2=\one$.

Este esquema simple ilustra cómo funciona la corrección de errores cuánticos: (i) Alice codifica los $m$ cúbits lógicos iniciales en palabras código cuánticas hechas de $n$ cúbits físicos; (ii) después de la propagación a través del canal, algunos de los cúbits son medidos, proporcionando a Bob información sobre los errores ocurridos en el canal; (iii) el error se corrige y el estado cuántico original se decodifica. Un método real de corrección de errores cuánticos debería corregir no solo errores de bit, $\sigma_x$, sino también errores de fase, $\sigma_z$, y cualquier combinación arbitraria de ellos. Como se mencionó, tales esquemas existen y constituyen una primitiva básica en cualquier implementación de procesamiento de información cuántica, especialmente con fines en computación cuántica.

Ahora tenemos todos los ingredientes para definir la capacidad cuántica $\text{QC}$ de un canal cuántico $\Lambda$. Primero, para $n$ usos del canal, definimos $m^*(n,\epsilon)$ como el número máximo de cúbits que se pueden transmitir con un error $\epsilon$. Esto significa que existen mapas de codificación y decodificación, $\mathcal E$ y $\mathcal D$, tales que para todos los $\ket\psi\in\compl^{\otimes m}$, se tiene $\bra\psi\rho\ket\psi\geq 1-\epsilon$, donde $\rho=(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)$. Luego, la capacidad cuántica del canal se define como en la Ec. {eq}`capacity`, con esta nueva definición de $m^*(n,\epsilon)$.

Aunque la definición formal de capacidades para canales clásicos y cuánticos parece casi idéntica, hay varias diferencias importantes. Primero, y contrario a lo que sucede en el caso clásico, existen canales con capacidad cuántica cero, $\text{QC}=0$, aunque el estado recibido por Bob depende de la preparación de Alice. Los ejemplos más sencillos de este tipo de canales son los denominados canales bipartitos. Estos son canales $\Lambda$, digamos $A\rightarrow B$, tal que existe otro canal $\tilde\Lambda$ donde $A\rightarrow B_1B_2$ con la propiedad que, para todos los estados de entrada $\rho$, uno tiene $\tr_1(\tilde\Lambda(\rho))=\tr_2(\tilde\Lambda(\rho))=\Lambda(\rho)$. De hecho, supongamos que el canal original era tal que $\text{QC}>0$. Esto significaría que existen operaciones de codificación y decodificación tales que $\bra\psi(\mathcal D\circ\Lambda^{\otimes n}\circ\mathcal E)(\proj\psi)\ket\psi\geq 1-\epsilon$. Ahora, podríamos aplicar entonces la codificación a un estado $\ket\psi$, usarlo como entrada para $\tilde\Lambda$ y aplicar un mapa de decodificación a los estados de salida $B_1$ y $B_2$,obteniendo dos copias del estado inicial de calidad arbitrariamente buena, y por lo tanto violando el teorema de no clonación. Es decir, el teorema de no clonación implica la existencia de canales no triviales con capacidad cuántica cero. Cabe destacar que existen ejemplos muy naturales de canales bipartitos, posiblemente el más simple sea un canal con pérdida en el cual un estado se transmite con probabilidad $1/2$ desde $A$ hasta $B$. Se puede compartir trivialmente por un canal en el cual el estado se transmite ya sea a $B_1$ y $B_2$ con probabilidad $1/2$. Recordemos que este canal aparece en comunicaciones por fibra óptica y, de hecho, se obtiene una transmisión inferior a $1/2$ a una distancia relativamente corta. Esto implica que la corrección de errores cuánticos tiene un uso limitado para fines de comunicación cuántica.

En segundo lugar, en el caso cuántico, no sabemos si existe una fórmula de una sola letra para la capacidad del canal cuántico y, de hecho, es concebible que no exista. En tercer lugar, y esto está relacionado con el punto anterior, la capacidad cuántica no es aditiva {cite}`smithyard`: existen canales cuánticos $\Lambda_1$ y $\Lambda_2$ tal que (i) $\text{QC}(\Lambda_1)=\text{QC}(\Lambda_2)=0$, pero (ii) $\text{QC}(\Lambda_1\otimes\Lambda_2)>0$. En otras palabras, dos canales que individualmente no son útiles para enviar comunicación cuántica se vuelven útiles cuando se combinan. Esta asombrosa propiedad de la información cuántica es, de hecho, más común de lo inicialmente esperado, ya que hay varios escenarios operativos en los que las propiedades de la información cuántica no son aditivas, siendo la capacidad cuántica uno de los ejemplos más famosos. Esta propiedad de no aditividad a veces se encapsula en la curiosa fórmula $0+0>0$.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


