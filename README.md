# AILAND — spectral audit of two illustrative hypergraphs

**Version:** v1.1 (9 October 2026)  
**Status:** mathematical correction and reproducibility record; **not** a biological validation.

This repository accompanies the technical clarification of the original Wolfram Community post:

[AILAND: topological invariants in protein folding and visuo-postural reset](https://community.wolfram.com/t/ailand-topological-invariants-in-protein-folding-and-visuo-postural-reset/28163).

The original post is retained as a historical record. This repository documents corrected, restricted claims.

## Definitions

For a binary incidence matrix `M` (nodes × hyperedges), the **hyperedge Gram matrix** is

```text
G = Transpose[M] . M
```

The diagonal of `G` counts hyperedge sizes and off-diagonal entries count nodes shared between pairs of hyperedges. It is **not** the usual graph Laplacian. In particular, the second-largest Gram eigenvalue is **not** a Fiedler eigenvalue.

Let `lambda_i >= 0` be the eigenvalues of `G`. With positive trace, define `p_i = lambda_i / sum(lambda_i)` and spectral entropy in **bits**:

```text
H = -sum_{p_i > 0} p_i log2(p_i).
```

## Inputs — constructed examples, NOT experimental biological data

Node labels in example A: `T_1` through `T_12`. Its five hyperedges:

```text
{T_1,T_2,T_4}
{T_3,T_4,T_7}
{T_5,T_6,T_9}
{T_7,T_8,T_10}
{T_10,T_11,T_12}
```

Node labels in example B: `V_1` through `V_16`. Its five hyperedges:

```text
{V_1,V_2,V_5}
{V_3,V_4,V_8}
{V_5,V_6,V_12}
{V_7,V_8,V_14}
{V_9,V_10,V_16}
```

Example B has three isolated nodes: `V_11`, `V_13`, `V_15`.

## Corrected results

| Descriptor | A | B |
|---|---:|---:|
| Nodes | 12 | 16 |
| Hyperedges | 5 | 5 |
| Spectral entropy (bits) | 2.2210270084 | 2.2565647621 |
| Largest Gram eigenvalue | 4.6180339887 | 4 |
| Second-largest Gram eigenvalue | 3.6180339887 | 4 |
| Multiplicity of largest eigenvalue | 1 | 2 |

Descending Gram spectra:

```text
A = {4.6180339887, 3.6180339887, 3, 2.3819660113, 1.3819660113}
B = {4, 4, 3, 2, 2}
```

The largest eigenvalue of B is degenerate: one arbitrarily selected dominant eigenvector is not a uniquely defined structural descriptor; the corresponding eigenspace projector is well-defined.

## Verification and limitations

The numerical results were recalculated independently using NumPy during review. The user then directly executed focused checks in **Wolfram Cloud** on 9 October 2026: the two entropies, numerically sorted Gram spectra, and dominant eigenvalue multiplicities (`{1,2}`) matched the corrected values.

**Important:** these focused checks do *not* establish that an entire future WL package has been tested. They also do not validate a biological interpretation.

- The examples are static, manually specified hypergraphs.
- The full hypergraphs are not isomorphic (they even have different numbers of nodes).
- The reported quantities are invariant to consistent relabeling, **not** general topological invariants.
- The incidence-matrix Gram construction can conceal isolated nodes; spectra do not reconstruct the whole hypergraph.
- No protein-folding measurements, posture measurements, physical dynamics, relaxation model or causal mechanism have been established by these examples.

## Reproducibility plan

The Wolfram Language audit source and the English correction text are to be added as separate versioned files. Do not interpret their absence at this initial commit as a completed software or experimental verification.

## Attribution

Original post: Adamoli, Wolfram Community (link above). Revised technical clarification: AILAND v1.1, 9 October 2026.
