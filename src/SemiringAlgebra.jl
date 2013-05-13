module SemiringAlgebra

importall Base

export MPNumber, mparray, array

immutable MPNumber{T} <: Number
    val::T
end

show(io::IO, k::MPNumber) = print(io, k.val)
+(a::MPNumber, b::MPNumber) = MPNumber(max(a.val,b.val))
*(a::MPNumber, b::MPNumber) = MPNumber(a.val+b.val)

zero{T}(::Type{MPNumber{T}}) = MPNumber(typemin(T))
one{T}(::Type{MPNumber{T}}) = MPNumber(zero(T))
promote_rule(::Type{MPNumber}, ::Type{Number}) = MPNumber

mparray(A::Array) = map(MPNumber, A)
array{T}(A::Array{MPNumber{T}}) = map(x->x.val, A)

function semiring_matmul(pl, ti, A::Matrix, B::Matrix)
    m=size(A,1); n=size(B,2); p=size(A,2)
    C=[ti(A[i,1],B[1,j]) for i=1:m,j=1:n]
    for i=1:m, j=1:n, k=2:p
        C[i,j] = pl(C[i,j], ti(A[i,k],B[k,j]))
    end 
    C         
end      

function *(pl::Function, ti::Function)
   (A,B)->semiring_matmul(pl,ti,A,B)
end

end # module
