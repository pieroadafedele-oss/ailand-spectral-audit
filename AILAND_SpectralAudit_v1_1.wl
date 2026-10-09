(* AILAND spectral audit v1.1 | 2026-10-09
   Inputs: illustrative, manually specified hypergraphs (not biological measurements).
   G = Transpose[M].M is a hyperedge Gram matrix, NOT a graph Laplacian.
   No Fiedler eigenvalue, dynamics, biological validation, or topology
   inference is established by this script.

   Audit note: the author ran focused Wolfram Cloud tests on 2026-10-09
   confirming entropy, descending spectra and dominant multiplicities.
   This combined file has not yet been separately executed in Wolfram Cloud.
*)

ClearAll[ailandSpectralAudit, ailandA, ailandB, ailandResult,
         ailandExpectedCheck];

ailandSpectralAudit[n_Integer?Positive, edges_List] := Module[
  {m, g, spectrum, positive, p, entropy, max, mult, isolated},
  m = Table[
    Boole[MemberQ[edges[[j]], i]],
    {i, 1, n}, {j, 1, Length[edges]}
  ];
  g = Transpose[m].m;
  (* Convert to numeric BEFORE sorting: sorting exact algebraic
     expressions can follow structural rather than numeric order. *)
  spectrum = Reverse[Sort[N[Eigenvalues[g], 12]]];
  positive = Select[spectrum, # > 10^-10 &];
  entropy = If[positive === {},
    Missing["UndefinedForZeroTrace"],
    p = positive/Total[positive];
    -Total[p Log2[p]]
  ];
  max = First[spectrum];
  mult = Count[spectrum, x_ /; Abs[x - max] < 10^-8];
  isolated = Select[Range[n], Total[m[[#]]] == 0 &];
  <|
    "Nodes" -> n,
    "Hyperedges" -> Length[edges],
    "IsolatedNodeIndices" -> isolated,
    "GramMatrix" -> g,
    "GramSpectrumDescending" -> spectrum,
    "SpectralEntropyBits" -> entropy,
    "LargestGramEigenvalue" -> max,
    "SecondLargestGramEigenvalue" -> If[Length[spectrum] >= 2,
      spectrum[[2]], Missing["NotAvailable"]],
    "DominantMultiplicity" -> mult
  |>
];

ailandA = {
  {1, 2, 4},
  {3, 4, 7},
  {5, 6, 9},
  {7, 8, 10},
  {10, 11, 12}
};

ailandB = {
  {1, 2, 5},
  {3, 4, 8},
  {5, 6, 12},
  {7, 8, 14},
  {9, 10, 16}
};

ailandResult = <|
  "ExampleA" -> ailandSpectralAudit[12, ailandA],
  "ExampleB" -> ailandSpectralAudit[16, ailandB]
|>;

(* These are regression checks against the corrected published numbers,
   not evidence of any physical or biological interpretation. *)
ailandExpectedCheck = <|
  "EntropyA" ->
    Abs[ailandResult["ExampleA", "SpectralEntropyBits"] -
      2.2210270084] < 10^-8,
  "EntropyB" ->
    Abs[ailandResult["ExampleB", "SpectralEntropyBits"] -
      2.2565647621] < 10^-8,
  "SpectrumA" ->
    Max[Abs[ailandResult["ExampleA", "GramSpectrumDescending"] -
      {4.6180339887, 3.6180339887, 3., 2.3819660113,
       1.3819660113}]] < 10^-8,
  "SpectrumB" ->
    Max[Abs[ailandResult["ExampleB", "GramSpectrumDescending"] -
      {4., 4., 3., 2., 2.}]] < 10^-8,
  "DominantMultiplicity" ->
    {ailandResult["ExampleA", "DominantMultiplicity"],
      ailandResult["ExampleB", "DominantMultiplicity"]} == {1, 2},
  "IsolatedNodesB" ->
    ailandResult["ExampleB", "IsolatedNodeIndices"] == {11, 13, 15}
|>;

{ailandResult, ailandExpectedCheck}
