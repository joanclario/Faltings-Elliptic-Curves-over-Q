# Supplementary Material for Faltings Elliptic Curves in Twisted Q-Isogeny Classes

The document `Faltings_types.pdf` contains the tables providing supplementary material for the manuscript [*Faltings elliptic curves in twisted Q-isogeny classes*](https://arxiv.org/abs/2509.23283), by Enrique González-Jiménez and Joan-C. Lario, arXiv:2509.23283 (2025).

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

In particular, the notebook for the type $L_3(9)$ contains extensive explanatory text throughout, in order to clarify the intermediate steps and make the procedure reproducible. The remaining cases can be followed in a similar way, using the $L_3(9)$ notebook as a detailed guide.

## Finite Cases

The remaining cases, for which there are only finitely many isomorphism classes, are listed below. The corresponding results appearing in `Faltings_types.pdf` can be obtained from the LMFDB database of elliptic curves over $\mathbb{Q}$:

[https://www.lmfdb.org/EllipticCurve/Q/](https://www.lmfdb.org/EllipticCurve/Q/)

These finite cases are:

- $L_2(11)$;

- $J_{14}$:
  
  $$
  \left\{-3^3 5^3,\ 3^3 5^3 17^3\right\};
  $$

- $J_{15}$:
  
  $$
  \left\{
  -\frac{5^2}{2},\
  -\frac{5^2 241^3}{2^3},\
  -\frac{5 29^3}{2^5},\
  \frac{5 211^3}{2^{15}}
  \right\};
  $$

- $J_{17}$:
  
  $$
  \left\{
  -\frac{17^2 101^3}{2},\
  -\frac{17 373^3}{2^{17}}
  \right\};
  $$

- $J_{19}$:
  
  $$
  \left\{-2^{15}3^3\right\};
  $$

- $J_{21}$:
  
  $$
  \left\{
  -\frac{3^2 5^6}{2^3},\
  \frac{3^3 5^3}{2},\
  -\frac{3^2 5^3 101^3}{2^{21}},\
  -\frac{3^3 5^3 383^3}{2^7}
  \right\};
  $$

- $J_{27}$:
  
  $$
  \left\{-2^{15}3 5^3\right\};
  $$

- $J_{37}$:
  
  $$
  \left\{-7 11^3,\ -7 137^3 2083^3\right\};
  $$

- $J_{43}$:
  
  $$
  \left\{-2^{18}3^3 5^3\right\};
  $$

- $J_{67}$:
  
  $$
  \left\{-2^{15}3^3 5^3 11^3\right\};
  $$

- $J_{163}$:
  
  $$
  \left\{-2^{18}3^3 5^3 23^3 29^3\right\}.
  $$
