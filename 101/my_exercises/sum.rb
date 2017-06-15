# sum up the elements of an array

# [0, 1, 2, 3, 10]

# algorithm:
# - initialize sum to 0
# - while the array is not empty:
# - sum is sum + last element of array
# - drop last element from array (reassignment)

# iterative solution

def sum(array)
sum = 0
  while !array.empty?
    sum += array.last
    array = array[0...-1]
  end
sum
end

array = [0, 1, 2, 3, 10]
p sum(array)

# recursive solution

def sum(array)
  if array.empty?
    0
  else
    array.last + sum(array[0...-1])
  end
end

array = [0, 1, 2, 3, 10]
p sum(array)
