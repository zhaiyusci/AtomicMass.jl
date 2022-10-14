module AtomicMass
using DataFrames
using CSV

srcdir= @__DIR__
pt=DataFrame(CSV.File(srcdir * "/atomicmass.csv", 
                      types=[String, Int, String, String, Int, Float64, Float64]));

function _atomicmass(s::T) where T<:AbstractString
    parse(Float64, sort(dropmissing(filter(x->x.E==s, pt)), :x_val, rev=true)[1,:].m_val)
end
function _atomicmass(s::T1, A::T2) where {T1<:AbstractString , T2<:Integer}
    parse(Float64, filter(x->(x.E==s && x.A==A), pt)[1,:].m_val)
end
function _atomicmass(Z::T) where T<:Integer
    parse(Float64, sort(dropmissing(filter(x->x.Z==Z, pt)), :x_val, rev=true)[1,:].m_val)
end
function _atomicmass(Z::T, A::T) where T <: Integer
    parse(Float64, filter(x->(x.Z==Z && x.A==A), pt)[1,:].m_val)
end

"""
    atomicmass(s::AbstractString)

Return the mass of the isotope in atomic mass unit (amu).

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

Newest data is taken from [CIAAW](https://www.ciaaw.org/atomic-masses.htm).
Please cite 
> Meng Wang et al., *Chinese Phys. C* **45**, 030003 (2021)
if the data is used in research.
"""
function atomicmass(s::AbstractString) 
    elem=match(r"[[:alpha:]]+", s)
    if elem !== nothing
        #  name=titlecase(elem.match)
        name=elem.match
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

"""
    atomicnumber(s::AbstractString)

Return the atomic number of given element.
"""
function atomicnumber(s::AbstractString)
    elem=match(r"[[:alpha:]]+", s)
    if elem !== nothing
        name = elem.match
        return sort(dropmissing(filter(x->x.E==name, pt)), :x_val, rev=true)[1,:].Z
    end
    return nothing
end

export atomicmass, atomicnumber

end # module
