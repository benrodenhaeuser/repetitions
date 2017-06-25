# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

=begin

approach:

- given a string
- collapse all consecutive duplicate characters in the string into a single char
- return the string

examples:
- 'ddaii' => 'dai'
- '4444ab' => '4ab' (chars may occur many times in a row)
- '' => '' (nothing to collapse)
- 'ben' => 'ben' (nothing to collapse)

approach:

- initialize new string to first char of given string
- iterate over range (1...string.size):
    push string[index] to new string if string[index] is not equal to string[index - 1]
- return new string

but need a guard clause to make it work.

=end

def crunch(string)
  return '' if string == ''

  crunched = string[0]
  (1...string.size).each do |index|
    crunched << string[index] if string[index] != string[index - 1]
  end

  crunched
end

# how could we avoid the guard clause? push last char instead of first char

def crunch(string)
  crunched = ''
  (0...string.size).each do |index|
    crunched << string[index] unless string[index] == string[index + 1]
  end

  crunched
end

# could we use map? yes! actually, calling join on an array takes care of `nil` values:

def crunch(string)
  (0...string.size).map do |index|
    string[index] unless string[index] == string[index + 1]
  end.join
end

# ... calling `compact` would also be possible, but it's not necessary here.

# how about select?

def crunch(str)
  arr = str.chars
  arr.select.with_index {|v, idx| v unless v == arr[idx+1] }.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('')  == ''
