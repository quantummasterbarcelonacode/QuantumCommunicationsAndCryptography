# L'attaque PNS (Photon-Number Splitting)

Le remplacement des états uniques de photon par des états cohérents atténués semblait offrir un bon compromis entre faisabilité et sécurité. Cependant, cette intuition initiale a été remise en question par l'attaque dite de Photon-Number Splitting (PNS), introduite dans {cite}`PNS`. Elle considère une mise en œuvre réaliste avec des états cohérents atténués à travers une fibre standard, où les pertes sont exponentielles avec la distance. L'attaque exploite la présence des pertes et le fait qu'un état cohérent atténués contient incidentellement des clones de l'état préparé. Pour simplifier l'explication de l'attaque, considérons un protocole dans lequel Alice code l'information dans la polarisation des états de lumière préparés, mais cela s'applique également à d'autres codages, comme les créneaux temporels expliqués ci-dessus. L'attaque fonctionne comme suit :

1) Après que l'état lumineux ait été préparé par Alice, Eve l'intercepte et mesure le nombre de photons de manière non destructive, c'est-à-dire que si elle mesure $n$ photons, elle sait que l'état a été projeté dans l'état à $n$ photons $\ket{n}$. Notez que cette mesure ne regarde que le nombre de photons, mais ne perturbe pas le degré de liberté utilisé par Alice pour coder l'information, la polarisation dans notre exemple. Eve obtient le résultat $n$ avec une probabilité $p(n)=e^{-|\alpha|^2} \mu^n/n!$, voir l'équation {eq}`coherentstate`.

2) En fonction du nombre de photons mesurés :
    - Si $n=0$, Eve ne fait rien.
    - Si $n=1$, Eve bloque l'état et ne transmet rien à Bob.
    - Si $n>1$, Eve garde un des $n$ photons dans sa mémoire quantique et transmet $n-1$ photons à Bob à travers une fibre parfaite sans bruit.
    
3) Eve attend que les bases soient annoncées, puis mesure le photon conservé dans sa mémoire quantique, obtenant ainsi toutes les informations sur la préparation d'Alice.

Dans une réalisation sans bruit, cette attaque est remarquée par Alice et Bob car Eve bloque la plupart des impulsions. Cependant, si les pertes sont importantes, cette attaque reste indétectée car Eve peut parfaitement simuler le canal avec perte, obtenant toutes les informations sans être détectée. Cela se produit lorsqu'elle peut simuler avec les impulsions qu'elle transmet à travers ses fibres parfaites sans perte le taux attendu par Bob, égal à $R_B=f\mu\eta_C$. Si l'état cohérent est atténué, la probabilité que Eve détecte $n>1$ photons est à peu près la même que celle de détecter deux photons, $\text{Pr}(n>1)\approx p(2)=e^{-\mu}\mu^2/2$, donc le taux produit par son attaque est de l'ordre de $R_E\sim f\mu^2$, où les termes constants ont été supprimés pour simplifier. En égalant les deux taux, on a que l'attaque PNS est réussie lorsque $\mu^2\sim \mu\eta_C$, c'est-à-dire lorsque les pertes sont de l'ordre de l'intensité lumineuse $\mu\sim\eta_C$. Pour se protéger contre cette attaque, Alice doit choisir l'amplitude de ses états préparés en fonction des pertes du canal : si les parties honnêtes sont connectées par un canal avec une transmission $\eta_C$, les états cohérents atténués d'Alice doivent satisfaire $\mu\lesssim\eta_C$. Par conséquent, le taux du protocole est $R_B=f\mu\eta_C\sim\eta_C^2$, ce qui n'est plus linéaire mais quadratique en $\eta_C$, ce qui limite en outre les taux réalisables à de grandes distances.

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

