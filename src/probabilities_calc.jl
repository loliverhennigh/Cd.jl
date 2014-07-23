#include("logistic_calc")

function probabilities_calc(layer1, weights)

	layer2 = weights * layer1;
	return logistic_calc(layer2);

end

