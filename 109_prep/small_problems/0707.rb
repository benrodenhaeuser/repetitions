# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.


=begin

- requirements:

given: array of integers
exp. return value: --
exp. output:

- print product of array elements divided by number of elements
- rounded to three decimal places


- breakdown:

- method product(array) takes an array, returns the product of elems

- method show_multiplicative_average:
  - product = product(array)
  - divide product by number of elements in the array
  - print out result rounded to three decimal places


- implementation details

  - edge case: we should guard empty array (division by zero!)
  - how to round number to three decimal places?
  - use format
      puts "the result is #{format('%.3f', result)}"


=end



def product(array)
  array.inject(&:*)
end

def show_multiplicative_average(array)
  return puts "no empty array" if array.empty?

  product = product(array)
  result = product / array.size.to_f

  puts "the result is #{format('%.3f', result)}"
end


show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667
