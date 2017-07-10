# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

=begin

approach:

- produce a hash containing the array elements as keys.
- return the hash keys.

=end

def merge(array1, array2)
  hash = {}
  (array1 + array2).each { |elem| hash[elem] = true }
  hash.keys
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
