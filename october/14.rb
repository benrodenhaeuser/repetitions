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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
