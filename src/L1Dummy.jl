module L1Dummy

# package code goes here
using Graphics
using Compat
using Cairo

export L1ScriptSurface

type L1Script <: GraphicsDevice
    ptr::Ptr{Void}

    function L1Script{T<:IO}(stream::T)
        callback = Cairo.get_stream_callback(T)
        ptr = ccall((:cairo_script_create_for_stream,Cairo._jl_libcairo), Ptr{Void},
                (Ptr{Void}, Any), callback, stream)
        self = new(ptr)
        finalizer(self, destroy)
        self
    end

    function L1Script(filename::AbstractString)
        ptr = ccall((:cairo_script_create,Cairo._jl_libcairo),
                    Ptr{Void}, (Ptr{UInt8},), @compat(String(filename)))
        self = new(ptr)
        finalizer(self, destroy)
        self
    end
end

function destroy(s::L1Script)
    if s.ptr == C_NULL
        return
    end
    ccall((:cairo_device_destroy,Cairo._jl_libcairo), Void, (Ptr{Void},), s.ptr)
    s.ptr = C_NULL
    nothing
end


function L1ScriptSurface{T<:IO}(stream::T, w::Real, h::Real)
    s = L1Script(stream)
    ptr = ccall((:cairo_script_surface_create,Cairo._jl_libcairo), Ptr{Void},
                (Ptr{Void},Int32,Float64,Float64),s.ptr ,Cairo.CONTENT_COLOR_ALPHA, w, h)
    CairoSurface(ptr, w, h)
end

function L1ScriptSurface(filename::AbstractString, w::Real, h::Real)
    s = L1Script(filename)
    ptr = ccall((:cairo_script_surface_create,Cairo._jl_libcairo), Ptr{Void},
                (Ptr{Void},Int32,Float64,Float64),s.ptr ,Cairo.CONTENT_COLOR_ALPHA, w, h)
    CairoSurface(ptr, w, h)
end

    # function L1Script{T<:IO}(stream::T)
    #     callback = Cairo.get_stream_callback(T)
    #     ptr = ccall((:cairo_script_create_for_stream,Cairo._jl_libcairo), Ptr{Void},
    #             (Ptr{Void}, Any), callback, stream)
    #     self = Cairo.CairoScript(ptr)
    #     finalizer(self, destroy)
    #     self
    # end

    # function CairoScriptSurface{T<:IO}(stream::T, w::Real, h::Real)
    # s = CairoScript(stream)
    # ptr = ccall((:cairo_script_surface_create,Cairo._jl_libcairo), Ptr{Void},
    #             (Ptr{Void},Int32,Float64,Float64),s.ptr ,Cairo.CONTENT_COLOR_ALPHA, w, h)
    # CairoSurface(ptr, w, h)
    # end

end # module
