# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

=begin

approach:

- iterate over the array:
  - for current elem of array:
    - return true if elem equals given
  - after iteration:
    - return false

=end

def include?(array, value)
  array.each do |elem|
    return true if elem == value
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
