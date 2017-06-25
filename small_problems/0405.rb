# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).
#
# You may assume that the number passed in is an integer greater than 1.
#
# Examples
#
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

=begin
  understanding the problem:
    given: a positive integer x

    return: all multiples of 3 and 5 from 1 to x

    what does it mean that y is a multiple of z?
      ==> y % z == 0
    (it is another way of saying that y is divisible by z)

    - we are dealing with a range of numbers ("from 1 to x")
    - have to select multiples of 3 and 5 from that range
    - have to sum up the selection

  algorithm:
    - given number x
    - select from range (1..x): the multiples of 3 and the multiples of 5
    - take the sum of the selection

  datastructures:
    - if we select from a range in Ruby, we get back an array
    - so have to sum over array => use inject

=end

def multiple?(number, divisor)
  number % divisor == 0
end

def multiple_of_3_or_5?(number)
  multiple?(number, 3) || multiple?(number, 5)
end

def multisum(number)
  multiples = (1..number).select { |x| multiple_of_3_or_5?(x) }
  multiples.inject(&:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
