# convert a string to an integer without using built-ins.

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

# improve the previous solution to take into account possible signs
SIGNS = {
  '-' => -1,
  '+' => 1
}

def string_to_signed_integer(string, base = DECIMAL)
  sign = 1

  if string.start_with?('+','-')
    sign = SIGNS[string[0]]
    string = string[1..-1]
  end

  sign * string_to_integer(string, base)
end


# tests

string_to_integer('4321', 10) == 4321 # true
string_to_integer('570', 10) == 570 # true
string_to_integer('570') == 570 # true
string_to_integer('4D9f', 16) == 19871 # true

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100
