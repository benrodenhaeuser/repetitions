# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above (without using something like `String#to_i`!).
#
# Do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.


=begin

Understanding the problem:

We will have to make use of two kinds of information:

- correspondence between "digit chars" like "1" and single-digit numbers like 1
- the position of a number in a string indicates its value

123 = 1 * 10^2 + 2 * 10^1 + 3 * 10^0

we can start exploring the string from the right, retrieving one digit at a time.

let's work this out for the number 123

initialize exponent to 0.
pop current last digit: 3.
number = 3 * 10^exponent.

increment exponent by 1.
pop current last digit: 2.
number += 2 * 10^exponent

increment exponent by 1.
pop current last digit: 1
number += 1 * 10^exponent

=> loop counter representing exponent
=> break condition? "the length of the string is 0"

algorithm:

given string
initialize exponent to 0
initialize number to 0
while string != empty string
  last_digit = string[-1]
  add table[last_digit] * 10^exponent to number
  increment exponent by 1
  set string to "string without last char"
end

==> table converts characters to single-digit integers

=end

# For arbitrary bases up to 16 (hexadecimal). The base is passed in as an additional argument. The default is base 10.

DECIMAL = 10

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3,
  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def string_to_integer(string, base = DECIMAL)
  number = 0

  exponent = 0
  while string != ''
    last_char = string[-1]
    number += DIGITS[last_char.downcase] * (base ** exponent)
    exponent += 1
    string = string[0...-1]
  end

  number
end

string_to_integer('4321', 10) == 4321 # true
string_to_integer('570', 10) == 570 # true
string_to_integer('570') == 570 # true
string_to_integer('4D9f', 16) == 19871 # true
