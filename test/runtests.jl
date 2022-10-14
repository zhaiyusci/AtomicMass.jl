using Test
using AtomicMass

@test atomicmass("H") == 1.007825031898
@test atomicmass("D") == 2.014101777844
@test atomicmass("H3") == 3.01604928132
@test atomicmass("e") == 0.000548579909065
@test atomicnumber("H") == 1
@test atomicnumber("C") == 6
@test atomicnumber("O16") == 8
