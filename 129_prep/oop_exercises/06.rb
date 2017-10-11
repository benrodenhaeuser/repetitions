def staggered_case(string)
  up = true
  staggered = ''
  string.chars.each do |char|
    if /[a-zA-Z]/.match(char)
      up ? staggered << char.upcase : staggered << char.downcase
      up = !up
    else
      staggered << char
    end
  end
  staggered
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
