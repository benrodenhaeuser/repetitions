# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# reassign arrays?
# each

# for each element of array1: add it to interleaved array, and add elemnt of second array with same index to interleaved

def interleave(array1, array2)
  interleaved = []
  array1.each_with_index do |elem, index|
    interleaved << elem
    interleaved << array2[index]
  end
  interleaved
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# can also be done with the help of zip

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
