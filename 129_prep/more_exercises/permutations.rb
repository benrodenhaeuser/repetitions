# generate all permutations of a given string (without repetitions)

def permutations(string)
  stock = Hash.new { |hash, key| hash[key] = 0 }
  string.chars.each { |char| stock[char] += 1 }
  permutations = []
  generate(stock, [], permutations)
  permutations
end

def generate(stock, choice, permutations)
  if stock.keys.all? { |char| stock[char] == 0 }
    permutations << choice.join
  else
    stock.keys.select { |char| stock[char] > 0 }.each do |char|
      choice.push(char)
      stock[char] -= 1
      generate(stock, choice, permutations)
      stock[char] += 1
      choice.pop
    end
  end
end

p permutations('ab')
p permutations('abc')
p permutations('abcd')
p permutations('aaaaaaaaaaa')
# p permutations('abcdefghijk')
