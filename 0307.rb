# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument. The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

=begin

so we want to return array[0], array[2] and so on ...
in fact: the values at *even* indices

=end

# solution 1
def oddities(array)
  array.select.with_index { |_, index| index.even? }
end

# solution 2
def oddities(array)
  odd_ones = []
  array.each_index do |index|
    odd_ones << array[index] if index.even?
  end
  odd_ones
end

# solution 3
def oddities(array)
  odd_ones = []
  index = 0
  while index < array.length
    odd_ones << array[index] if index.even?
    index += 1
  end
  odd_ones
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
