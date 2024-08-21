# Fundamentos de la Mecánica Cuántica 
# 

El objetivo de esta primera sección es introducir los postulados básicos de la mecánica cuántica y su estructura matemática. La mayor parte del formalismo presentado aquí se puede encontrar en el Capítulo 2 de {cite}`nielsen2010quantum`. 
La álgebra lineal es el estudio de los espacios vectoriales y de los operadores lineales que actúan sobre esos espacios. De hecho, toda la maquinaria cuántica es fundamentalmente álgebra lineal en un espacio de Hilbert complejo, representada por la notación menos estándar de Dirac. En esta notación, 

- $\ket{\psi}$ representa un vector columna, también conocido como ket.
- $\bra{\psi}$ representa el vector dual de $\ket{\psi}$, también conocido como bra.
- $\braket{\phi|\psi}$ es el producto escalar estándar entre dos vectores $\ket{\phi}$ y $\ket{\psi}$.

La norma de un vector $\ket{\psi}$ se define como $||\psi||$ = $\sqrt{\braket{\psi|\psi}}$. En general, la mayoría de las aplicaciones de la Información Cuántica (IC) tratan con espacios complejos de dimensión finita $d$, denotados por $\mathbb{C}^d$. 

`````{admonition} Ejemplo
:class: note

Dado dos vectores en un espacio complejo bidimensional, denotado por $\mathbb{C}^2$, 

```{math}
:label:
\ket{\psi} = \begin{pmatrix}1 \\ i\end{pmatrix} \qquad \ket{\phi} = \begin{pmatrix}−3i \\ −1\end{pmatrix},
```

```{math}
:label:
\ket{\psi} = \begin{pmatrix}1 \\ i\end{pmatrix} \qquad \ket{\phi} = \begin{pmatrix}−3i \\ −1\end{pmatrix},
```

se tiene 

```{math}
:label:
\bra{\psi} = (1 \quad −i) \qquad \bra{\phi} = (3i \quad −1), \\\\
\braket{\phi|\psi} = (3i \quad −1) \begin{pmatrix} 1 \\ i \end{pmatrix} = 2i.
```
`````

## Estados puros 
El primer postulado de la Mecánica Cuántica establece que cada sistema físico está asociado a un espacio de Hilbert complejo (un espacio vectorial con un producto interno). El estado del sistema se describe mediante un vector normalizado en este espacio. En cambio, cualquier vector normalizado en el espacio representa un posible estado del sistema físico. Por lo tanto, toda la información sobre un sistema físico aislado puede especificarse mediante un vector en un espacio de Hilbert. Se deduce de este postulado y de la definición de un espacio vectorial que si $\ket{\psi_1}, \ket{\psi_2} \in \mathbb{C}^d$ son dos posibles estados de un sistema, entonces cualquier superposición lineal de estos dos vectores, $\ket{\psi} = \alpha\ket{\psi_1} + \beta \ket{\psi_2}$, es un vector válido y, por lo tanto, también representa un estado válido del sistema. Aquí, α y β son números complejos tales que $||\psi|| = 1$. Esto también se conoce como el principio de superposición y $\ket{\psi}$ a menudo se llama una superposición coherente de $\ket{\psi_1}$ y $\ket{\psi_2}$.

## Sistemas compuestos 
Considera ahora dos sistemas físicos, $A$ y $B$, cada uno descrito por el espacio de Hilbert correspondiente, $\mathcal{H}_A$ y $\mathcal{H}_B$. El espacio de Hilbert asociado al sistema global $AB$, denotado por $\mathcal{H}$, consiste en el producto tensorial de los dos espacios locales, $\mathcal{H} = \mathcal{H}_A \otimes \mathcal{H}_B$. Este es otro postulado de la Mecánica Cuántica.

