# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

=begin

- given a string
- initialize `result` to true
- iterate over the chars of the string
  - if we see an alphabetic character that is not uppercase, set `result` to
    false
- return `result`

=end


def uppercase?(string)
  result = true
  string.chars.each do |char|
    result = false if char.match(/[a-zA-Z]/) && char.upcase != char
  end
  result
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
