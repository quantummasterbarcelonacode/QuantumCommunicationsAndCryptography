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

# Ataques de Hacking

Toda la discusión anterior muestra que aparecen fallos de seguridad cuando se pasa de protocolos teóricos a su implementación práctica. La existencia de ataques PNS no podía descartarse a priori, porque no había una prueba de seguridad para una implementación del protocolo BB84 con estados coherentes débiles y grandes pérdidas. Los ataques, de hecho, demostraron que tal prueba era imposible. El principal mérito de los protocolos de estado señuelo fue que se pudo establecer una prueba completa de seguridad para ellos en una implementación con pérdidas y estados débilmente coherentes. Esta prueba parecía poner fin a la discusión.

Sin embargo, en 2010, se reportaron varios ataques de hacking exitosos en implementaciones comerciales de QKD que, a priori, contaban con una prueba de seguridad. Vadim Makarov fue uno de los investigadores más activos en estos esfuerzos de hacking cuántico {cite}`Makarov`. En la implementación considerada en BB84, el último paso del lado de Bob era enviar un pulso de luz a un divisor de haz polarizado y detectar los modos de salida, ver {numref}`hackingfig`. Los hackers modificaron el funcionamiento de los detectores de Bob inyectando algo de luz en sus dispositivos. Con este ataque, los detectores dejaron de ser sensibles a fotones individuales y dieron un clic cada vez que la intensidad recibida estaba por encima de un umbral dado, , $I_{\text{th}}$. Una vez que Eve ha modificado el funcionamiento de los detectores, Eve mide el estado producido por Alice en una base aleatoria, digamos $z$, en una ronda dada. Luego, prepara un nuevo estado igual a su resultado, digamos $\ket{+z}$, codificado en la intensidad del pulso de luz $I_{\text{th}}<\mu_E<2I_{\text{th}}$ y lo envía a Bob a través de un canal sin pérdidas (de manera equivalente, ella codifica su bit en un pulso con intensidad igual a $\mu_E/\eta_C$, de modo que lo que le llega a Bob tiene la intensidad correcta igual a $\mu_E$). Ahora, si Bob escoge la misma medida que Eve, el pulso se envía de manera determinística a uno de los dos detectores de Bob, manteniendo su intensidad por encima del umbral, y luego se detectará con el mismo resultado que la preparación de Eve. Sin embargo, si Bob elige una base diferente a la de Eve, el estado coherente se divide en dos pulsos de intensidades por debajo del umbral y no se produce ninguna detección. Bob anuncia que el fotón se perdió durante la propagación y esas rondas se descartan. En total, la mitad de las rondas se descartan, pero para aquellas que se conservan y pasan la reconciliación de bases, tendremos que las bases de Alice, Bob y Eve coinciden. Por lo tanto, el ataque de Eve le proporciona toda la información y no interfiere con la medida de Alice ni con la preparación de Bob. Por supuesto, este ataque solo funciona si las pérdidas son mayores que $1/2$, pero este es siempre el caso después de, aproximadamente, más de 15 km de fibra óptica.

```{figure} ./Hacking.png
---
height: 400px
name: hackingfig
---
Ataque de hacking: Eve inyecta luz en los dispositivos de Bob para que no sean sensibles a los fotones entrantes, pero den un resultado cada vez que la intensidad de la luz entrante esté por encima del umbral $I_{\text{th}}$. En el ataque, Eve mide el estado enviado por Alice y prepara un nuevo estado coherente para Bob igual a su resultado de medición con intensidad $I_{\text{th}}<\mu_E<2I_{\text{th}}$. Si las bases de Bob y Eve coinciden, todo el pulso de luz se envía a un detector, dando el resultado preparado. Si las bases no coinciden, el pulso de luz entrante se divide en dos pulsos con intensidades por debajo del umbral y no hay detección.
```

Estos ataques de hacking fueron muy importantes porque demostraron que certificar la seguridad de una implementación cuántica es más sutil de lo que se pensaba inicialmente. Recuerda que, en principio, había una prueba matemática de seguridad para el protocolo hackeado. ¿Estaba equivocada esta prueba? ¿O los hackers lograron infringir una ley cuántica y luego romper el protocolo? La respuesta a estas preguntas es negativa y lo que realmente sucedió fue que la implementación no cumplió con los requisitos necesarios para demostrar la seguridad. Hubo una discrepancia entre el modelado teórico del experimento y su implementación, que fue explotada por los hackers. La prueba de seguridad se derivó bajo las suposiciones del modelo, pero si el modelo no es perfectamente preciso al describir el experimento, la prueba de seguridad obtenida no se aplica a la implementación, que se vuelve potencialmente insegura.

Para entender mejor este punto, consideremos nuevamente el protocolo BB84. En su formulación, Alice y Bob preparan los estados propios de $\sx$ y $\sz$, y Bob mide estos observables.  Todos estos son operadores que actúan en el espacio de cúbits, $\compl^2$. Al pensar en una implementación, es fundamentalmente imposible garantizar que cualquier sistema físico viva estrictamente en un espacio de Hilbert de dimensión dos. Por lo tanto, si no se cumplen las suposiciones del protocolo, la prueba de seguridad tampoco se cumple. Por ejemplo, consideremos la situación en la que Alice codifica el qubit en un estado de un solo fotón con frecuencia $\omega_0$. Sin embargo, supongamos que hay una pequeña imperfección en los dispositivos de Alice y, siempre que codifica en la base $x$, está desplazando ligeramente esta frecuencia a $\omega'_0=\omega_0+\delta\omega$. Si Eve nota esta imperfección, todo lo que necesita hacer para hackear el protocolo es (i) medir la frecuencia del estado de un solo fotón que sale del laboratorio de Alice y (ii) medir en la base $z$ ($x$) si la frecuencia medida es $\omega_0$ ($\omega_0+\delta\omega$). De esta forma, Eve obtiene toda la información y su ataque pasa desapercibido. Claramente, este ataque puede evitarse si Alice calibra inicialmente su dispositvo y corrige este desplazamiento, pero este no será posible si la sensibilidad de los dispositivos de calibración de Alice es mayor que $\delta\omega$, mientras que los dispositivos de Eve pueden discriminar este desplazamiento de frecuencia. Observa que los cuatro estados anteriores ofrecen muy buenas aproximaciones a los cuatro estados de BB84, pero no son idénticos. De hecho, estos estados actúan en un espacio vectorial de dimensión cuatro, abarcado por $\{\ket{\pm z,\omega_0}, \ket{\pm x,\omega'_0}\}$, incumpliendo así la suposición inicial utilizada en la prueba de seguridad de que todos los estados abarcan un espacio de dos dimensiones. Para fortalecer la seguridad, Alice y Bob pueden intentar detectar y corregir todos los errores posibles de este tipo y garantizar que la brecha entre el modelo y la implementación sea mínima. De hecho, después de que se anunció el ataque de hacking, los proveedores de QKD corrigieron el detector de tal manera que el ataque específico de {cite}`Makarov` ya no fuera posible. Sin embargo, ¿cómo podemos asegurarnos de que no sea posible ningún ataque que explote las imperfecciones de los dispositivos, especialmente si tomamos en cuenta que algunas suposiciones en los protocolos estándar de QKD, como la dimensión del espacio de Hilbert, no son comprobables?

## Bibliografía para esta sección
```{bibliography}
:style: unsrt
:filter: docname in docnames
```