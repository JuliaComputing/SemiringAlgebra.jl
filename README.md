SemiringAlgebra.jl
==================

The doc/ directory includes a paper "Novel Algebras for Advanced Analytics in Julia", which describes the motivation for this package and its design.

Example usage, see the bench() function in SemringAlgebra.jl.

julia> require("SemiringAlgebra.jl")

julia> importall SemiringAlgebra

julia> SemiringAlgebra.bench(100)
100x100 Float64 array
elapsed time: 0.000263905 seconds
100x100 MPNumber{Float64} array
elapsed time: 0.312653617 seconds

100x100 Int64 array
elapsed time: 0.001721872 seconds
100x100 MPNumber{Int64} array
elapsed time: 0.30254149 seconds

100x100 sparse Float64 array (dense array in sparse format)
elapsed time: 0.00403946 seconds
100x100 sparse MPNumber{Float64} array (dense array in sparse format)
elapsed time: 0.084416292 seconds

100000x100000 sparse Float64 array (sprand(n,n,1/n))
elapsed time: 0.020854893 seconds
100000x100000 sparse MPNumber{Float64} array (sprand(n,n,1/n))
elapsed time: 0.021785223 seconds

100000x100000 sparse Float64 array (sprand(n,n,5/n))
elapsed time: 0.46143671 seconds
100000x100000 sparse MPNumber{Float64} array (sprand(n,n,5/n))
elapsed time: 0.413843755 seconds


