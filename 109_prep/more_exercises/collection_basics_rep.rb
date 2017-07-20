# Select the odd-indexed numbers from an array and store them in a new array.
array = [0, 1, 2, 3, 5, 6, 7, 10, 11]
new_array = []
index = 0
loop do
  break if index == array.size
  current = array[index]
  new_array << current if current.odd?
  index += 1
end
new_array == [1, 3, 5, 7, 11] #=> true

# Select all the ’g’s from a given string and store them in a new string
string = 'gigantic google'
new_string = ''
index = 0
loop do
  break if index == string.size
  current = string[index]
  new_string << current if current == 'g'
  index += 1
end
new_string == 'gggg' #=> true

# Increment all the numbers that are stored in a given array by one, returning a new array with the incremented numbers.
array = [0, 1, 2, 3, 4, 5]
new_array = []
index = 0
while index < array.size
  new_array << array[index] + 1
  index += 1
end
new_array == [1, 2, 3, 4, 5, 6] #=> true

# Append an s to all strings in a given array of strings. Do it in place.
array = ['a', 'b', 'c']
index = 0
while index < array.size
  array[index] << 's'
  index += 1
end
array == ['as', 'bs', 'cs'] #=> true

# Select the key value pairs from the given hash where the value is 'fruit'
hash = { 'orange' => 'fruit', 'carot' => 'vegetable', 'apple' => 'fruit' }
selected = {}
keys = hash.keys
index = 0
while index < keys.size
  current_key = keys[index]
  current_value = hash[current_key]
  selected[current_key] = current_value if current_value == 'fruit'
  index += 1
end
selected == { 'orange' => 'fruit', 'apple' => 'fruit' } #=> true

# Given a hash whose values are numbers, increment all the numbers by one. do it in place.
hash = { cats: 1, dogs: 5, elephants: 10 }
incr_hash = {}
keys = hash.keys
index = 0
loop do
  break if index == hash.size
  current_key = keys[index]
  hash[current_key] += 1
  index += 1
end
hash == { cats: 2, dogs: 6, elephants: 11 } #=> true


# Select the odd numbers from an array and double them to a new array
array = [0, 1, 2, 3, 5, 6, 7, 10, 11]
new_array = []
index = 0
while index < array.size
  new_array << array[index] * 2 if array[index].odd?
  index += 1
end
new_array == [2, 6, 10, 14, 22] #=> true
