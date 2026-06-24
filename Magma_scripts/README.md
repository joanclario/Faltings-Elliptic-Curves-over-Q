# Magma Files for the Article

This folder contains the Magma files associated with the supplementary material results presented in the file `Faltings_types.pdf`, which accompanies the manuscript  [*Faltings elliptic curves in twisted Q-isogeny classes*](https://arxiv.org/abs/2509.23283), by Enrique González-Jiménez and Joan-C. Lario (arXiv:2509.23283).

## Contents

### `ParametrizationIsogGraphSignatureFaltings.m`

This Magma script constructs parametrized representatives, up to quadratic twist, for the rational isogeny graph types of elliptic curves over $\mathbb{Q}$. The types considered are:

$L_2(2)$, $L_2(3)$, $L_2(5)$, $L_2(7)$, $L_2(13)$, $L_3(9)$, $L_3(25)$, $R_4(6)$, $R_4(10)$, $R_6$, $T_4$, $T_6$, $T_8$, and $S$.

More precisely, for each isogeny graph type, the script computes:

- a parametrized representative of the corresponding family of elliptic curves;
- the associated signature

$$
(c_4, c_6, \Delta);
$$

- the corresponding $j$-invariant.

The output is written in factored form to the file

```text
signatures_output.txt
