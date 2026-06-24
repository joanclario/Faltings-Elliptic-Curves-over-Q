# Wolfram Mathematica notebooks for Infinite Families of Isogeny Graphs

This folder contains the Wolfram Mathematica notebooks for the cases listed below. These give the infinite families of isogeny graphs considered in the accompanying computations.

The types considered are:

$L_2(2)$, $L_2(3)$, $L_2(5)$, $L_2(7)$, $L_2(13)$, $L_3(9)$, $L_3(25)$, $R_4(6)$, $R_4(10)$, $R_6$, $T_4$, $T_6$, $T_8$, and $S$.

For each of these types, the corresponding notebook contains the detailed computations underlying the associated isogeny graph, as well as the results presented in the file `Faltings_types.pdf`, which accompanies the manuscript *Faltings elliptic curves in twisted Q-isogeny classes*, by Enrique González-Jiménez and Joan-C. Lario ([arXiv:2509.23283](https://arxiv.org/abs/2509.23283)), as supplementary material.

The parametrizations for these infinite cases were obtained using Magma. The corresponding scripts used to compute them are available in the folder `Magma_scripts` of this repository.

In particular, in the case of the type $L_3(9)$, extensive explanatory text is included throughout the notebook in order to clarify the intermediate steps and to make the procedure reproducible. The remaining cases can be followed in a similar way, using the `L3(9)` notebook as a detailed guide.
