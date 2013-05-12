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
promote_rule(::Type{MPNumber}, ::Type{Integer}) = MPNumber
promote_rule(::Type{MPNumber}, ::Type{FloatingPoint}) = MPNumber

mparray(A::Array) = map(MPNumber, A)
array{T}(A::Array{MPNumber{T}}) = map(x->x.val, A)

end # module
