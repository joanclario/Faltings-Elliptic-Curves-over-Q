# Magma Files for the Article

This repository contains the Magma files associated with the article.

## Contents

### `ParametrizationIsogGraphSignatureFaltings.m`

This Magma script constructs parametrized representatives, up to quadratic twist, for the rational isogeny graph types of elliptic curves over $\mathbb{Q}$.

More precisely, the script computes, for each graph type considered in the article:

- a parametrized representative of the corresponding family of elliptic curves;
- the associated signature

$$
(c_4, c_6, \Delta);
$$

- the corresponding $j$-invariant.

The output is written in factored form to the file

```text
signatures_output.txt
``
