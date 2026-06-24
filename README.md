# Supplementary Material for Faltings Elliptic Curves in Twisted Q-Isogeny Classes

The document `Faltings_types.pdf` contains the tables providing supplementary material for the manuscript [*Faltings elliptic curves in twisted Q-isogeny classes*](https://arxiv.org/abs/2509.23283), by Enrique González-Jiménez and Joan-C. Lario (arXiv:2509.23283).

## Repository Structure

This repository contains the supplementary files used to obtain and verify the data appearing in `Faltings_types.pdf`.

### `Magma_scripts`

The folder `Magma_scripts` contains the Magma files used to obtain parametrized representatives, up to quadratic twist, for the rational isogeny graph types of elliptic curves over $\mathbb{Q}$.

The types considered are:

$L_2(2)$, $L_2(3)$, $L_2(5)$, $L_2(7)$, $L_2(13)$, $L_3(9)$, $L_3(25)$, $R_4(6)$, $R_4(10)$, $R_6$, $T_4$, $T_6$, $T_8$, and $S$.

These give the infinite families of isogeny graphs considered below.

More precisely, the Magma scripts compute, for each of these isogeny graph types:

- a parametrized representative of the corresponding family of elliptic curves;
- the associated signature $(c_4,c_6,\Delta)$;
- the corresponding $j$-invariant.

### `Mathematica_scripts`

The folder `Mathematica_scripts` contains, for each of the types listed above, the corresponding Wolfram Mathematica notebook with the detailed computations underlying the associated isogeny graph.

## Finite Cases

The remaining cases, for which there are only finitely many isomorphism classes, are listed below. The corresponding results appearing in `Faltings_types.pdf` can be obtained from the LMFDB database of elliptic curves over $\mathbb{Q}$:

[https://www.lmfdb.org/EllipticCurve/Q/](https://www.lmfdb.org/EllipticCurve/Q/)

These finite cases are:

$L_2(11)$, $L_2(17)$, $L_2(19)$, $L_2(37)$, $L_2(43)$, $L_2(67)$, $L_2(163)$, $L_4$, $R_4(14)$, $R_4(15)$, $R_4(21)$. 
