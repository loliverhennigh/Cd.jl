

function rand_vector_from_probabilities(probabilities)
	x = rand(size(probabilities));
	return float(x .< probabilities);
end
