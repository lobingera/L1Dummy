using L1Dummy
using Base.Test

# write your own tests here
@test 1 == 1

include("sample_imagepattern.jl")
display(readdir())
