# When a method is invoked on an object, where does Ruby find the corresponding
# method definition?

# EXAMPLE:

# lots of code omitted

# and then:

class SiamCat < DomesticCat
  include CatTools
  # code omitted
end

SiamCat.new('kitty').speak

# where does Ruby look for speak?

# First, it looks in the class to which the instance belongs (here, that's SiamCat, and the method is not there in our example!)
# Next, it looks in any included module in reverse order (in this example, there is only one module, so Ruby will look in CatTools)
# Then, Ruby will look in the superclass (DomesticCat)
# Starting from the superclass, the same steps will be repeated (first, look in superclass, then in modules, then in superclass of superclass ... and so on)

# The sequence of classes and modules according to which the lookup proceeds
# is called the method lookup chain.

# The method lookup chain is a concept on the class-level. The method lookup path is the same for all instances of a class.

# The last segment of the method lookup chain always looks the same:
# Object – Kernel – BasicObject

# This is because every Ruby class ultimately is a descendant of Object, which # - includes the Kernel module,
# - inherits from BasicObject

# So assuming that DomesticCat inherits from Cat inherits from Object, we
# would have:

# SiamCat CatTools DomesticCat Cat Object Kernel BasicObject

# as the method lookup chain for our cat instance

# The method lookup chain for a class can also be obtained programmatically by means of:

SiamCat.ancestors
