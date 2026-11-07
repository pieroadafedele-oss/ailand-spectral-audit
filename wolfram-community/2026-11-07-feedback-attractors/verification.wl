ClearAll["Global`*"];
ass = k > 0 && v > 0 && Pi/2 < g < Pi;
rs = v/(k (g-Pi/2));
f = {v Cos[b], -k (b-g)-v Sin[b]/r};
jac = FullSimplify[D[f, {{r,b}}] /. {r->rs,b->Pi/2}, ass];
scalar = bias+(x0-bias) Exp[-k t];
checks = <|
 "ScalarODE" -> TrueQ[FullSimplify[D[scalar,t]+k(scalar-bias)] == 0],
 "ScalarInitial" -> TrueQ[FullSimplify[(scalar/.t->0)-x0] == 0],
 "OrbitEquilibrium" -> TrueQ[FullSimplify[f/.{r->rs,b->Pi/2},ass] == {0,0}],
 "NegativeTrace" -> TrueQ[FullSimplify[Tr[jac]<0,ass]],
 "PositiveDeterminant" -> TrueQ[FullSimplify[Det[jac]>0,ass]]
|>;
pars={v->1,k->10,g->3 Pi/4};
rstar=N[rs/.pars,30];
sol=NDSolveValue[{
 rr'[t]==Cos[bb[t]],
 bb'[t]==-10(bb[t]-3 Pi/4)-Sin[bb[t]]/rr[t],
 pp'[t]==Sin[bb[t]]/rr[t],
 rr[0]==1/5,bb[0]==Pi/2,pp[0]==0},
 {rr,bb,pp},{t,0,4},WorkingPrecision->35,AccuracyGoal->24,PrecisionGoal->24];
endError=Abs[sol[[1]][4]-rstar];
checks=Append[checks,"NumericalOrbitRadius"->TrueQ[endError<10^-8]];
report=<|"Checks"->checks,"AllPassed"->And@@Values[checks],
 "Radius"->N[rstar,14],"Eigenvalues"->N[Eigenvalues[jac/.pars],14],
 "RadiusAtT4"->N[sol[[1]][4],14],"RadiusErrorAtT4"->N[endError,8],
 "StateAtT1"->N[Through[sol[1]],14]|>;
report
