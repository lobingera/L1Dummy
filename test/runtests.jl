using Cairo
using Compat, Colors
import Compat.String

using L1Dummy

@compat import Base.show

if VERSION >= v"0.5.0-dev+7720"
    using Base.Test
else
    using BaseTestNext
    const Test = BaseTestNext
end

# include("test_painting.jl")

#         output_file_name = "a.cs"
#         surf = L1ScriptSurface(output_file_name,512,512)
#         hdraw(surf,64,8,4) 
#         finish(surf)
#         destroy(surf)

#         @test isfile(output_file_name)

#         f = open(output_file_name)
#         str_data = read(f)
#         close(f)

#         @test length(str_data) > 3000 && str_data[1:10] == [0x25,0x21,0x43,0x61,0x69,0x72,0x6f,0x53,0x63,0x72]
#         rm(output_file_name)

# @testset "Vector Surfaces" begin

#         output_file_name = "a.cs"
#         surf = L1ScriptSurface(output_file_name,512,512)
#         hdraw(surf,64,8,4) 
#         finish(surf)
#         destroy(surf)

#         @test isfile(output_file_name)

#         f = open(output_file_name)
#         str_data = read(f)
#         close(f)

#         @test length(str_data) > 3000 && str_data[1:10] == [0x25,0x21,0x43,0x61,0x69,0x72,0x6f,0x53,0x63,0x72]
#         rm(output_file_name)

# end

using BinDeps
BinDeps.debug("Cairo")

Pkg.test("Cairo")
nothing
