# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

def real_size(word)
  word.gsub(/[^a-z]+/i, '').size
end


def word_sizes(string)
  counts = Hash.new { |hash,key| hash[key] = 0 }
  string.split(' ').each { |word| counts[real_size(word)] += 1 }
  counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
