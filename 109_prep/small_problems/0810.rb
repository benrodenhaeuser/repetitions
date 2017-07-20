# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

=begin

for a string of odd length, we want to return the character at
string.size / 2

example: 'ben' => 'e'

for a string of even length, we want to return the characters at
string.size / 2 - 1 and string.size / 2

example: 'anna' => 'nn'

=end

def center_of(string)
  length = string.size
  if length.odd?
    string[length / 2]
  else
    string[length / 2 - 1..length / 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
