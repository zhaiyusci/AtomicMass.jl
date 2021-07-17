# AtomicMass.jl
A small Julia package returns the atomic mass of an isotope.



## Install

To install it, open your Julia RPLE and type

```julia
]add AtomicMass.jl
```

## Usage

There is only one exported function in the package.

```julia
using AtomicMass
atomicmass("H")   # 1.00782503223
atomicmass("D")   # 2.01410177812
atomicmass("H2")  # 2.01410177812
atomicmass("H-2") # 2.01410177812
```

