# Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

# don't use built-in reverse methods.

=begin

approach:

overall:
- produce an array containing the individual words as elements
- reverse that array => auxiliary method
- return reversed array

- how to reverse array?

[1, 2, 3] should become [3, 2, 1]

initialize empty array reversed
while array is not empty:
  "pop element from array, push it to reversed
return reversed

(hoever, we do not want to mutate the array argument, so we reassign it instead of popping).

=end

def reverse_array(array)
  reversed = []
  while array != []
    reversed << array.last
    array = array[0..-2]
  end
  reversed
end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed = reverse_array(words)
  reversed.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
