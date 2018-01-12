# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc # invokes my_proc.to_s
# puts my_proc.class # Proc
# my_proc.call # This is a .
# my_proc.call('cat') # This is a cat.

# PROC:
# parameters that are not filled with arguments are assigned to nil.
# procs are instances of the class Proc.

# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# # my_lambda.call # ArgumentError
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
# # there is no Lambda class, so there is no Lambda::new method

# LAMBDA:
# if a lambda block parameter is not filled with an argument, an exception is thrown
# lambdas are (also) instances of the class Proc.


# def block_method_1(animal)
#   yield
# end
#
# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# if ruby executes `yield` during a method invocation, and no block was passed to the method, an exception is thrown (LocalJumpError)


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}


# if fewer arguments are passed to a block than required by its parameter list, the missing parameters are assigned to nil. (like with procs)

# blocks and ordinary procs: "don't care about arity"
# lambdas: "care about arity"


# What are they?
# Blocks are not objects, while lambdas and procs are objects
# Procs and lambdas are both instances of the class Proc
# (There is no Lambda class!)

#
# Blocks and procs are both liberal w.r.t. arity: if fewer arguments are passed to a block or proc than required by its argument list, the parameter slots are filled with arguments from left to right, and the "missing" parameters are filled with nil arguments
# Lambdas are more like methods w.r.t. arity: the number of arguments passed to a lambda has to match its arity (i.e., its number of parameters)
