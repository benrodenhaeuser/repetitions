# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

=begin

approach:

- idea:
  - swap the element at 0 and element at (list.size - 1)
  - then swap element at 1 and element at (list.size - 2)
  - then swap element at 2 and element at (list.size - 3)
  - and so on

- express more clearly:
    - set left_index to 0
    - set right_index to (list.size - 1)
    - while left_index < right_index:
        swap list[left_index] and list[right_index]
        increment left_index, decrement right_index
    - return list
    - use helper method swap

- improvement:
    the swap can be done with a parallel assignment. then we don't need a swap method.

=end

def reverse!(list)
  left_index = 0
  right_index = list.size - 1
  while left_index < right_index
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end
  list
end

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!(list) # => []
p list == []
