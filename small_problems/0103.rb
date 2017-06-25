# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

=begin

approach:

- one way would be to convert the number to a string, split the string, and convert the characters to integers.
- however, here it seems more natural to treat the problem as a "number problem".
- to obtain the last digit of an integer n, we can use n % 10.
- we can then work further by dividing the number by 10, and retrieving the last digit of the number, and so on.
- we terminate once n is 0 (which means that we have already processed the last digit).

=end

def digit_list(number)
  list = []
  while number != 0
    list << number % 10
    number = number / 10
  end
  list.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
