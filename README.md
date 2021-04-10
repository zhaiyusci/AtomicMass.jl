# AtomicMass.jl
A small Julia package returns the atomic mass of an isotope.



## Install

At present stage, the package has not been added to the Julia Lang registry since it is the initial version.

To install it, open your Julia RPLE and type

```julia
]add https://github.com/zhaiyusci/AtomicMass.jl
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

