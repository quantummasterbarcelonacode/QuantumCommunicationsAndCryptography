```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
\def\proj#1{\ket{#1}\!\bra{#1}}
```

# Comunicación Cuántica Basada en Entrelazamiento

La corrección de errores cuánticos ofrece una solución para resolver las imperfecciones en el canal. Sin embargo, si los errores en el canal son demasiado grandes, no existirá un código de corrección de errores cuánticos que permita una transmisión fiable de información cuántica a través del canal. Como se mencionó, esto contrasta fuertemente con lo que sucede con la información clásica: incluso si los errores en el canal son muy grandes, siempre existe un proceso de codificación y decodificación que permite una transmisión libre de errores. Al tratar con canales cuánticos, la corrección de errores puede ser imposible incluso en situaciones donde el estado cuántico de Bob está correlacionado con el estado inicial de Alice. Por lo tanto, el problema de la comunicación cuántica a larga distancia debe explorar otros métodos, y la solución nuevamente se obtiene a través del entrelazamiento.

Antes de proceder, es importante destacar que en un escenario de comunicación cuántica, si las partes están inicialmente en un estado maximalmente entrelazado, digamos de dos cúbits como en la Ec. {eq}`bellstate`, entonces Alice puede enviar perfectamente un cúbit a Bob mediante la teleportación cuántica {cite}`teleportation`. Al final de este protocolo, el entrelazamiento se destruye, por lo que compartir un estado maximalmente entrelazado es equivalente, en este contexto, a usar una vez el canal de identidad $\Lambda(\rho)=\rho$, es decir, un canal perfecto sin errores. Veamos ahora cómo hacer uso de esta idea.

Si Alice y Bob están conectados por un canal $\Lambda$, digamos de un cúbit, y Alice está pensando en usar teleportación, ella puede intentar establecer entrelazamiento con Bob preparando localmente un estado entrelazado de dos cúbits y luego enviando la mitad de él a través del canal. Al final de este proceso, Alice y Bob comparten el estado

```{math}
:label:
\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+}) .
```

Ahora, supongamos que este estado puede ser transformado mediante LOCC en un estado maximalmente entrelazado con alguna probabilidad $p$. Este proceso se llama *destilación de entrelazamiento*. Luego, el estado maximalmente entrelazado resultante puede usarse para teleportar un cúbit de manera confiable de Alice a Bob. Si repiten este proceso $n$ veces, Alice y Bob obtendrán determinísticamente del orden de $np$ estados máximalmente entrelazados, y por lo tanto podrán transmitir del orden de $np$ cúbits.

Este procedimiento funciona para canales bipartitos, donde la corrección de errores cuánticos no es útil. Un ejemplo simple es el canal con coeficiente de transmisión $1/2$. De hecho, funciona para cualquier canal con pérdidas con una transmisión $\eta_C$. Al enviar la mitad de un estado maximalmente, digamos codificado en dos fotones, a través de él, Alice y Bob terminan con el estado 

```{math}
:label:
\rho_{AB}=\eta_C\proj{\Phi^+}+(1-\eta_C)\frac{\one}{2}\otimes\proj\varnothing ,
```

donde $\ket\varnothing$ es el estado asociado al fotón perdido. Ahora, Bob puede implementar la medición de dos salidas descrita por los operadores de Kraus

```{math}
:label:
A_{\text{ok}}=\proj 0+\proj 1, \quad A_{\text{loss}}=\proj\varnothing .
```

Esto no es mas que Bob observando si la partícula que codifica la mitad del estado maximalmente entrelazado, en nuestro ejemplo el fotón, ha pasado a través del canal sin ser destruida. Es un ejemplo de las llamadas mediciones cuánticas no destructivas, que son desafiantes, pero posibles. Está claro que cuando Bob obtiene el resultado $r=\text{ok}$, lo cual ocurre con una probabilidad $\eta_C$, el estado entre Alice y Bob se proyecta en $\ket{\Phi^+}$.
 
Este resultado muestra que la información cuántica puede ser transmitida a través de cualquier canal con pérdidas, con una tasa que va al menos como $\eta_C$. Esto no contradice el resultado anterior utilizando corrección de errores cuánticos. De hecho, la expresión anterior para la capacidad del canal cuántico se definió en términos de protocolos de corrección de errores cuánticos en los cuales la información solo va de Alice a Bob. Esto implica que nuestra definición anterior encapsulaba de hecho la llamada capacidad de comunicación unidireccional, denotada por $\textbf{QC}^\rightarrow$. En particular, esta capacidad es cero para canales bipartitos. Sin embargo, en el protocolo anterior, usando destilación de entrelazamiento, Bob necesita comunicarse con Alice para informarle sobre el resultado de su medición, y este mensaje va en la dirección opuesta. Un protocolo más general podría de hecho involucrar varias rondas de comunicación clásica de Alice a Bob y viceversa. Para tener en cuenta esta posibilidad, definiremos a continuación la capacidad cuántica bidireccional $\text{QC}^\leftrightarrow$. 
 
La discusión anterior muestra que el problema de la comunicación cuántica a larga distancia está íntimamente relacionado con el problema de la destilación de entrelazamiento a través del canal. De hecho, imagina que el canal permitiera la distribución de estados que son destilables, es decir, que Alice y Bob pudieran establecer después de $n$ usos del canal un estado que pueda ser transformado en $m$ estados maximalmente entrelazados de dos cúbits. Entonces, estos $n$ usos permitirían el intercambio de $m$ cúbits a través de la teleportación. Por otro lado, imagina que, usando $n$ veces el canal, Alice y Bob pudieran distribuir de manera confiable $m$ cúbits. Entonces, Alice podría aplicar este protocolo para enviar de manera confiable las $m$ mitades de $m$ estados maximalmente entrelazados a Bob, distribuyendo así perfectamente el entrelazamiento.
Por lo tanto, se sigue que la capacidad cuántica bidireccional se puede definir como sigue: considera $n$ usos del canal actuando en las $n$ mitades de $n$ estados maximalmente entrelazados, resultando en un estado igual a $n$ copias de $\rho_{AB}=(\one\otimes\Lambda)(\proj{\Phi^+})$. Ahora, define $m^*(n,\epsilon)$ como el número máximo $m$ de estados maximalmente entrelazados que se pueden destilar de este estado mediante LOCC con un error $\epsilon$, es decir, $^{\otimes m}\bra{\Phi^+}\text{LOCC}(\rho_{AB}^{\otimes n})\ket{\Phi^+}^{\otimes m}\geq 1-\epsilon$. Entonces, la capacidad cuántica bidireccional se define como en {eq}`capacity`. Por ejemplo, se sigue de lo dicho anteriormente que un canal con pérdidas tiene $\text{QC}^\leftrightarrow>\text{QC}^\rightarrow=0$, lo que demuestra la ventaja de las estrategias de comunicación bidireccional.

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```


