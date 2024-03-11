# General Structure of QKD Protocols

The general structure of a QKD protocol is as follows:

1) Repeat $N$ times: Alice prepares states $\ket{\psi_a}$ with probability $p_a$ and sends them to Bob through the insecure channel. Bob performs one of the measurements $M_j$ with probability $p_j$ on the received particle, obtaining the result $r$. After this process Alice and Bob have a list of $N$ symbols corresponding to the prepared states on Alice's side $\vec a=(a_1\ldots a_N)$ and implemented measurement on Bob's side $\vec b=(b_1\ldots b_N)$. Note that here we have combined the chosen measurement by Bob $j$ and the obtained result $r$ within $b$, that is $b=(j,r)$.
2) Alice and Bob announce the prepared state and performed measurement and result for $n$ of these rounds. This allows them to estimate the frequencies of obtaining result $r$ when performing measurement $j$ on state $\ket{\psi_i}$.
3) Using this information, and the security proof, Alice and Bob know how to process their classical list of symbols $\vec a$ and $\vec b$ to distill a secret key rate of length $K$, $\vec k=(k_1\ldots k_K)$. The length of this key depends on the previous estimation round. If the channel quality is too bad, Alice and Bob conclude that no key distillation is possible, $K=0$, and the protocol is aborted. 

Several remarks are important here:

- In principle, the larger the number of rounds $N$, the better the protocol performance: it reduces the statistical fluctuation when estimating the properties of the channel and therefore Alice and Bob have a much more precise understanding of the key distillation process. In the limit of $N\rightarrow\infty$, one can define the key rate $k=\lim_{N\rightarrow\infty} K/N$.
- The number of announced rounds $n$ should be sufficient to achieve a reliable estimation of the channel properties, that is, to accumulate enough statistics so that these properties are determined with a given pre-determined confidence. But, to optimise the protocol performance, it should not be much larger than this, as these rounds do not contribute to the secret key. In the limit of large $N$, one can have very large values of $n$, and therefore an arbitrarily good estimation of the channel properties, but such that $n\ll N$. In other words, the estimation hardly affects the asymptotic key rate.
- The security proof, discussed below, is crucial in step 3 to understand how Alice and Bob should distill the key from the noisy list of symbols $\vec a$ and $\vec b$.

In the case of BB84, $a=(b_A,p)$, where $b_A$ specifies Alice's choice of basis and $p$ the prepared element of the basis, so that $a$ can be equal to $(z,\pm 1)$ or $(x,\pm 1)$. These four states are prepared with the same probability equal to $1/4$. On Bob's side, we can also write $b=(b_B,r)$, where $b_B$ now denotes Bob's choice of basis. The basis reconciliation process in which Alice and Bob only keep those symbols where $b_A=b_B$ is part of the key distillation process in step 3 mapping the initial list of symbols obtained in step 1 into the final key.

The protocol in the entanglement picture is very similar, but step 1 is now replaced by 

1) Repeat $N$ times: Alice prepares the state $\ket{\Psi}_{AA'}=\sum_a \sqrt{p_a}\ket a_A\otimes\ket{\psi_a}_{A'}$, where $\{\ket{a}\}$ defines an arbitrary basis in system $A$. She measures system $A$ in this basis getting result $a$ with probability $p_a$. She then sends system $A'$, which is in state $\ket{\psi_a}$, to Bob through the insecure channel. Bob performs one of the measurements $M_j$ with probability $p_j$ on the received particle, obtaining the result $r$. After this process Alice and Bob have a list of $N$ symbols corresponding to the measurement result on Alice's side $\vec a=(a_1\ldots a_N)$, and implemented measurement on Bob's side $\vec b=(b_1\ldots b_N)$. Note that here we have combined the chosen measurement by Bob $j$ and the obtained result $r$ within $b$, that is $b=(j,r)$.

In the particular case of BB84, the four states can be grouped into two bases. This simplifies the entanglement-based equivalent protocol, which, as said, can be seen as measuring bases $x$ and $z$ on half of a maximally entangled state. However, grouping the prepared states into more than one basis is in general not possible, e.g. for the B92 protocol.

