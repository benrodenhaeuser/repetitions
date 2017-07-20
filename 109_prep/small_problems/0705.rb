# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

=begin

idea:
- we can use the index of a character to decide whether it should be uppercase
  or lowercase: if index is even => upcase it, else: downcase it

algorithm:
  split string into array of chars
  map array of chars to new array:
    - index of char even: upcased
    - index of char odd: downcase
  join mapped array and return it

implementation details:

- take advantage of the fact that for non-alphabetic characters char:
  char.downcase == char and char.upcase == char
- can use the Enumerator#with_index method here together with map

=end

def staggered_case(string)
  chars = string.chars
  chars.map.with_index do |char, index|
    index.even? ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
