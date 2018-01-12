def missing(array)
  (array.first..array.last).select do |num|
    !array.include?(num)
  end
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []


# how to do it without using (a method that uses) a block?

def missing2(array)
  missing_numbers = []
  current_number = array.first + 1
  while current_number < array.last
    missing_numbers << current_number unless array.include?(current_number)
    current_number += 1
  end
  missing_numbers
end


p missing2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing2([1, 2, 3, 4]) == []
p missing2([1, 5]) == [2, 3, 4]
p missing2([6]) == []

# we could geeneralize the two solutions above by using array.min and array.max
# instead of array.first and array.last – then, they would also work for
# unsorted arrays. these are not efficient solutions though.
