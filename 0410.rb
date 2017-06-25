# convert (possibly negative) integer to string

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3,
  '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

NUMBERS = DIGITS.invert


def signed_integer_to_string(number)
  return '0' if number == 0

  number > 0 ? sign = '+' : sign = '-'

  number = number.abs

  chars = []
  while number != 0
    chars << number % 10
    number /= 10
  end

  sign + chars.reverse.map { |char| NUMBERS[char] }.join
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
