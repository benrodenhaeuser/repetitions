# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

=begin

approach:
- initialize a new array (empty)
- iterate over the given array, for each element:
  - remove vowels from the element
  - push element with vowels removed to new array
- return new array

- details:
  - how to remove vowels from the element? use gsub
    given a string: string_without_vowels = string.gsub(/[aeiouAEIOU]/, '')
  - streamline: use `map` instead of `each`

=end


def remove_vowels(array_of_strings)
  array_of_strings.map { |string| string.gsub(/[aeiouAEIOU]/, '') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
