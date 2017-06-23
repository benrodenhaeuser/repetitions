# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

=begin

approach:

- it seems it would be nice to do this without a "string detour".
- we have seen how to get the digits in an earlier exercise.
- once we have an array of digits, we can just sum it up with inject

=end

def digits_array(number)
  digits = []
  while number != 0
    digits << number % 10
    number = number / 10
  end
  digits
end

def sum(number)
  digits_array(number).reduce(&:+)
end

# without any kind of basic loops?

def sum(number)
  number.digits.reduce(&:+)
end

# going via string

def sum(number)
  number.to_s.chars.map(&:to_i).inject(&:+)
end

# map to string ... get the chars ... convert them to ints ... fold to sum

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
