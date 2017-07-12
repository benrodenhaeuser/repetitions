# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

=begin

split the string along the whitespace into an array of two elements
reverse the array
join it with a comma in-between


=end


def swap_name(string)
  string.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
