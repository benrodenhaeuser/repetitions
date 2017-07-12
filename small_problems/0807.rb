# Write a method that takes a string, and returns a new string in which every character is doubled.

# approach: map array of chars obtained from string to new array, doubling each char

def repeater(string)
  string.chars.map do |char|
    char + char
  end.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
