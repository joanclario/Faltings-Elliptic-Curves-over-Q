# Wolfram Mathematica Files for the Article

This repository contains the Wolfram Mathematica notebooks associated with the manuscript *Faltings elliptic curves in twisted Q-isogeny classes*, by Enrique González-Jiménez and Joan-C. Lario, ([arXiv:2509.23283](https://arxiv.org/abs/2509.23283)).

# Notebooks for Infinite Families of Isogeny Graphs

This folder contains notebooks for the cases listed below. These give the infinite families of isogeny graphs considered in the accompanying computations.

The types considered are:

`L2(2)`, `L2(3)`, `L2(5)`, `L2(7)`, `L2(13)`, `L3(9)`, `L3(25)`, `R4(6)`, `R4(10)`, `R6`, `T4`, `T6`, `T8`, and `S`.

For each of these types, the corresponding notebook contains the detailed computations underlying the associated isogeny graph, as well as the results presented in the file `Faltings_types.pdf`, which accompanies the manuscript *Faltings elliptic curves in twisted Q-isogeny classes*, by Enrique González-Jiménez and Joan-C. Lario ([arXiv:2509.23283](https://arxiv.org/abs/2509.23283)), as supplementary material.

The parametrizations for these infinite cases were obtained using Magma. The corresponding scripts used to compute them are available in the folder `Magma_scripts` of this repository.

In particular, in the case of the type `L3(9)`, extensive explanatory text is included throughout the notebook in order to clarify the intermediate steps and to make the procedure reproducible. The remaining cases can be followed in a similar way, using the `L3(9)` notebook as a detailed guide.
