# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

=begin

approach:

- produce an array with the summands, and sum up that array
- produce the individual summands in a while loop


=end

def sum(array)
  array.inject(&:+)
end

def sum_of_sums(array)
  summands = []
  counter = 0
  while counter < array.size
    summands << sum(array[0..counter])
    counter += 1
  end
  sum(summands)
end


# alternative: create slices of length 1 up to length of the array
# sum up slices and add each of them to the total


def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
