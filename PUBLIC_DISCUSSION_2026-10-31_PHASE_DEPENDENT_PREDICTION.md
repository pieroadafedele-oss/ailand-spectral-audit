# From static spectral descriptors to phase-dependent predictive tests in cyclic brain-tissue mechanics

**Author:** Piero Adamoli  
**Public technical discussion:** 31 October 2026  
**Status:** Methodological comparison and invitation for technical critique; not a claim of a shared physical mechanism.

## Sources

- Static AILAND spectral audit and corrections: https://community.wolfram.com/t/28163
- Published analysis of cyclic porcine brain-tissue mechanics: https://community.wolfram.com/t/28365
- Original experimental data (Ruhland et al.): https://doi.org/10.5281/zenodo.20133263

## Discussion

The AILAND hypergraph spectral audit concerns static, explicitly constructed incidence matrices. The separate brain-tissue analysis concerns measured data and phase-dependent predictive comparisons. The connection is **methodological**, not evidence that the two results share a physical mechanism.

On the corrected fixed offline later-cycle test window for ten porcine brain-tissue specimens, the branch-aware cubic predictor reduced test MSE against a displacement-only cubic predictor with median specimen-wise reduction **60.498142%** (**10/10** positive).

An earlier **63.104473%** figure was corrected publicly after identifying overlap of train/test row indices.

A sensitivity check that excluded the first ten rows of the corrected test windows changed the median result to **−0.550438%** (**5/10** positive). Thus the improvement is strongly dependent on the selected phase/window.

In a **distinct comparison**, a continuous-velocity predictor outperformed the branch-aware predictor in **9/10** specimens. The differing comparison protocols must not be collapsed into a single head-to-head performance claim.

These analyses are based on offline, filtered measurements. They do not establish a unique physical memory mechanism, an independent-specimen prospective prediction, or a common causal mechanism between the spectral audit and tissue mechanics.

## Falsifiable next comparison

Predeclare non-overlapping phase-dependent train/test windows. Examine filter-support leakage at boundaries. Apply matched displacement-only, branch-aware and continuous-velocity baselines with fixed evaluation windows. Report specimen-wise MSE, paired differences, and sensitivity to exclusion of initial test rows.

## Attribution

Analysis and scientific interpretation: Piero Adamoli. Computation and drafting were AI-assisted; scientific interpretation and publication decisions belong to the author.

Constructive technical criticism and independent replication are welcome.

---

This note makes the previously prepared PostScholar discussion text openly accessible as an independent GitHub publication. **It is not a PostScholar discussion or a peer-reviewed article.**