# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

puts "Enter a string"
string = gets.chomp.gsub(/\s/, '')

# another option would be to call `delete` on the string:
# string = gets.chomp.delete(' ')

puts "That's #{string.length} characters!"
