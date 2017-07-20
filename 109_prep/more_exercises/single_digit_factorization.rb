# Given an integer `product`, find the *smallest positive integer* the product of whose digits is equal to product. If there is no such integer, return -1 instead.

# Input/Output:
# [input] integer `product`
# Constraints: 0 ≤ product ≤ 600.
# [output] a positive integer the product of whose digits is `product`

=begin

Understanding the Problem

- In what circumstances would it be impossible to give a number as required?
  - If `product` has a prime factor > 9, e.g., 17 or 34

- TODO: Think separately about 0 and 1:
  - Do we allow products with one multiplier? Or is 9 "1 * 9"
  - I am inclined to allow one-multiplier-products

- We are looking for the smallest positive integer.
  - Example: 16
  - Three strings whose digits multiplied produce 16 are:
    - 82,
    - 28,
    - 2222
  - Another example: Produce 81
    - 99
    - 339

- It looks like the strategy is to focus on large factors to keep the number of digits small.

- The large factors should go to the end of the number we make.

- Can we get a rough understanding of a way to get at the digits?

- Take 81 again.
- Our list of possible factors is [1, 2, 3, 4, 5, 6, 7, 8, 9]

- We start by trying the largest possible number: 9
- 81 % 9 is 0, so 9 is indeed a factor.
- We store 9, and work further with 81 / 9 = 9.
- Since 9 is itself in our list of factors (base case!), we add it to the stored numbers.
- So our stored numbers are 9, 9. We can join them to produce the string '99', which yields the number 99, which satisfies the requirements.

Algorithm:

digits_product(x, list)

(given a number `x`, and a list of digits `list` obtained so far.)

if x is an element of FACTORS,
  push x to list
  return list.join

else
  for each factor in FACTORS:
    if x % factor equals 0
    push factor to the list
    return digits_product( x / factor, list)

=end

FACTORS = [2, 3, 4, 5, 6, 7, 8, 9].reverse

def digits_product(number)
  if number < 10
    ('1' + number.to_s).to_i
  else
    generate(number, [])
  end
end

def generate(number, list)
  if FACTORS.include?(number)
    list.unshift(number)
    return list.join.to_i
  else
    FACTORS.each do |factor|
      if number % factor == 0
        list.unshift(factor)
        return generate(number / factor, list)
      end
    end
  end
  -1
end


p digits_product(0) == 10 # ok
p digits_product(1) == 11 # ok
p digits_product(10) == 25 # ok
p digits_product(12) == 26 # ok
p digits_product(19) == -1 # ok
p digits_product(450) == 2559 # ok
p digits_product(581) == -1 # ok
