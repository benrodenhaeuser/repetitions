GREGORIAN = 1752

def divisible?(number, divisor)
  number % divisor == 0
end

def leap_year?(year)
  if year < GREGORIAN
    divisible?(year, 4)
  else
    divisible?(year, 400) || divisible?(year, 4) && !divisible?(year, 100)
  end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
