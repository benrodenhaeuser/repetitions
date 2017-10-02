def multiply_all_pairs(arr1, arr2)
  pairs = []
  arr1.each do |elem1|
    arr2.each do |elem2|
      pairs << elem1 * elem2
    end
  end
  pairs.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
