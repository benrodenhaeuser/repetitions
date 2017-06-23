# convert a decimal number to representation in base up to 10

=begin

let's start with base 2.

approach:

- intution: the last digit should be given by the remainder when dividing by 2.
  => if the number is even, the last digit will be 0
  => if the number is off, the last digit will be 1
- do this in a loop: push the next bit (given by mod 2) to array, divide the
  number by 2

=end

def bits(number)
  bits = []

  while number != 0
    bits << number % 2
    number = number / 2
  end

  bits.reverse.join
end

p bits(10) == 10.to_s(2)
p bits(1632235) == 1632235.to_s(2)

# this is the very same algorithm that can also be used to compute the digits of a number:

def digits(number)
  digits = []

  while number != 0
    digits << number % 10
    number = number / 10
  end

  digits.reverse.join
end

p digits(10) == 10.to_s

# in fact, we could apply this to arbitrary bases.
