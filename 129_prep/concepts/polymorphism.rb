# Bjarne Stroustrup: **Polymorphism is the provision of a single interface for
# entities of different types.**

# What does that mean?

# 1.) "Ad hoc polymorphism": Provide same method for two classes

class Animal
  def provide_info
    # return info about Animal instance
  end
end

class Plant
  def provide_info
    # return info about Plant instance
  end
end

# Both Animal and Plant share (part of) their interface in that they both
# respond to `provide_info`

# 2.) Polymorphism with modules

class BinaryTree
  include Enumerable

  def each
    # omitted
  end

  # implementation of BinaryTree omitted
end

class Queue
  include Enumerable

  def each
    # omitted
  end

  # implementation of Queue omitted
end

# BinaryTree and Queue share the interface provided by the Enumerable methods

Queue.new.map # evaluates to an enumerator
BinaryTree.new.map # evaluates to an enumerator

# 3.) Polymorphism with classes

class Animal
  def speak
    "Grrrr..."
  end
end

class Dog < Animal
end

class Cat < Animal
end

# Animal, Dog and Cat share the interface provided by speak method due to inheritance

# Typically, the interface is customised for the class

class Dog
  def speak
    "Bark bark bark!"
  end
end

class Cat
  def speak
    "Meow meow meow!"
  end
end

# Cat and Dog share the interface provided by speak, but they respond in different ways to the speak message (when speak method is invoked on an instance) – each class has custom implementation

# Another example: to_s

class SomeClass
end

# SomeClass inherits from Object, so it has a to_s method
# The to_s method is implicitly called when puts is invoked

puts SomeClass.new # a generic representation of the object

# An example of polymorphism! The to_s method is available to objects of different classes, i.e., to any object (since any class inherits from Object)

# But, typically, classes will provide custom implementation of to_s

class SomeClass
  def to_s
    "a custom string representation of the instance"
  end
end

puts SomeClass.new # a custom string representation of the instance is output



# "Polymorphism is the provision of a single interface for entities of different types" -- the inventor of C++

# "Ad hoc polymorphism" (not a technical term)
# Polymorphism using classes
# Polymorphism using modules

class SomeNumberLikeClass

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def +(other_number)
    value + other_number.value
  end

end

class SomeStringLikeClass

  attr_reader :content

  def initialize(content)
    @content = content
  end

  def +(other_string)
    content + other_string.content
  end
end

string1 = SomeStringLikeClass.new('a')
string2 = SomeStringLikeClass.new('b')

p string1 + string2 #ab

number1 = SomeNumberLikeClass.new(10)
number2 = SomeNumberLikeClass.new(12)

p number1 + number2 # 22

# We have "entities of different types", i.e., instances of SomeNumberLikeClass and instances of SomeStringLikeClass. They both have access to a `+` method ("provisioning of a single interface").

# Ad hoc, because we have not used any special Ruby mechanism


# Using classes


class Animal

  def weight
    # some way to obtain weight
  end

end

class Cat < Animal
end

class Cow < Animal
end

# both Cat and Cow instances have access to the weight method.
# So again we have entities of different types sharing an interface.


# Using modules

# Enumerable module
# Mixed in by hash, array
# Hashes and arrays are entities of different types
# They have access to the same interface

# Sometimes, we want the method names to be share, but want still to be able to provide a custom implementation for the interface => method overriding


class Animal

  def cuteness_factor
    4
  end

end

class Pet < Animal

  def cuteness_factor
    super * 10
  end

end

class Snake < Animal

  def cuteness_factor
    -super
  end
end

p Animal.new.cuteness_factor # 4
p Pet.new.cuteness_factor # 40
p Snake.new.cuteness_factor # -4
