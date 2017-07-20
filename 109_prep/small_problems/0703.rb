# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

=begin

approach:

- split the sentence given into array `words`
- initialize `capitalized_words` to []
- for each word in words:
  - push capitalized word to capitalized_words
- return capitalized_words (joined with delimiting whitespace)

=end

def word_cap(sentence)
  words = sentence.split(' ')
  capitalized_words = []
  words.each do |word|
    capitalized_words << word.capitalize
  end
  capitalized_words.join(' ')
end

# how to solve this without the capitalize method?

def word_cap(sentence)
  sentence.split.map do |word|
    new_word = word.downcase
    new_word[0] = new_word[0].upcase
    new_word
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
