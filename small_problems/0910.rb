# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

=begin

- initialize empty array flat_list
- iterate over the given pair_array
- append fruit name (first element of given pair) to flat_list as many times
  as prescribed by the second element of the given pair

=end

def buy_fruit(pair_array)
  flat_list = []
  pair_array.each do |pair|
    pair.last.times { flat_list << pair.first }
  end
  flat_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
