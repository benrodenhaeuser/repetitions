# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# approach:
# if the number is divisible by 15, print FB
# elsif it is divisible by 5, print B
# elsif it is divisible by 3, print F
# else print the number


def fizzbuzz(start, ending)
  outputs = (start..ending).map do |number|
    if number % 15 == 0
      "Fizzbuzz"
    elsif number % 5 == 0
      "Buzz"
    elsif number % 3 == 0
      "Fizz"
    else
      number.to_s
    end
  end
  puts outputs.join(', ')
end


fizzbuzz(1, 15)
