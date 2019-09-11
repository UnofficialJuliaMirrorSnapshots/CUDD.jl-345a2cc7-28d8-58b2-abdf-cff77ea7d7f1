module CUDD

using Compat

# cudd_path = joinpath(dirname(@__FILE__), "..", "deps", "cudd-3.0.0", "cudd", ".libs")
const depfile = joinpath(@__DIR__, "..", "deps", "deps.jl")

if isfile(depfile)
    include(depfile)
else
    error("CUDD not properly installed. Please run Pkg.build(\"CUDD\")")
end

include("ADD.jl")
include("ADD_apply.jl")
include("ADD_find.jl")
include("ADD_abs.jl")
include("ADD_inverse.jl")
include("ADD_ITE.jl")
include("ADD_negate.jl")
include("ADD_walsh.jl")


end # module
