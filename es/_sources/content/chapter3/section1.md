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



# Libreta de Un Solo Uso y Distribución Cuántica de Claves

Antes de adentrarnos en el mundo cuántico, revisemos un resultado seminal de Vernam que muestra cómo intercambiar información privada de manera completamente segura utilizando una clave secreta compartida previamente.

En cualquier escenario criptográfico, dos partes honestas, Alice y Bob, desean intercambiar información de manera privada. También hay una tercera parte deshonesta, la espía, llamada Eve, que quiere leer esta información. A partir de ahora, supongamos que Alice y Bob comparten una clave secreta, es decir, una lista de bits perfectamente correlacionados sobre los cuales Eve no tiene información. La clave secreta, de longitud $N$, se denota por $\vec k$ que es una cadena de $N$ bits $k_i$, con $i=1,\ldots,N$. Para enviar un mensaje de longitud $M\leq N$ a Bob, denotado por $\vec m$ Alice puede realizar una suma módulo 2 de los bits de su mensaje con $M$ bits de la clave secreta y enviar la cadena de $M$ bits resultante a Bob a través de un canal público (inseguro). De forma más exacta, con esta operación, Alice calcula el XOR booleano (el XOR booleano, denotado por $\oplus$, es la operación tal que $0\oplus 0=1\oplus 1=0$ y $0\oplus 1=1\oplus 0=1$) de cada bit en su mensaje, $m_i$, con un bit en la clave secreta, $k_i$, y envía los bits resultantes, $r_i=m_i\oplus k_i$, a través del canal. Se puede demostrar que Eve, quien solo tiene acceso al mensaje $\vec r$ enviado a través del canal inseguro, no tiene ninguna información sobre el mensaje real $\vec m$. Sin embargo, en el lado de Bob, es muy fácil decodificar el mensaje ya que él conoce la clave. Simplemente tiene que sumar el mensaje recibido a su clave, obteniendo $r_i\oplus k_i=m_i\oplus k_i\oplus k_i=m_i$. Este esquema, conocido como el protocolo de libreta de un solo uso, es seguro siempre que (i) el número de bits de clave utilizados para la codificación sea igual al número de bits en el mensaje y (ii) los bits de la clave secreta no se reutilicen nunca.

La principal desventaja de usar la libreta de un solo uso es que requiere una clave secreta compartida inicialmente. De alguna manera, el problema de distribuir el mensaje se traslada ahora al problema casi análogo de distribuir la clave. Pero es precisamente aquí donde la Mecánica Cuántica puede ayudar: la distribución de una clave secreta se puede hacer de manera demostrablemente segura utilizando estados y operaciones cuánticas. Posteriormente, esta clave puede ser empleada utilizando el one-time pad para intercambiar el mensaje final de manera completamente segura. Los protocolos cuánticos que permiten a Alice y Bob distribuir una clave de manera segura se denominan Protocolos de Distribución de Claves Cuánticas (en inglés Quantum Key Distribution, QKD), por razones evidentes.

