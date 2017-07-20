# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

=begin

Understanding the problem
- every character has an ascii value
- we would like to sum up the ascii values of a given string
- if the string has length 0, the result should be 0

Algorithm:

- create array of chars in the string (use String#chars)
- map chars to their ascii values (use Enumerable#map and String#ord)
- add all the ascii values to sum (use Enumerable#inject), starting with 0

=end

def ascii_value(string)
  string.chars.map { |char| char.ord }.inject(0, &:+)
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
