# AtomicMass.jl
A small Julia package returns the atomic mass of an isotope.



## Install

To install it, open your Julia RPLE and type

```julia
]add AtomicMass.jl
```

## Usage

There are only two exported functions in the package.

```@repl
using AtomicMass
atomicmass("H")
atomicmass("H2")
atomicmass("H-2")
atomicmass("D") 
atomicmass("p") # Support proton
atomicmass("e") # and electron

atomicnumber("H") # returns 1
atomicnumber("C") # returns 6
```

