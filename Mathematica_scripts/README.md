# Wolfram Mathematica Notebooks for Infinite Families of Isogeny Graphs

This folder contains the Wolfram Mathematica notebooks for the cases listed below. These notebooks describe the infinite families of isogeny graphs considered in the accompanying computations.

The types considered are:

$$
L_2(2),\ L_2(3),\ L_2(5),\ L_2(7),\ L_2(13),\ L_3(9),\ L_3(25),
$$

$$
R_4(6),\ R_4(10),\ R_6,\ T_4,\ T_6,\ T_8,\ \text{and } S.
$$

For each of these types, the corresponding notebook contains the detailed computations underlying the associated isogeny graph, as well as the results presented in `Faltings_types.pdf`. This file accompanies the manuscript [*Faltings elliptic curves in twisted Q-isogeny classes*](https://arxiv.org/abs/2509.23283), by Enrique González-Jiménez and Joan-C. Lario (arXiv:2509.23283), as supplementary material.

The parametrizations, including the signatures and $j$-invariants, for these infinite families were obtained using Magma. The corresponding scripts used to compute them are available in the `Magma_scripts` folder of this repository.

In particular, the notebook `L_3(9).nb` includes extensive explanatory text throughout in order to clarify the intermediate steps and make the procedure reproducible. The remaining cases can be treated similarly, using `L_3(9).nb` as a detailed guide.

The notebook `L_3(9).nb` contains the computations needed to obtain Tables 8, 9, and 10 of the article. These computations are organized into sections according to the prime $p$ under consideration:

- the section for $p \neq 2,3$ gives Table 8;
- the section for $p=3$ gives Table 9;
- the section for $p=2$ gives Table 10.

In each case, the corresponding table is obtained by distinguishing the possible values of the $p$-adic valuation of the parameter $t$. All the cases, intermediate calculations, and resulting conditions are explained in detail in the notebook.

Moreover, in the section corresponding to $p=3$, the notebook derives conditions $3_a$ and $3_b$ appearing in Table 4 of the article. These conditions are denoted by $P_2$ and $P_5$, respectively, in Papadopoulos's notation.
