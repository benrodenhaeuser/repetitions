# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

=begin

  approach:

  - initialize `counts` to an empty hash, taking default values of 0
  - traverse the string, split into array of chars
  - for each character:
      if the character is lowercase (i.e., /[a-z]/):
        increment counts[:lowercase]
      elsif the character is uppercase (i.e., /[A-Z]/):
        increment counts[:uppercase]
      else
        increment counts[:neither]

=end

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  chars = string.chars

  chars.each do |char|
    if char.match(/[a-z]/)
      counts[:lowercase] += 1
    elsif char.match(/[A-Z]/)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
