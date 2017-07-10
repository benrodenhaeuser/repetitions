# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

=begin
  - split the string into chars
  - map array `chars` to new array:
    - if char is lowercase, make uppercase
    - if char is uppercase, make lowercase
  - return mapped array joined to string

- take advantage of the fact that char.upcase returns char if char is not in
  the alphabet

=end

def swapcase(string)
  string.chars.map do |char|
    char.match(/[A-Z]/) ? char.downcase : char.upcase
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
