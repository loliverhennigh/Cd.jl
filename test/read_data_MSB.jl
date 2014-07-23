#include("data.jl")


function read_data_MSB(file,size)
	#open file and read it
	s = GZip.open(file);
	#seek correct possition 
	seek(s,16);
	#read in data
	data = read(s,Uint8,784,size);
	data = data ./ 255 
	return data;

end

