module AtomicMass
using JuliaDB

srcdir= @__DIR__
pt=load(srcdir * "/atomicmass.db");

function _atomicmass(s::T) where T<:AbstractString
    filter(x->x.Symbol==s, pt)[1].m
end
function _atomicmass(s::T1, A::T2) where {T1<:AbstractString , T2<:Integer}
    filter(x->(x.Symbol==s && x.A==A), pt)[1].m
end
function _atomicmass(Z::T) where T<:Integer
    filter(x->x.Z==Z, pt)[1].m
end
function _atomicmass(Z::T, A::T) where T <: Integer
    filter(x->(x.Z==Z && x.A==A), pt)[1].m
end

"""
    atomicmass(s::T) where T<:AbstractString

Return the mass of the isotope in Dalton.

If mass number is unspecified, return the mass of the most abundant species.

# Examples
```julia-repl
julia> atomicmass("H-2")
2.01410177812

julia> atomicmass("H2")
2.01410177812

julia> atomicmass("D")
2.01410177812

julia> atomicmass("H")
1.00782503223
```
"""
function atomicmass(s::T) where T<:AbstractString
    elem=match(r"[[:alpha:]]{1,3}", s)
    if elem !== nothing
        name=titlecase(elem.match)
        massnumber=match(r"[[:digit:]]{1,3}", s)
        if massnumber !==nothing
            A=parse(Int, massnumber.match)
            return _atomicmass(name, A)
        else
            return _atomicmass(name)
        end
    end
    return nothing        
end

export atomicmass
end # module
