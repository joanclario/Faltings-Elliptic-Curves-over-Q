# Magma Files for the Article

This folder contains the Magma files associated with the supplementary material presented in `Faltings_types.pdf`, which accompanies the manuscript [*Faltings elliptic curves in twisted Q-isogeny classes*](https://arxiv.org/abs/2509.23283), by Enrique González-Jiménez and Joan-C. Lario (arXiv:2509.23283).

## Contents

### `ParametrizationIsogGraphSignatureFaltings.m`

This Magma script constructs parametrized representatives, up to quadratic twist, for the rational isogeny graph types of elliptic curves over $\mathbb{Q}$. The types considered are

$$
L_2(2),\ L_2(3),\ L_2(5),\ L_2(7),\ L_2(13),\ L_3(9),\ L_3(25),
$$

$$
R_4(6),\ R_4(10),\ R_6,\ S,\ T_4,\ T_6,\ \text{and } T_8.
$$

More precisely, for each isogeny graph type, the script computes:

- a parametrized representative of the corresponding family of elliptic curves;
- the associated signature $(c_4,c_6,\Delta);$
  
- the corresponding $j$-invariant.

## Main Functions

The main functions provided by the script are:

```magma
IsogenyGraphSignatures(type, t);
IsogenyGraphJInvariants(type, t);
```

Here:

- `type` is a string specifying the rational isogeny graph type;
- `t` is the parameter of the corresponding family.

The admissible values of `type` are:

```magma
[
    "L2(2)", "L2(3)", "L2(5)", "L2(7)", "L2(13)",
    "L3(9)", "L3(25)",
    "R4(6)", "R4(10)", "R6",
    "S",
    "T4", "T6", "T8"
];
```

The function

```magma
IsogenyGraphSignatures(type, t);
```

returns the parametrized signatures

$$
(c_4,c_6,\Delta)
$$

associated with the vertices of the isogeny graph of the specified type.

The function

```magma
IsogenyGraphJInvariants(type, t);
```

returns the corresponding parametrized $j$-invariants.

## Output

The output is written in factored form to the file

```text
signatures_output.txt
```
