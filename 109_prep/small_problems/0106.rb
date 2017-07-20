# Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

=begin

- in previous example, we reversed a sentence
- now we want to reverse words in a sentence, while keeping the sentence order the same.

approach:
- split the given sentence into an array of words
- iterate over the array, reversing words that are longer than 4 chars (we can do this using map)
- join the result (with whitespace between array elements)
=end

def reverse_words(sentence)
  words = sentence.split(' ')
  words.map do |word|
    if word.length > 4
      word.reverse
    else
      word
    end
  end.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
