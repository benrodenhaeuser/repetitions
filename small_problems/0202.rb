=begin

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

=end

SQM_TO_SQF = 10.7639

puts "Enter the length"
length = gets.chomp

puts "Enter the width"
width = gets.chomp

area_in_sqm = length.to_f * width.to_f
area_in_sqf = area_in_sqm * SQM_TO_SQF

puts "The area is #{format("%.2f", area_in_sqm)} square meters (#{format("%.2f", area_in_sqf)} square feet)."
