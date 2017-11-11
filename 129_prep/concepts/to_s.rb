# to_s

# the to_s method is called automatically when puts is invoked
# it's also called automatically in string interpolation
# every class has a to_s method – inherited from Object (actually Kernel)
# can be overridden.
# The overriding will only have an effect if the return value of the overriding method is a string.
# If the return value is not a string, default to_s will be used.


class Animal

  def to_s
    7 # this will not be printed!
  end

end

puts Animal.new



# self use cases:

# for defining class methods (must use)
# for invoking setters inside of an instance (must use: even private setters!)
# for return value

# can use at liberty for prefixing other method calls from inside an instance
# but usually considered good practice.

# self non-use cases:

# for private methods (except setters!)
