# In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

=begin

understanding the problem:

is year x a leap year?

- if the year is divisible by 4
- execption: year is divisible by 100 => in that case, check whether also divisible by 400

how to express this nicely? perhaps this is a start:

if year divisible by 400
  yes
elsif year divisible by 100 (i.e., this is the case "not div by 400, div by 100")
  no
elsif year divisible by 4 (i.e., not div by 400, not div by 100, div by 4)
  yes
else (not div by 4)
  no
end

=end

def divisible?(number, divisor)
  number % divisor == 0
end


def leap_year?(year)
  if divisible?(year, 400)
    true
  elsif divisible?(year, 100)
    false
  elsif divisible?(year, 4)
    true
  else
    false
  end
end

# the above can be shortened a bit:
def leap_year?(year)
  if divisible?(year, 400)
    true
  elsif divisible?(year, 100)
    false
  else
    divisible?(year, 4)
  end
end

# but there is another simplification:
def leap_year?(year)
  divisible?(year, 400) || divisible?(year, 4) && !divisible?(year, 100)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
