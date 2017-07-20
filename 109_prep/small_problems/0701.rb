# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

def interleave(array1, array2)
  interleaved = []
  counter = 0

  while array1 != [] || array2 != []
    if counter.even?
      interleaved << array1[0]
      array1 = array1[1..-1]
    else
      interleaved << array2[0]
      array2 = array2[1..-1]
    end
    counter += 1
  end

  interleaved
end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

def interleave(array1, array2)
  interleaved = []
  array1.each_with_index do |elem, index|
    interleaved << elem << array2[index]
  end
  interleaved
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