## Entrelazamiento
Las consecuencias de estos dos postulados iniciales son inmensas. De hecho, considera dos posibles estados del sistema global, $\mathcal{H}_A \otimes \mathcal{H}_B$: $\ket{\psi_A}\otimes\ket{\psi_B}$ y $\ket{\phi_A}\otimes\ket{\phi_B}$, o más brevemente $\ket{\psi_A \psi_B}$ y $\ket{\phi_A \phi_B}$. Entonces, $\ket{\Psi} = \alpha\ket{\psi_A \psi_B} + \beta\ket{\phi_A \phi_B}$ también representa un posible estado del sistema compuesto $AB$. Sin embargo, este estado en general no siempre puede escribirse como el producto tensorial de dos vectores en cada espacio local, es decir, $\ket{\Psi} \ne \ket{\varphi_A \varphi_B}$. En este caso, se dice que $\ket{\Psi}$ está entrelazado. El entrelazamiento aparece entonces como una consecuencia de la estructura del producto tensorial y del espacio vectorial en la Mecánica Cuántica.

## Evolución unitaria 
La evolución de un sistema físico aislado, cuyo estado inicial está dado por $\ket{\psi}$, se describe mediante la aplicación de una operación unitaria, $U$. Así, el estado evolucionado del sistema es $\ket{\phi} = U \ket{\psi}$. Recuerda que este es otro postulado de la Mecánica Cuántica. Una operación unitaria en un espacio de Hilbert de dimensión $d$ es simplemente una matriz compleja $d \times d$ que satisface $U U^\dagger = \mathbb{1}$.

## Estados mixtos
Considera la descripción anterior del entrelazamiento: un estado está entrelazado cuando no puede escribirse en forma de producto. Es decir, aunque el estado global del sistema puede describirse mediante un vector en $\mathcal{H}_A ⊗ \mathcal{H}_B$, es imposible asociar a cada sistema local un vector en $\mathcal{H}_A$ y $\mathcal{H}_B$. Esto está relacionado con el hecho de que el sistema A está correlacionado con B, por lo que no está aislado. ¿Existe una manera matemática de describir sistemas no aislados?

Alternativamente, considera el caso en el que la preparación de un sistema es imperfecta, es decir, el sistema puede estar en el estado $|ψ_1〉$ con probabilidad $p_1$, $|ψ_2〉$ con probabilidad $p_2$, y así sucesivamente. ¿Cuál es la descripción matemática del estado del sistema? Observa que en ambos casos hay una falta de conocimiento sobre el estado del sistema. Esto es evidente en el segundo escenario, ya que la preparación es ruidosa. Pero lo mismo es cierto en el primer caso: al intentar describir el estado local de un sistema no aislado, se ignoran todas las correlaciones con otros sistemas o el entorno. Dado que la información sobre el estado del sistema no es completa, el estado no puede ser puro. Para tener en cuenta esta falta de información, se introduce el concepto de estados mixtos.

La descripción matemática de un sistema que puede estar en el estado $|ψ_i〉∈ \mathcal{H}$ con probabilidades $p_i$, donde $i = 1, ..., N$ y $N$ es arbitrario, ya no está dada por un vector en este espacio de Hilbert, sino por un operador que actúa sobre él con la forma

```{math}
:label:
ρ = \sum^N_{i=1} p_i |ψ_i〉〈ψ_i|. 
```

Observa que $\text{tr}(ρ) = ∑ p_i \text{tr}(|ψ_i〉〈ψ_i|) = \sum_i p_i 〈ψ_i|ψ_i〉 = \sum_i p_i = 1$. Si el estado es puro, $\ket{\psi}$, solo hay una probabilidad no nula, $p_1 = 1$, y $ρ = \ket{\psi}〈ψ|$. De forma más general, un estado $ρ$ es puro si y solo si $\text{tr}(ρ^2) = 1$.

## Evolución ruidosa 
Habiendo introducido el formalismo de estados mixtos, se puede especificar cómo evoluciona un sistema cuántico abierto, o cómo describir una evolución ruidosa. En este caso, un sistema cuántico en un estado puro puede perder su pureza y volverse mixto. El formalismo general está dado por mapas completamente positivos que conservan la traza. De hecho, cualquier evolución de un estado inicial (posiblemente mixto), $ρ_i$, a un estado $ρ_f$, puede representarse como

