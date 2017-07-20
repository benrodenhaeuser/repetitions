# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo

# array1 and array2 point to distinct array objects. However, the objects contained in the distinct arrays are shared, for example, array1[0] and array2[0] point to the same string object, more generally, array1[i] and array2[i] point to the same string object for 0 <= i < array1.size.

# this means that upcasing a string object in array1 amounts to the very same thing as upcasing the object at the same index in array2. 
