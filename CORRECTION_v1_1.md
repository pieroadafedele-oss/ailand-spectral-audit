# AILAND — technical correction and clarification (v1.1)

**Date:** 9 October 2026  
**Original post:** [AILAND: topological invariants in protein folding and visuo-postural reset](https://community.wolfram.com/t/ailand-topological-invariants-in-protein-folding-and-visuo-postural-reset/28163)

This note supplements — and does not silently overwrite — the original research post. It distinguishes reproducible computations from claims that remain untested.

## 1. Matrix interpretation

For the binary node-by-hyperedge incidence matrix \(M\), the matrix

\[
G=M^\mathsf{T}M
\]

is the **hyperedge Gram matrix**, *not* the conventional graph Laplacian. The entries on its diagonal are hyperedge sizes; the off-diagonal entries count shared nodes.

Consequently, the second-largest eigenvalue of \(G\) cannot be called a *Fiedler eigenvalue*. Fiedler eigenvalues concern the second-smallest eigenvalue of a specified graph Laplacian.

## 2. Corrected numerical results

For nonnegative eigenvalues \(\lambda_i\) with positive total, define \(p_i=\lambda_i/\sum_j\lambda_j\) and spectral entropy

\[
H=-\sum_{p_i>0}p_i\log_2 p_i.
\]

The unit is **bits**, not nats.

| Descriptor | Example A | Example B |
|---|---:|---:|
| Nodes | 12 | 16 |
| Hyperedges | 5 | 5 |
| Spectral entropy (bits) | 2.2210270084 | 2.2565647621 |
| Largest Gram eigenvalue | 4.6180339887 | 4 |
| Second-largest Gram eigenvalue | 3.6180339887 | 4 |
| Largest-eigenvalue multiplicity | 1 | 2 |

The descending Gram spectra are

```text
A = {4.6180339887, 3.6180339887, 3, 2.3819660113, 1.3819660113}
B = {4, 4, 3, 2, 2}
```

The Gram spectrum of example B has a two-dimensional dominant eigenspace; no *single* dominant eigenvector is unique.

## 3. Structural and interpretative limitations

- Example B includes three isolated nodes: \(V_{11}\), \(V_{13}\) and \(V_{15}\). The Gram construction \(M^\mathsf{T}M\) does not detect nodes that appear in no hyperedge.
- The two complete hypergraphs are **not isomorphic** (in particular, they have different node counts). Their hyperedge-overlap structures also differ.
- These spectral descriptors are invariant under consistent relabeling of nodes and hyperedges, but are **not** general *topological invariants*.
- The numerical examples are **static constructed hypergraphs**, not datasets collected from protein folding, neuromuscular feedback or posture.
- The code alone does not implement time evolution, relaxation, a stopping rule, causal identification or a biologically calibrated projection operator.
- Similar spectra, even if found, would not by themselves establish physical equivalence or biological causality.

These domains remain proposed applications requiring measured data, an explicitly defined measurement-to-hypergraph mapping, prospective predictions and possible falsifiers.

## 4. Reproducibility and verification status

Inputs, corrected numerical values and code are included in this repository:

- [README](README.md) — assumptions, full hyperedge inputs and results;
- [Wolfram Language audit](AILAND_SpectralAudit_v1_1.wl) — incidence matrices and numerical/regression checks.

The main numerical values were independently recalculated using NumPy during revision. On **9 October 2026**, the author reproduced both entropy values, both descending spectra and dominant multiplicities \(\{1,2\}\) using focused checks in Wolfram Cloud. The author subsequently copied and ran the **entire** linked `.wl` source in Wolfram Cloud and returned its output: **all six regression checks evaluated to `True`** (two entropy checks, two spectrum checks, dominant multiplicity and three isolated nodes in example B).

**Verification boundary:** the run output is provided by the author rather than by an independently attested Wolfram environment. The successful computational checks do **not** validate the motivating biological hypotheses or infer physical causation.

## 5. Research status

The present defensible result is a reproducible comparison of **two illustrative hypergraph Gram spectra**. The next independent research step is to define data-grounded hypergraphs and test, without post-hoc tuning, whether useful spectral relations transfer across domains.

The original Wolfram Community post is preserved as a historical stage of the investigation.
