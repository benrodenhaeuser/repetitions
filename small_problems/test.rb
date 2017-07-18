# p array1.select { |elem| !array2.include?(elem) }.first.to_i

def find_missing(array1, array2)
  sorted = array2.sort
  array1.each_with_index do |elem, index|
    return elem if sorted[index] != elem
  end
  return 0
end

array1 = [1, 2, 3, 4, 5, 6]
array2 = [1, 4, 2, 3, 6]

p find_missing(array1, array2)
