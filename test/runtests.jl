using SemiringAlgebra

using Test

A = ones(3,3)
A[1,3] = 3
A[2,3] = 3
A[3,3] = 3
Amp = mparray(A)
@test array(Amp*Amp) == [4.0  4.0  6.0; 4.0  4.0  6.0; 4.0  4.0  6.0]
@test *(max,+)(A,A) == [4.0  4.0  6.0; 4.0  4.0  6.0; 4.0  4.0  6.0]
