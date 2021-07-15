SemiringAlgebra.jl
==================

The `doc/` directory includes a paper [Novel Algebras for Advanced Analytics in Julia](https://dspace.mit.edu/handle/1721.1/115964), which describes the motivation for this package and its design.

Example usage, see the [bench()](https://github.com/JuliaComputing/SemiringAlgebra.jl/blob/af67f6705bc531a85c61bc4e270be90fb8a54b24/src/SemiringAlgebra.jl#L37) function in `SemringAlgebra.jl`.

```julia
julia> using Pkg; Pkg.add(PackageSpec(url = pwd())); Pkg.build()

julia> Pkg.test("SemiringAlgebra")

julia> using SemiringAlgebra

julia> SemiringAlgebra.bench(100)

100x100 Float64 array
  0.000345 seconds (2 allocations: 78.203 KiB)
100x100 MPNumber{Float64} array
  0.002951 seconds (8 allocations: 78.531 KiB)

100x100 Int64 array
  0.000643 seconds (8 allocations: 78.531 KiB)
100x100 MPNumber{Int64} array
  0.000465 seconds (8 allocations: 78.531 KiB)

100x100 sparse Float64 array (dense array in sparse format)
  0.116772 seconds (198.15 k allocations: 9.675 MiB)
100x100 sparse MPNumber{Float64} array (dense array in sparse format)
  0.102237 seconds (199.09 k allocations: 9.695 MiB)

100000x100000 sparse Float64 array (sprand(n,n,1/n))
  0.007495 seconds (20 allocations: 10.677 MiB)
100000x100000 sparse MPNumber{Float64} array (sprand(n,n,1/n))
  0.007558 seconds (20 allocations: 10.677 MiB)

100000x100000 sparse Float64 array (sprand(n,n,5/n))
  0.147927 seconds (22 allocations: 65.650 MiB, 4.86% gc time)
100000x100000 sparse MPNumber{Float64} array (sprand(n,n,5/n))
  0.146088 seconds (22 allocations: 65.650 MiB, 4.94% gc time)
```
