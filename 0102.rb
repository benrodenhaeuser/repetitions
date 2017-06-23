# Write a method that takes one integer argument, which may be positive, negative, or zero. This method return true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

=begin

approach:

- the odd numbers are the number n such that n % 2 == 1
- we return true if the given number is odd, false otherwise
- in other words, we return the value of n % 2 == 1, where n is the argument received

=end

def is_odd?(number)
  number % 2 == 1
end

p is_odd?(2) == false
p is_odd?(5) == true
p is_odd?(-17) == true
p is_odd?(-8) == false
p is_odd?(0) == false
