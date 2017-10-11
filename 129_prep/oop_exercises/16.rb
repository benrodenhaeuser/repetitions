# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(starting_num, ending_num)
  sequence = []
  starting_num.upto(ending_num) do |num|
    sequence << fizzbuzz_val(num)
  end

  puts sequence.join(', ')
end

def fizzbuzz_val(num)
  if num % 15 == 0
    'FizzBuzz'
  elsif num % 5 == 0
    'Buzz'
  elsif num % 3 == 0
    'Fizz'
  else
    num.to_s
  end
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
