include(joinpath(Pkg.dir(), "Cd", "test", "test_digits.jl"))


module Cd

using Images
using ImageView

include("cd1.jl")
include("display_weight_matrix.jl")
include("logistic_calc.jl")
include("randomize_vector.jl")
include("probabilities_calc.jl")


export 
	cd1,	
	display_weight_matrix


# package code goes here

end # module
