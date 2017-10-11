def swapcase(string)
  swapped = []
  string.chars.each_with_index do |char, index|
    swapped[index] =
      if /[a-z]/.match(char)
        char.upcase
      elsif /[A-Z]/.match(char)
        char.downcase
      else
        char
      end
  end
  swapped.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# could have also done this with the help of `map`
