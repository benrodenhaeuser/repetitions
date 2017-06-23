# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

=begin

approach:
  - we need to sum over the array
  - and divide by the size of the array

  - summing up can be done with reduce

=end

def average(array)
  sum = array.inject(&:+)
  sum / array.size
end

# or, less terse:

def average(array)
  sum = array.inject { |memo, val| memo + val }
  sum / array.size
end

# or, even more terse:

def average(array)
  array.inject(&:+) / array.size
end


puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
