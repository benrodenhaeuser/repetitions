# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument.

=begin

examples (see tests below):

- the index of the first fibo number that has two digits is 7 (i.e., the 7th fibo number).
- the index of the first fibo number that has 10 digits is 45 (i.e., the 45th fibo number).

approach:

- iteratively build an array of fibonacci numbers
- return the size of the array if the last element of the array has the number of digits specified.
- helper method that returns the number of digits of a given number.

example:

given num of digits 1:
  [1] => last element has one digit => length of array is 1 => return 1 => CORRECT

given num of digits 2:
  [1, 1, 2, 3, 5, 8, 13] => last element has two digits => length of array is 7 => return 7 => CORRECT

=end

def number_of_digits(number)
  number.to_s.length
end

def find_fibonacci_index_by_length(number_of_digits)

  fibos = [1, 1]

  while number_of_digits(fibos.last) < number_of_digits
    fibos << fibos[-1] + fibos[-2]
  end

  fibos.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
