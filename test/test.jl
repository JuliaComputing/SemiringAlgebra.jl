require("SemiringAlgebra.jl")
import SemiringAlgebra.SRNumber

A=map(SRNumber,rand(5,5))

println(A)
println(A*A)

se=speye(5)
s = SparseMatrixCSC(s.m, s.n, s.colptr, s.rowval, map(SRNumber, rand(5)))
println(s*s)
