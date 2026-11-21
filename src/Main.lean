import Statements
import PrincipalRH
import Supplements.Kernels.MainTheoremsAll

theorem riemannHypothesis : RiemannHypothesis := PrincipalRH.riemannHypothesis

theorem riemannZeta_eq_zero_re : RiemannZetaZerosOnLine := PrincipalRH.riemannHypothesis

theorem LFunction_ne_zero_of_half_lt_re : DirichletLNonvanishingRightOfHalf := allChi

theorem LFunction_eq_zero_re : DirichletLZerosOnLine := claimAll.2.1

theorem LFunction_eq_zero_re_of_isPrimitive : PrimitiveDirichletLZerosOnLine := critAll
