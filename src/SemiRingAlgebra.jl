module SemiRingAlgebra

importall Base

export SRNumber

immutable SRNumber{T} <: Number
    val::T
end

show(io::IO, k::SRNumber) = print(io, k.val)
+(a::SRNumber, b::SRNumber) = SRNumber(max(a.val,b.val))
*(a::SRNumber, b::SRNumber) = SRNumber(a.val+b.val)

zero{T}(x::SRNumber{T}) = SRNumber(zero(T))
convert{T}(::Type{SRNumber{T}}, i::Int64) = SRNumber(convert(T,i))
promote_rule(::Type{SRNumber}, ::Type{Integer}) = SRNumber
promote_rule(::Type{SRNumber}, ::Type{FloatingPoint}) = SRNumber

end # module
