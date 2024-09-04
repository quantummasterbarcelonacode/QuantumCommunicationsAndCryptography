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

# Otros Protocolos 

El protocolo BB84 distribuye una clave secreta entre Alice y Bob utilizando estados cuánticos que son preparados por Alice, enviados a través de un canal inseguro y medidos por Bob. Este tipo de protocolo es conocido como *prepara y mide*. Claramente, la construcción es mucho más general que el BB84, y es posible diseñar muchos otros protocolos para la distribución segura de claves basados en esta idea. El objetivo principal de esta sección es presentar algunos de ellos. Se pueden encontrar muchos más protocolos de QKD en la literatura. Aquí, elegimos aquellos que representaron un avance teórico importante.

## B92

La razón principal por la que Eve no puede leer la información codificada en los estados cuánticos enviados es que Alice los elige de un conjunto que contiene estados cuánticos no ortogonales. Al ser no ortogonales, Eve no puede clonarlos ni medirlos todos sin introducir errores detectables. En 1992, Bennett demostró que dos estados no ortogonales son suficientes para QKD de manera segura {cite}`B92`. El interés de este protocolo radica en que es el que involucra el menor número de estados preparados, es decir, dos.

El protocolo funciona de la siguiente manera. Alice codifica un bit aleatorio en dos estados no ortogonales, $\ket{\psi_0}$ y $\ket{\psi_1}$, y envía el estado preparado a Bob a través de un canal inseguro. Nuevamente, el ataque de Eve está limitado por la no ortogonalidad de los estados. Una posible medición simple por parte de Bob es la siguiente: él elige al azar medir en la base definida por $\ket{\psi_0}$ y su estado ortogonal, denotado por $\ket{\psi^\perp_0}$ y tal que $\langle \psi^\perp_0\ket{\psi_0}=0$, o en la base $\{\ket{\psi_1},\ket{\psi^\perp_1}\}$. Cuando Bob obtiene un resultado correspondiente a cualquiera de los estados ortogonales en cualquiera de las dos mediciones, por ejemplo, el resultado correspondiente a $\ket{\psi^\perp_0}$ al medir $\{\ket{\psi_0},\ket{\psi^\perp_0}\}$, sabe que el estado no era $\ket{\psi_0}$ porque $\langle \psi^\perp_0\ket{\psi_0}=0$, y por lo tanto, tiene que ser $\ket{\psi_1}$. En esta reconciliación, Bob anuncia aquellas instancias en las que su medición dio un resultado correspondiente a cualquiera de los estados ortogonales a los preparados por Alice. Una medición más eficiente, pero también más exigente experimentalmente, es la que permite la discriminación inequívoca óptima de los estados $\ket{\psi_0}$ y $\ket{\psi_1}$. 

`````{admonition} Ejercicio 2 - Discriminación inequívoca de dos estados puros no ortogonales
:class: tip
Considera dos estados puros no ortogonales $\ket{\psi_0}$ y $\ket{\psi_1}$, con $\langle \psi_0\ket{\psi_1}>0$. Sin pérdida de generalidad, los dos estados pueden ser rotados para estar en el plano $XZ$ y con el eje $+z$ como bisector, de manera que se escriben:

```{math}
:label: states
\ket{\psi_0}=\left(\begin{array}{c}\cos\theta \\ \sin\theta\end{array}\right) \quad\quad
\ket{\psi_1}=\left(\begin{array}{c}\cos\theta \\ -\sin\theta\end{array}\right),
```

con $0<\theta\leq\pi/4$. Sea $\ket{\psi}$ un estado desconocido elegido entre estos dos con probabilidad igual. Considera una medición de tres resultados, definida por los operadores:

```{math}
:label: povm
M_0=\mu\proj{\psi_1^\perp} \quad\quad  M_1=\mu\proj{\psi_0^\perp}   \quad\quad  M_?=\one-M_0-M_1 ,
```

donde $\ket{\psi_i^\perp}$ denota el estado ortogonal a $\ket{\psi_i}$.

a) Encuentra el rango de valores de $\mu$ para que la medición esté bien definida, es decir, para que los tres operadores de medición sean positivos semidefinidos.

b) Para este valor de $\mu$, calcula las probabilidades de obtener los tres resultados para cada uno de los dos estados. ¿Cuál es el significado operacional de esta medición de tres resultados?

c) Finalmente, determina el valor de $\mu$ que minimiza la probabilidad promedio de obtener el tercer resultado, es decir:
```{math}
:label:
P_?=\frac{1}{2}\left(p(?|0)+p(?|1)\right) .
```
¿Cómo se relaciona con la superposición entre los dos estados?
`````

## Protocolo de Seis Estados

El protocolo de seis estados, introducido por BruÃŸ {cite}`6state`, sigue una dirección opuesta: involucra más estados para dificultar el ataque de Eve. En el protocolo BB84, solo se utilizan cuatro estados que pertenecen a un determinado ecuador en la esfera de Bloch, digamos el plano $xy$. Sin embargo, se podrían considerar protocolos más elaborados en los que Alice prepare estados que estén mejor distribuidos sobre la esfera. Esta es precisamente la idea principal detrás del protocolo de seis estados: Alice prepara un estado del conjunto de seis estados $\{\ket{\pm x},\ket{\pm y},\ket{\pm z}\}$. Bob mide ahora a lo largo de estas tres bases, $x$, $y$ y $z$. Claramente, después de la reconciliación de bases, se asume que Alice y Bob derivan una lista de bits perfectamente correlacionados. Desde el punto de vista de Eve, su tarea se vuelve más compleja ya que tiene que clonar o distinguir entre más estados no ortogonales. Sin embargo, desde el punto de vista de Alice y Bob, solo 1/3 de las rondas se mantienen después de la reconciliación de bases. Después de todo, la mejora en seguridad es moderada, mientras que en algunas implementaciones los requisitos tecnológicos para preparar los seis estados son más exigentes, por lo que el protocolo apenas se ha adoptado en la práctica.

## Protocolo de Goldenber-Vaidman

El último protocolo que presentamos en esta sección fue introducido por Goldenberg y Vaidman {cite}`vaidman`. El protocolo utiliza entrelazamiento y demuestra que la distribución segura de claves aún es posible utilizando dos estados ortogonales si estos dos estados se utilizan de manera cuidadosa. La idea del protocolo es la siguiente: Bob prepara un estado entrelazado de dos cúbits, $\ket{\Phi^+}=(\ket{00}+\ket{11})/\sqrt 2$. Envía solo una de las partículas a Alice. Alice ahora no aplica nada, es decir, $\one$ o $\sigma_z$ dependiendo del bit que quiere transmitir, y envía el cúbit de vuelta a Bob. Los dos estados, dependiendo del bit aleatorio de Alice, son $\ket{\Phi^\pm}$,  donde ahora $\ket{\Phi^-}=(\ket{00}-\ket{11})/\sqrt{2}$. Al recibirlo, Bob puede discriminar perfectamente entre estos dos estados y leer el resultado porque son ortogonales. Aunque la codificación de la información por Alice genera dos estados ortogonales, Eve no puede aprovechar este hecho. Ella solo tiene acceso a una de las dos partículas cuánticas preparadas y transmitidas por Bob, mientras que la otra partícula siempre permanece en el laboratorio de Bob, y por lo tanto nunca está accesible para Eve. Esto hace que la medición cuántica por parte de Eve sobre los dos estados ortogonales sea imposible. De hecho, el cúbit al que Eve puede acceder siempre está en el estado reducido de $\ket{\Phi^\pm}$, igual a $\one/2$ para ambos estados, lo que garantiza la seguridad del protocolo. 

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```
