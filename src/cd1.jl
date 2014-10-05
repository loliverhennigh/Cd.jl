
function cd1(training_data, size_of_layer, batch_size, iterations, learning_rate)

	# code follows geoff hinton's sample code for assignment 4 of his coursera class


	# the weight matrix this will return
	# random values between .1 and -.1
	weight_matrix = 0.1 * (rand(Float64, size_of_layer, size(training_data,1)) - .5)
	
	# store momentum
	momentum_speed = fill(0.0,size(weight_matrix))

	# store position of batch
	start_of_next_batch = 1;

	# for loop to update the matrix as it goes through the data
	for n = 1:iterations
		batch = extract_mini_batch(training_data, batch_size, start_of_next_batch)
		start_of_next_batch = mod(start_of_next_batch + batch_size, size(training_data,2)-batch_size) + 1 # need the plus one because julia indexs at 1
		cd_one_step(weight_matrix, batch, momentum_speed, learning_rate);
	end
	return weight_matrix
end	

function cd_one_step(weight_matrix, batch, momentum_speed, learning_rate)
	gradient = cd_gradient(batch, weight_matrix);
	momentum_speed = .9 * momentum_speed + gradient;
	weight_matrix += momentum_speed * learning_rate;

end

function cd_gradient(batch, weight_matrix)
	# do cd1 and return gradient for it

	batch = rand_vector_from_probabilities(batch)
	
	# calc hidden state from batch
	hidden_batch_1 = visible_to_hidden_state(batch, weight_matrix);
	# calc visible state from hidden state
	visible_batch_2 = hidden_to_visible_state(hidden_batch_1, weight_matrix);
	# calc hidden probability form visible state
	hidden_probability_2 = visible_to_hidden_probability(visible_batch_2, weight_matrix)
	
	# calc gradient form all this
	gradient = (goodness_gradient(batch,hidden_batch_1) - goodness_gradient(visible_batch_2, hidden_probability_2));
	return gradient'
end

# mini batch extractor
function extract_mini_batch(data, batch_size, start_of_next_batch)
	mini_batch = data[:,start_of_next_batch:(batch_size+start_of_next_batch - 1)]
	return mini_batch
end

# gradient calculator
function goodness_gradient(visible_batch, hidden_batch)
	return (visible_batch * hidden_batch') ./ size(visible_batch,2)
end


# used in cd stuff
function visible_to_hidden_probability(batch, weight_matrix)
	hidden = probabilities_calc(batch, weight_matrix)
	return hidden
end


function visible_to_hidden_state(batch, weight_matrix)
	hidden = probabilities_calc(batch, weight_matrix)
	hidden = rand_vector_from_probabilities(hidden)
	return hidden
end



function hidden_to_visible_state(hidden, weight_matrix)
	batch = probabilities_calc(hidden, weight_matrix')
	batch = rand_vector_from_probabilities(batch)
	return batch
end

function hidden_to_visible_state(hidden, weight_matrix)
	batch = probabilities_calc(hidden, weight_matrix')
	batch = rand_vector_from_probabilities(batch)
	return batch
end



