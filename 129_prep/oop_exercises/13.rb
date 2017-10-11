def substrings_at_start(string)
  substrings = []
  0.upto(string.length - 1) do |length|
    substrings << string[0..length]
  end
  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
