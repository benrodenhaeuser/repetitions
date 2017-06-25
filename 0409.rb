# In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

=begin

  given an integer
  - retrieve the digits from right to left using the mod operator and push them to an array
  - reverse the array and map it to an array of chars
  - join the array

=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3,
  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

NUMBERS = DIGITS.invert


def integer_to_string(number)
  return '0' if number == 0

  chars = []
  while number != 0
    chars << number % 10
    number /= 10
  end

  chars.reverse.map { |char| NUMBERS[char] }.join
end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'


# ??

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
           5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(integer)
  string = ''
  while integer != 0
    string << DIGITS[integer % 10]
    integer /= 10
  end
  string.reverse
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

100.times do
  r = rand(10000000)
  puts "#{r} #{integer_to_string(r) == r.to_s}"
end
