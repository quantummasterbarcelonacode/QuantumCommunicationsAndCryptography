
# Communication à longue distance

Dans la dernière partie de ces notes, nous nous concentrons sur le problème de la communication quantique à longue distance ou, plus généralement, sur la manière d'envoyer de manière fiable des informations quantiques à travers un canal bruité. Le scénario est assez similaire à ce qui a été discuté jusqu'à présent, avec Alice et Bob dans des endroits éloignés connectés par un canal quantique. Cependant, l'objectif maintenant est d'envoyer de l'information quantique, et non de distribuer une clé secrète. Par conséquent, nous n'avons pas besoin d'inclure Eve dans l'étude.

Dans le scénario considéré, on suppose qu'Alice et Bob peuvent effectuer tout type d'opérations quantiques localement et peuvent communiquer des informations classiques sans aucune erreur. Cet ensemble d'opérations est appelé LOCC, pour Local Operations and Classical Communication. Les utilisateurs peuvent échanger des états quantiques, mais uniquement à travers un canal bruité décrit par une matrice complètement positive et préservant la trace (appelé CPTP pour completely positive and trace preserving), $\Lambda$. L'objectif est de caractériser la quantité maximale de qubits qui peuvent être envoyés de manière fiable d'Alice à Bob en fonction du nombre d'utilisations du canal. Une définition formelle sera fournie dans cette section.



