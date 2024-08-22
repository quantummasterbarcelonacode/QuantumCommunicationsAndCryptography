# One-Time Pad and Quantum Key Distribution

Before moving into the quantum world, let us review a seminal
result by Vernam showing how to exchange private information in a
completely secure way using a pre-shared secret key.

In any cryptographic scenario, two honest parties, Alice and Bob,
want to exchange information in a private way. There is also a
third dishonest party, the eavesdropper, called Eve, that
wants to read this information. Assume in what follows that Alice
and Bob share a secret key, that is, a list of perfectly
correlated bits which Eve has no information about. The secret
key, of length $N$, is denoted by $\vec k$, which is a string of
$N$ bits $k_i$, with $i=1,\ldots,N$. In order to send a message of
length $M\leq N$ to Bob, denoted by $\vec m$, Alice can perform
a sum modulo 2 of her message bits with $M$ secret key bits and
send the resulting $M$-bit string to Bob through a public (insecure) channel. More
precisely, with this operation Alice computes the boolean
XOR (The boolean XOR, denoted by $\oplus$, is the
operation such that $0\oplus 0=1\oplus 1=0$ and $0\oplus 1=1\oplus
0=1$) of each bit in her message, $m_i$, with a bit in the secret
key, $k_i$, and sends the resulting bits, $r_i=m_i\oplus k_i$,
through the channel. It can be shown that Eve, who has access only to
the message $\vec r$ sent through the insecure channel, does not
have any information about the real message $\vec m$. However, on
Bob's side, it is very easy to decode the message due to the fact
that he knows the key. He simply has to add the received message
to his key, getting $r_i\oplus k_i=m_i\oplus k_i\oplus k_i=m_i$.
This scheme, known as the one-time pad
protocol, is secure provided that (i) the number of key bits used
for the encoding is equal to the number of bits in the message and
(ii) the secret key bits are never reused.

The main drawback for using one-time pad is that it requires an
initially shared secret key. In a way, the problem of distributing
the message is now moved into the almost analogous problem of
distributing the key. But it is precisely here where Quantum
Mechanics can help: the distribution of a secret key can be done
in a provably secure way using quantum states and operations.
Later, this key can be employed using one-time pad to exchange the
final message in a completely secure way. The quantum protocols
allowing Alice and Bob to distribute a key in a secure way are named Quantum Key
Distribution (QKD) protocols, for obvious reasons.



