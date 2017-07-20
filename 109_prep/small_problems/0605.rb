# Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

=begin

approach:

idea:
- take last element of given array and make it first element of new array
- take second-to-last element of given array and make it second elem of new arr
- and so on

more precisely:
- given array 'array'
- initialize empty array 'reversed'
- while array is not empty:
  - push array[-1] to reversed
  - reassign array to array[0..-2]
- return reversed

=end


def reverse(array)
  reversed = []
  while !array.empty?
    reversed << array[-1]
    array = array[0..-2]
  end
  reversed
end


=begin

another approach:

use inject!

- iterate over the array with inject.
- prepend the current element to the "memo list"

=end

def reverse(array)
  array.inject([]) { |memo, current| [current] + memo }
end


=begin

yet another approach:

use each_with_object

- call each_with_object with empty array as argument
- prepend current element to obj on each iteration

=end

def reverse(array)
  array.each_with_object([]) { |current, obj| obj.unshift(current) }
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true
