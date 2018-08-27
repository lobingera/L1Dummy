module L1Dummy

# package code goes here
using Graphics
using Compat

export L1ScriptSurface

mutable struct L1Script <: GraphicsDevice
    ptr::Ptr{Void}
end

function destroy(s::L1Script)
    if s.ptr == C_NULL
        return
    end
    s.ptr = C_NULL
    nothing
end

end # module
