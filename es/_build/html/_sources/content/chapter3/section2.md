# El Protocolo BB84

Después de introducir la idea de la QKD, presentamos el primer protocolo, introducido en 1984 por Bennett y Brassard y conocido como BB84 {cite}`BB84`. Recordemos que el objetivo del protocolo es establecer una clave secreta compartida, que luego se utiliza para ejecutar el protocolo de libreta de un solo uso. En el caso de BB84, la clave se establece de la siguiente manera:

- Alice elige aleatoriamente uno de los cuatro estados posibles
    ```{math}
    :label: bb84enc
    \ket{\pm x}=\frac{1}{\sqrt 2}(\ket 0\pm\ket 1)\quad
    \ket{\pm y}=\frac{1}{\sqrt 2}(\ket 0\pm i\ket 1) .
    ```
- El bit 0 (1) se codifica en $\ket{+x}$ y $\ket{+y}$ ($\ket{-x}$ y $\ket{-y}$). Los vectores $\ket{\pm x}$ y
$\ket{\pm y}$ definen las bases llamadas $x$ y $y$.
- Bob mide aleatoriamente en una de estas dos bases y asigna su resultado a un bit clásico utilizando la misma convención que Alice.
- Alice y Bob anuncian las bases utilizadas en la preparación y la medición, respectivamente. En caso de que las bases coincidan, los resultados producidos por el protocolo se conservan; de lo contrario, se descartan. Este proceso se conoce como reconciliación de bases.

Observa que si las bases de Alice y Bob coinciden, sus bits están perfectamente correlacionados. Por otro lado, si las bases son diferentes, la preparación de Alice y el resultado de Bob están completamente descorrelacionados. De hecho, supongamos que Alice ha enviado $\ket{\pm x}$ y Bob mide en la base $y$. Él obtendrá el resultado correspondiente a $\ket{\pm y}$ con una probabilidad $p(\pm y|\pm x)=|\langle \pm x\ket{\pm y}|^2=1/2$. Esto equivale a que Bob descarte el estado de Alice y lance una moneda. Por lo tanto, después de la reconciliación de bases, Alice y Bob descartan todas las instancias incorrectas y comparten una lista de bits aleatorios perfectamente correlacionados. Antes de continuar, nota que Alice y Bob pueden usar cualquier par de bases en la esfera de Bloch que satisfagan la condición de superposición anterior. Las bases $x$ e $y$ aparecieron en la formulación original del protocolo, pero igualmente se podría formular usando las bases $x$ y $z$. De hecho, esta elección es equivalente y a menudo más simple en términos de notación.

Analicemos brevemente por qué Eve no puede romper este protocolo. Ella debe interactuar con la partícula cuántica, digamos un fotón, que codifica la información mientras se propaga hacia Bob. El teorema de la no clonación implica que no puede hacer una copia perfecta de dicha partícula, reenviar la primera copia a Bob y quedarse con la segunda. Sin embargo, puede intentar medir el estado cuántico de la partícula y leer la información. No obstante, en este momento del protocolo, ella no conoce la base elegida por Alice. Consideremos primero que Eve mide en la base correcta. En ese caso, obtiene toda la información y puede preparar una nueva copia del estado para enviarla a Bob. Eve obtiene toda la información sobre el símbolo de Alice y no introduce errores en el lado de Bob. Ahora, consideremos el caso en el que la base de medición utilizada por Eve es diferente de la de Alice. Eve obtendrá el bit correcto con una probabilidad de un medio, lo que significa que su información es cero. Luego preparará un nuevo estado para Bob según el resultado de su medición, que puede no ser igual al enviado por Alice. Enfoquémonos en los casos donde la base de Bob es la misma que la de Alice (después de todo, estos son los únicos casos que se conservan tras el proceso de reconciliación de bases). Dado que Eve ha preparado un estado "incorrecto", Bob obtendrá el resultado esperado con una probabilidad de un medio. Es decir, la estrategia de Eve está introduciendo errores en el lado de Bob.

Alice y Bob pueden detectar la intervención de Eve haciendo pública una fracción de los símbolos en los que sus bases coinciden. Si no hay errores, es muy probable que nadie haya intentado interceptar su comunicación, por lo que pueden emplear de manera segura los bits restantes como clave secreta. Si detectan errores, puede que alguien esté espiando el canal, por lo que deciden abortar. Por lo tanto, lo que BB84 evita es que un espía lea la clave que Alice y Bob están intercambiando sin ser detectado.

Es crucial para la seguridad del protocolo que el canal esté autenticado, es decir, que Alice y Bob sepan que están comunicándose entre sí, por ejemplo, durante el proceso de reconciliación de bases. Si este no fuera el caso, Eve podría ejecutar el protocolo por separado con Alice y Bob, establecer dos claves secretas diferentes con ellos y luego hackear la comunicación posterior. Por lo tanto, Alice y Bob necesitan autenticar su canal, lo cual es posible si inicialmente comparten una clave secreta. Esto introduce una cierta circularidad en el argumento, pero el punto principal es que la cantidad de bits de clave secreta necesarios para autenticar los canales puede ser pequeña. Una vez hecho esto y comenzado el proceso de QKD, la nueva clave generada puede usarse cuando sea necesario para la autenticación.

Operativamente, esta descripción del protocolo está lejos de ser completa. Primero, hemos analizado un ataque específico de interceptación y reenvío por parte de Eve en el cual (i) intercepta los qubits enviados, (ii) los mide, y (iii) prepara un nuevo estado para Bob basado en el resultado obtenido. Sin embargo, el objetivo es demostrar la seguridad del protocolo contra cualquier posible ataque por parte de Eve.

En segundo lugar, desde un punto de vista práctico, es inútil diseñar un protocolo que se aborte cada vez que se detecten errores. ¡Sería abortado en cualquier implementación realista y, por lo tanto, ruidosa! Afortunadamente, estos dos problemas pueden resolverse, y es posible diseñar pruebas de seguridad generales que sean válidas contra cualquier ataque en una situación ruidosa. De hecho, el alcance de una prueba de seguridad es mostrar cómo Alice y Bob pueden destilar una clave secreta en presencia de errores.

A continuación, presentamos las ideas principales para construir una prueba de seguridad general para los protocolos de QKD. Pero primero, analizamos otros ejemplos de protocolos, demostrando que existen muchas variantes posibles.

## Bibilografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```
