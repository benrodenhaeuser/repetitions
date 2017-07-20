# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

=begin

- given a number
  - if that number is a "double number"
      return the number
  - else
      return the number times 2


- definition of "double number":
  - has even number of digits, say n digits
  - the left half of the number and its right half are the same

- auxiliary method:
  - double_number?
    (returns true if number is "double number", false otherwise)


=end

def double_number?(number)
  digits_array = number.to_s.chars
  length = digits_array.size
  left_half = digits_array[0, length/2]
  right_half = digits_array[length/2, length/2]

  length.even? && left_half == right_half
end

def twice(number)
  if double_number?(number)
    number
  else
    number * 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
