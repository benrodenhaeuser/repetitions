# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

=begin

example:

"oh what a wonderful day it is"

=> swap the first letter and the last letter of each word

"ho what a londerfuw yad ti si"

"smallest" case:
"a" => "a"

----

approach:
  - given a string 'string'
  - split the string into an array along whitespace (e.g.., 'what the' => ['what', 'the'])
  - swap first and last char of each element of the array
  - join the array (with ' ' between words)

how to swap first and last char in a string?

swapped string: string[-1] + string[1..-2] + string[0]

=> but this duplicates the string in the case where it is only one char long!

better to do it in place.

string[0], string[-1] = string[-1], string[0]

=end

def swap_first_last(string)
  string[0], string[-1] = string[-1], string[0]
  nil
end

def swap(string)
  words = string.split(' ')
  words.each { |word| swap_first_last(word) }.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
