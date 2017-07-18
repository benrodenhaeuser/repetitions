# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

=begin

approach:

- use the times method to print out the string as many times as required

=end

def print_times(string, number)
  number.times { puts string }
end

print_times('ben', 4)
