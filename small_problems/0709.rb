# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.


=begin

approach:

- first, take the (cartesian) product of the two arrays
- then multiply each pair in the cart. product to produce the result
- sort the result (ascending, smaller numbers first)

how to take the product?

- initialize pairs to []
- for each element elem1 of array1:
    for each element elem2 of array2:
      push [elem1, elem2] to pairs
- return pairs

=end

def cart_product(array1, array2)
  pairs = []
  array1.each do |elem1|
    array2.each do |elem2|
      pairs << [elem1, elem2]
    end
  end
  pairs
end

def multiply_all_pairs(array1, array2)
  cart_product(array1, array2).map do |pair|
    pair[0] * pair[1]
  end.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
