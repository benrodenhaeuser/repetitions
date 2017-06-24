# Build a program that displays when the user will retire and how many years she has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2017. You will retire in 2056.
# You have only 40 years of work to go!

YEAR = 2017

def remaining_work_years(age, retirement_age)
  retirement_age - age
end

def retirement_year(remaining_work_years)
  YEAR + remaining_work_years
end

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

remaining_work_years = remaining_work_years(age, retirement_age)
retirement_year = retirement_year(remaining_work_years)

puts "It's #{YEAR}. You will retire in #{retirement_year}."
puts "You have only #{remaining_work_years} years of work to go."
