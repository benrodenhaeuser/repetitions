def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
