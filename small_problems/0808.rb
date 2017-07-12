# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

def repeater(string)
  string.chars.map do |char|
    char + char
  end.join
end
