# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.
#
# Examples:
#
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def sum(n)
  (1..n).inject(&:+)
end

def product(n)
  (1..n).inject { |memo, current| memo * current }
end

puts "Please enter an integer greater than 0:"
number = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

case operation
when 's'
  puts "Sum of the positive integers up to #{number}: #{sum(number)}."
when 'p'
  puts "Product of the positive integers up to #{number}: #{product(number)}."
end