```{math}
:label:
ρ_f = \sum_k A_k ρ_i A^†_k,
```

donde $A_k$ son operadores tales que $∑_k A_k A_k^† = \mathbb{1}$. Nota que $ρ_f$ tiene traza uno, es Hermítico y es positivo semidefinido (tiene únicamente valores propios no negativos).

## Medición
El último proceso a considerar es una medición. Cualquier medición con $m$ resultados en un sistema cuyo espacio de Hilbert asociado tiene dimensión $d$ puede ser representada por el llamado medida de valor de operador positivo (POVM, por sus siglas en inglés), definida por $r$ operadores positivos ${M_i ≥ 0}$, donde $i = 1, ..., r$, tales que $\sum_i M_i = \mathbb{1}$. Denotemos por $ρ$ el estado a medir. Entonces, el resultado $i$ se obtiene con probabilidad $p(i|ρ) = \text{tr}(ρ M_i)$. Este valor es positivo porque $M_i$ son positivos. También se deduce que $\sum_i p(i|ρ) = \sum_i \text{tr}(ρ M_i) = \text{tr}(ρ \sum_i M_i) = \text{tr}(ρ) = 1$.

## Evolución general 
Reuniendo todos los procesos anteriores, una evolución general, que consiste en una secuencia de mediciones y posiblemente evoluciones ruidosas, siempre puede ser especificada por un conjunto de operadores $A^i_k$ que describe un mapa que transforma cualquier estado $ρ$ en

```{math}
:label: eqnref5
ρ_i = \frac{\sum_k A^i_k ρ A^{i†}_k}{\text{tr}(\sum_k A^i_k ρ A^{i†}_k)} \quad \text{with probability} \quad p_i = \text{tr}(\sum_k A^i_k ρ A^{i†}_k).
```

Las mediciones estándar de von Neumann están cubiertas por el
formalismo anterior. Una medición de von Neumann, o medición
proyectiva de rango uno, en un sistema de dimensión $d$ tiene
$d$ resultados posibles y los operadores correspondientes son
los proyectores sobre una base en este espacio. Más
precisamente: considera una base en $\mathbb{C}^d$, definida
por $d$ vectores ortonormales $|i〉$ tales que $〈i|j〉= δ_{ij}$. Una medición en esta base está representada por los
proyectores $A_i = |i〉〈i|$. Nota que si el estado inicial
es $ρ$, la probabilidad de obtener el resultado $i$, véase la
Ec. [](eqnref5), es

```{math}
:label:
p_i = \text{tr}(|i〉〈i|ρ|i〉〈i|) = 〈i|ρ|i〉,
```

mientras que el estado se mapea a 

```{math}
:label:
ρ_i = \frac{|i〉〈i|ρ|i〉〈i|}{\text{tr}(|i〉〈i|ρ|i〉〈i|)} = |i〉〈i|.
```

Para el caso de estados puros, ρ = $\ket{\psi}\bra{\psi}$, estas expresiones se escriben como 

```{math}
:label:
p_i = \text{tr}(|i〉〈i|\ket{\psi}〈ψ||i〉〈i|) = |〈i\ket{\psi}|^2,
```

y 

```{math}
:label:
|ψ_i〉 = |i〉,
```

es decir, el estado inicial $\ket{\psi}$ colapsa en $|i〉$ con una probabilidad dada por el cuadrado de la superposición, $|〈i\ket{\psi}|^2$. Las fórmulas anteriores también implican que no hay ninguna medición (proceso físico) que distinga $\ket{\psi}$ de $e^{iγ} \ket{\psi}$. De esta manera, el estado de un sistema físico está en realidad descrito por un vector en un espacio de Hilbert, salvo por una fase global irrelevante.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```