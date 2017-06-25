# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example output: Teddy is 69 years old!

=begin

approach:
- generate an array of numbers between 20 and 200
- sample from the array

=end

# using Array#sample

age = (20..200).to_a.sample
puts "Teddy is #{age} years old"

# another way is to use Kernel#rand, which may be passed a range

age = rand(20..200)
puts "Teddy is #{age} years old"
