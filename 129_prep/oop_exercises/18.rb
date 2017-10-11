def double_consonants(string)
  string.chars.map do |char|
    if /[aeiou]|[^a-z]/i.match(char)
      char
    else
      char + char
    end
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
