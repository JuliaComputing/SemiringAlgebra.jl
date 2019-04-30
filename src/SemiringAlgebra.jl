module SemiringAlgebra

export MPNumber, mparray, array, mpsparse

import Base: +,*
using SparseArrays

struct MPNumber{T} <: Number
    val::T
end

+(a::MPNumber, b::MPNumber) = MPNumber(max(a.val,b.val))
*(a::MPNumber, b::MPNumber) = MPNumber(a.val+b.val)

Base.show(io::IO, k::MPNumber) = print(io, k.val)
Base.zero(::MPNumber{T}) where T = MPNumber(typemin(T))
Base.one(::MPNumber{T}) where T = MPNumber(zero(T))
Base.zero(::Type{MPNumber{T}}) where T = MPNumber(typemin(T))
Base.one(::Type{MPNumber{T}}) where T = MPNumber(zero(T))
Base.promote_rule(::Type{MPNumber}, ::Type{Number}) = MPNumber

mparray(A::Array) = map(MPNumber, A)
array(A::Array{MPNumber{T}}) where{T} = map(x->x.val, A)

mpsparse(S::SparseMatrixCSC) =
    SparseMatrixCSC(S.m, S.n, S.colptr, S.rowval, mparray(S.nzval))

function ringmatmul(+, *, A::Matrix, B::Matrix)
    m, n, p = size(A,1), size(B,2), size(A,2)
    C = [A[i,1]*B[1,j] for i=1:m, j=1:n]
    for i=1:m, j=1:n, k=2:p
        C[i,j] += A[i,k]*B[k,j]
    end 
    return C
end      

*((+)::Function, (*)::Function) = (A,B)->ringmatmul(+,*,A,B)

function bench(n)
    println(n, "x", n, " Float64 array")
    a = rand(n,n); b = rand(n,n); GC.gc(); @time  a*b
    println(n, "x", n, " MPNumber{Float64} array")
    a = mparray(a); b = mparray(b); GC.gc(); @time  a*b
    println()
    
    println(n, "x", n, " Int64 array")
    a = rand(Int64, n, n); b = rand(Int64, n, n); GC.gc(); @time  a*b
    println(n, "x", n, " MPNumber{Int64} array")
    a = mparray(a); b = mparray(b); GC.gc(); @time  a*b
    println()    

    println(n, "x", n, " sparse Float64 array (dense array in sparse format)")
    a = sparse(rand(n,n)); b = sparse(rand(n,n)); GC.gc(); @time  a*b
    println(n, "x", n, " sparse MPNumber{Float64} array (dense array in sparse format)")
    a = mpsparse(a); b = mpsparse(b); GC.gc(); @time  a*b
    println()

    println(1000*n, "x", 1000*n, " sparse Float64 array (sprand(n,n,1/n))")
    a = sprand(1000*n,1000*n, 1/(n*1000)); b = sprand(1000*n,1000*n,1/(n*1000)); GC.gc(); @time  a*b
    println(1000*n, "x", 1000*n, " sparse MPNumber{Float64} array (sprand(n,n,1/n))")
    a = mpsparse(a); b = mpsparse(b); GC.gc(); @time  a*b
    println()

    println(1000*n, "x", 1000*n, " sparse Float64 array (sprand(n,n,5/n))")
    a = sprand(1000*n,1000*n, 5/(n*1000)); b = sprand(1000*n,1000*n,5/(n*1000)); GC.gc(); @time  a*b
    println(1000*n, "x", 1000*n, " sparse MPNumber{Float64} array (sprand(n,n,5/n))")
    a = mpsparse(a); b = mpsparse(b); GC.gc(); @time  a*b
    println()

    return 
end

end # module
