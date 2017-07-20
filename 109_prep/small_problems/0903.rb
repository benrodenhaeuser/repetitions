# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

=begin

- given a number (could be int or float)
- if number > 0
    return -number
- else
    return number

=end

def negative(number)
  if number > 0
    -number
  else
    number
  end
end 


p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
