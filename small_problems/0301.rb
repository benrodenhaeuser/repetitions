# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

# Example:
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


COUNTS = ['1st', '2nd', '3rd', '4th', '5th', 'last']
PROMPT = "==> Enter the %s number:"
numbers = []

6.times do |number|
  puts PROMPT % COUNTS[number]
  numbers[number] = gets.chomp.to_i
end

search_key = numbers.pop

if numbers.include?(search_key)
  puts "The final number is among the first five numbers."
else
  puts "The final number is not among the first five numbers."
end 

# try to find the search_key in array numbers
