
# This is a title

This is normal text. **This is bold text**. *This is italic text*.

```{math}
:label: eqnref
x^2+y=3
```

Reference equations as follows: Eq. {eq}`eqnref`

Reference bibtex entries as follows: {cite}`litref`

Reference figures as follows: {numref}`figref`

```{figure} ./file.png
---
height: 400px
name: figref
---
This is the caption of the figure
```

Can put something like this at the top if we need to define LaTeX macros:

```{math}
\def\tr{{\text{tr}}}
\def\one{{\mathbb{1}}}
\def\sz{{\sigma_z}}
\def\sx{{\sigma_x}}
\def\sy{{\sigma_y}}
\def\compl{{\mathbb{C}}}
```

<!--Commenter: Some comment that won't be visible in the final text-->

`````{admonition} Block title
:class: note
:class: warning
:class: important
:class: tip
This is an example block, choose one of the classes above for the colour/style.
`````

## Bibliography for this section
```{bibliography}
:style: unsrt
:filter: docname in docnames
```

