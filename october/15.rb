def substrings_at_start(string)
  substrings = []
  0.upto(string.length - 1) do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |index|
    substrings += substrings_at_start(string[index..-1])
  end
  substrings
end

def palindromic?(string)
  string.size > 1 && string == string.reverse
end

def palindromes(string)
  substrings(string).select { |substring| palindromic?(substring) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
