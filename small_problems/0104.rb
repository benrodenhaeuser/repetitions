=begin

Write a method that counts the number of occurrences of each element in a given array. Once counted, print each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

approach:

- we initialize an empty hash that will store our "counts".
- the required default value for given hash keys should be 0.
- we iterate over the array.
  - for each element elem of the array:
      increment hash[elem] by 1.
- finally, we return the hash we built

- now, we still have to print out the occurences.
- to do that, iterate over the hash with |key, value|,
  and print the key with its value in the required format.


=end

def count_occurrences(array)
  counts = Hash.new { |hash, key| hash[key] = 0 }
  array.each { |elem| counts[elem] += 1}
  counts
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

counts = count_occurrences(vehicles)

counts.each { |key, value| puts "#{key} => #{value}" }
