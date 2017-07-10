# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

=begin

idea:

- solution for previous exercise won't work anymore (index does not mean
  anything).
- how to do it instead? track explicitly what we need to do, i.e.,
  introduce a variable 'upcase_next_char' which should be true if next
  character encountered should be upcased, and which is toggled in
  appropriate places.

algo:

- given string
- split string into chars
- set upcase_next to true

- map chars to new_array:

  if upcase_next is true
    if char is alphabetic
      set upcase_next to false
      map to char.upcase
    else
      map to char

  if upcase_next is false
    set upcase_next to true if char is alphabetic
    map to char




=end


def staggered_case(string)
  chars = string.chars
  upcase_next = true

  chars.map do |char|
    if upcase_next
      if char.match(/[a-zA-Z]/)
        upcase_next = false
        char.upcase
      else
        char
      end
    else
      upcase_next = true if char.match(/[a-zA-Z]/)
      char.downcase
    end
  end.join

end

p staggered_case('I Love Launch School!')  == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
