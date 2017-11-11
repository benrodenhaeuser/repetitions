# super

# class Animal
#   def initialize(weight)
#     @weigh = weight
#   end
#
#   def cuteness
#     3
#   end
# end
#
# class Pet < Animal
#
#   # using super for its side effects:
#   def initialize(weight, name)
#     super(weight)
#     @name = name
#   end
#
#   # using super for its return value:
#   def cuteness
#     super * 10
#   end
# end


# public private protected

# public methods are the interface of the class (methods that are called on instances of the class from outside the class)

# class Animal
#
#   def initialize(weight)
#     @weight = weight
#   end
#
#   def weight
#     @weight
#   end
# end


# Animal.new(1).weight # using the interface of the Animal class: invoking an method on an Animal instance from outside the class

# private methods are implementation details of the class, and are not supposed to be accessible from outside the class

# class Animal
#   def initialize(weight)
#     @weight = weight
#   end
#
#   def health_record
#     # code omitted
#     puts "The animal weighs #{weight} kilograms."
#   end
#
#   private
#
#   def weight
#     @weight
#   end
# end
#
# Animal.new(10).health_record # => output: The animal weighs ...
# Animal.new(12).weight # => NoMethodError – "private method called"



# Method Lookup

# class - included module(s) - superclass - included module(s) ...
# Object - Kernel - BasicObject STOP

# the lookup stops once a method with the correct identifier is found.
# or else it terminates after the BasicObject class has been inspected and the method has not been found there.

class Animal
  def speak
    "speak defined in Animal speaking!"
  end
end

module Speakable
  def speak
    "speak defined in Speakable speaking!"
  end
end

module WeNeedToTalk
  def speak
    "speak defined in WeNeedToTalk speaking"
  end
end

class Pet < Animal
  include Speakable
  include WeNeedToTalk

end

p Pet.new.speak # ? What's going to happen

# "Modules are inspected ahead of rthe super class"
# "Modules included last are inspected first"
# => the method defined in WeNeedToTalk will be invoked
