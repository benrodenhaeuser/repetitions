# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

=begin

approach:

- use a while loop
- the loop counter is initially at 3
- we break out of the loop once the counter has reached 0
- we decrement on each iteration of the loop
- during each iteration, we print the given string once

=end

def repeat(string, number)
  counter = number
  while counter != 0
    puts string
    counter -= 1
  end
end

repeat('Hello', 3)
