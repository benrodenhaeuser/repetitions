

def anagrams(word, words)
  key = word.chars.sort.join
  words.select { |word| word.chars.sort.join == key }
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada'])
# => ['aabb', 'bbaa']

p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer'])
# => ['carer', 'racer']

p anagrams('laser', ['lazing', 'lazy',  'lacer'])
# => []
