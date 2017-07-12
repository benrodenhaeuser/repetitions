# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

=begin

simplest solution: do it with a loop

- initialize `length` to 0
- initialize `substrings` to []
- in a while loop, produce substrings of increasing length, starting at index 0
- the variable length is our loop counter, controling the length of the substring

=end

def substrings_at_start(string)
  length = 0
  substrings = []
  while length < string.size
    substrings << string[0..length]
    length += 1
  end
  substrings
end

=begin

let's see if we can come up with a more idiomatic solution

- one idea would be to iterate over a range instead of using a while loop
- another improvement would be to use map

=end

def substrings_at_start(string)
  (0...string.size).map do |length|
    string[0..length]
  end
end


p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
