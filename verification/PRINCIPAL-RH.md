# Ordinary RH via the principal character

[`PrincipalRH.riemannHypothesis`](../src/PrincipalRH.lean) proves Mathlib’s
`RiemannHypothesis` without hypotheses. It specializes Levent Alpöge’s proof to the principal
character. The added modules come from [RiemannGaussian](https://github.com/dbsanfte/RiemannGaussian/tree/9628c023/scripts).

The proof constructs the height-401 arithmetic window for the principal character. One family
of reciprocity-based bundles supplies the lift-rank bound and the weighted, irreducibility,
divisibility and spectral comparisons. The theta identities and Hodge covolume bound give a
common period grid for that family.

The `PrincipalRH` import closure contains 165,070 original source modules and 31 new modules,
excluding Lean and Lake package dependencies. The previously verified principal-character
route in RiemannGaussian used 175,174 original modules. The new route saves 10,104 original
modules and omits the all-character assembly. The three Dirichlet L-function declarations
in `Main` still use that assembly. [Earlier principal proof receipt](https://github.com/dbsanfte/RiemannGaussian/blob/9628c023/docs/research-evidence/alpoge-archive-principal-rh.json).

## Verification

For a source build with Lean 4.33.1 and the pinned Mathlib cache, run the build and replay
inside the solution sandbox described in the [README](../README.md#checking-it).

```sh
export LEAN_ABORT_ON_PANIC=1
export LAKE_ARTIFACT_CACHE=false
lake exe mathlib/cache get
lake build PrincipalRH
lake env lean --stdin <<'LEAN'
import LeanChecker

unsafe def replayPrincipalRH : IO Unit := do
  Lean.initSearchPath (← Lean.findSysroot)
  replayFromImports `PrincipalRH

#eval replayPrincipalRH
LEAN
```

Fetch the Mathlib cache before entering the sandbox. On Linux, this import closure may require
raising `vm.max_map_count` for Lean’s compact-region loader. The endpoint’s transitive axiom
audit checks for `propext`, `Classical.choice` and `Quot.sound`.
