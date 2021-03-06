
#using Images
#using ImageView

function display_weight_matrix(weight_matrix)

	length_img = int(sqrt(size(weight_matrix,2)))
	
	if length_img^2 != size(weight_matrix,2)
		print("sorry but there is no clear way to display this matrix")
		print("the inputs must have a int square-root")
		return 
	end

	# seperate the vectors and use canvas function of ImageView
	side_length = int(floor(sqrt(size(weight_matrix,1))+.999))

	c = canvasgrid(side_length,side_length)


	for n=1:size(weight_matrix,1)
		geff_pic = Array(Float64, length_img, length_img, 3)
		geff_pic[:,:,1] = reshape(weight_matrix[n,:], length_img, length_img) .+ .5
		geff_pic[:,:,2] = geff_pic[:,:,1]
		geff_pic[:,:,3] = geff_pic[:,:,1]
		x_pos = mod1(n,side_length)
		y_pos = int(floor((n-1)/side_length)) + 1
		view(c[x_pos,y_pos], geff_pic)
	end




end
