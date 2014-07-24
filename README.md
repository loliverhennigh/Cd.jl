
# Cd.jl

## What it is

A simple Restricted Boltzmann machine for unsupervised learning in neural networks or other learning algorithms. Here is the wiki page on it http://en.wikipedia.org/wiki/Restricted_Boltzmann_machine.

## How install it

To install this package 
```
Pkg.clone("https://github.com/loliverhennigh/Cd.jl.git")
```

## A simple test on the MNIST DataBase of handwritten digits

I have included a simple test with the code. To load this type

```
using Cd
using TestDigits
```
Now to download the digits and store them
```
data = test_digits()
```
Now you can run cd1 learning on it cd1(data, hidden layer size, training size, iterations, learning rate)
```
weight_matrix = cd1(data, 100, 20, 2000, .0025)
```
To display this matrix type
```
display_weight_matrix(weight_matrix)
```
You should get something like

![Alt text](https://raw.githubusercontent.com/loliverhennigh/Cd.jl/master/test/Digits.png "Weight matrix")
