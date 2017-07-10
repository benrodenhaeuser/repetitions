# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

=begin

approach:

- zip the two arrays
- take the product of each element-array

=end


def multiply_list(list1, list2)
  list1.zip(list2).map { |pair| pair[0] * pair[1] }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
