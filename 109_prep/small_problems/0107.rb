# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

=begin

approach:

- we definitely need some sort of "toggle" that toggles between 0 and 1, i.e., if we pass in 1 we get back 0, and if we pass in 0 we get back 1.

=end

def switch(char)
  char == '1' ? '0' : '1'
end

def stringy(number)
  counter = number
  toggle = '1'
  string = ''
  while counter > 0
    string << toggle
    toggle = switch(toggle)
    counter -= 1
  end
  string
end

# another solution: do it with times

def stringy(number)
  string = ''
  number.times do |index|
    string << (index.even? ? '1' : '0')
  end
  string
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
