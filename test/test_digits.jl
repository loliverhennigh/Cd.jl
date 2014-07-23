module TestDigits

using Images
using ImageView
using GZip


export test_digits

include("read_data_MSB.jl")


function test_digits()
	digitdir = joinpath(Pkg.dir(), "Cd", "test", "digits")
	if !isdir(digitdir)
		mkdir(digitdir)
	end
	digit_file_images = joinpath(digitdir, "train_images-idx3-ubyte.gz")
	if !isfile(digit_file_images)
		download("http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz" , digit_file_images)
	end
	data = read_data_MSB(digit_file_images, 20000)
	return data
end

end

