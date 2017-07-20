# Take a look at the following code:
#
# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name
# What does this code print out? Think about it for a moment before continuing.
#
# If you said that code printed
#
# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:
#
# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# The code prints out 'BOB', 'BOB' (on separate lines). In line 3, the method `String#upcase!` is called on the string `name`. This method is destructive, i.e., it mutates the receiver (the object on which it is called). So the object referenced by `name` is now upcased. But `save_name` points to that same object (as per line 2)! So both `save_name` and `name` now point to the upcased object.
