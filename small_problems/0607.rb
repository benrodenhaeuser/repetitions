# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

=begin

approach:

- take note of the edge case: an empty array should be split in two halvsies (both empty arrays)
- examples of how to split correctly:
  - four elements (array.size / 2 equals 2)
    - index 0 and 1 go left
    - index 2 and 3 go right
  - three elements (array.size / 2 equals 1):
    - index 0 and 1 go left
    - index 2 goes right
- generalize:
  - if the size of the array is odd, put indices < array.size / 2 in left array
  - else put indices <= array.size / 2 in left array
  - possible to unify the two cases in a single one?
  - use floating point division and Math.ceiling
  - (array.size / 2.0).ceil
  - take the two examples
    - if array.size is 4, then (array.size / 2.0).ceil equals 2
    - if array.size is 3, then (array.size / 2.0).ceil equals 2
  - general rule: put the elements with index < (array.size / 2.0).ceil left

algorithm:

  - initialize two empty arrays, left and right
  - iterate over the given array:
    - put elements with index < (array.size / 2.0).ceil in left
    - put elements with index >= (array.size / 2.0).ceil in right
  - return [left, right]

=end

def halvsies(array)
  left = []
  right = []
  array.each_index do |index|
    if index < (array.size / 2.0).ceil
      left << array[index]
    else
      right << array[index]
    end
  end
  [left, right]
end

# refactor: we can just take two slices

def halvsies(array)
  mid = (array.size / 2.0).ceil
  left = array[0...mid]
  right = array[mid...array.size]
  [left, right]
end

# even shorter:
def halvsies(array)
  mid = (array.size / 2.0).ceil
  [array[0...mid], array[mid...array.size]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
