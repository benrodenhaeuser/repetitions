# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

=begin

example:

original array:
[2, 5, 13]

new array elements:
2 (sum of the elements from array[0] to array[0])
7 (sum of the elements from array[0] to array[1])
20 (sum of the elements from array[0] to array[2])

==> what is happening here?

=end

def sum(array)
  array.inject(&:+)
end

def running_total(array)
  (0...array.size).map { |index| sum(array[0..index]) }
end

# however, this is not particularly elegant, because we are doing many summations many times over – we could just reuse them!

# like this:
def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
