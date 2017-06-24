# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.


prompt = "==> Enter the %s number:"

current = '1st'

puts prompt % { :n => "1st" }

value = 42

puts "--> %s <--" % value
puts prompt % value # why is this not working?


budget = 10_000
prompt = "The budget is #{budget} Euros."

puts prompt

prompt = "The budget is %s Euros."
puts prompt % budget
