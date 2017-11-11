# '<': INHERITING BEHAVIOUR

# The following is an example of an inheritance relationship between two classes:

class Animal
  def initialize
    puts "initialize instance method defined in Animal was called"
  end

  def speak
    puts "speak instance method defined in Animal class was called"
  end
end

class Cat < Animal
end

# In the above example, the Cat class inherits from the Animal class.
# This means that the Cat class inherits all the behaviour defined by the
# Animal class (as encoded in the instance methods of the Animal class).
# Syntactically, inheritance is encoded with the "<" sign (line 13).
# Inheriting behaviour means: all the methods defined in the Animal class become
# available to be invoked on instances of the Cat class.

# here is how that works in practice:

cat = Cat.new # => output: "initialize method ... in Animal class ... called"
cat.speak # => output: "speak method ... in Animal class ... called"

# aside: the initialize method is invoked whenever an Animal instance is created using the `new` class method of the Animal class. `Animal#initialize` is part of the behaviour of the Animal class. So it is inherited. So it is called when a Cat instance is created, since Cat < Animal.

# OVERRIDING INHERITED BEHAVIOUR

class Animal
  def initialize
    puts "initialize instance method defined in Animal was called"
  end

  def speak
    puts "speak instance method defined in Animal class was called"
  end
end

class Cat < Animal
  def speak
    puts "speak method in Cat class was called"
  end
end

cat = Cat.new # => output: "initialize ... in Animal class ... called"
cat.speak # => output: "speak ... in Cat class ... called"

# aside: this makes use of the method lookup chain: when a method is invoked on an object, Ruby will first look for the method in the class of which the object is an instance. So `Cat#speak` is used in this example.

# 'super': USING INHERITED BEHAVIOUR WHILE OVERRIDING IT

class Animal
  def initialize
    puts "initialize instance method defined in Animal was called"
  end

  def speak
    puts "speak instance method defined in Animal class was called"
  end
end

class Cat < Animal
  def speak
    super
    puts "speak method in Cat class was called"
  end
end

cat = Cat.new # => output: "initialize ... in Animal class ... called"
cat.speak
# => output:
# "speak ... in Animal class ... called"
# "speak ... in Cat class ... called"

# super calls the first method matching the name of the method we are currently in up the method lookup chain of the class.so in this example, the speak method from the Animal class is used.

# super evaluates to the return value of the method called:

class Animal
  def initialize
    puts "initialize instance method defined in Animal was called"
  end

  def speak
    puts "speak instance method defined in Animal class was called"
    "return value from Animal#speak!"
  end
end

class Cat < Animal
  def speak
    puts super
    puts "speak method in Cat class was called"
  end
end

cat = Cat.new # => output: "initialize ... in Animal class ... called"
cat.speak
# output: "return value from Animal#speak!"
# output: "speak method in Cat class was called"

# in this case above, we have decided to make use of the return value by printing it to the screen. It's more common, however, to invoke super for its side effects.

# let's now demonstrate that super really uses the method lookup chain:

class Animal
  def initialize
    puts "initialize instance method defined in Animal was called"
  end

  def speak
    puts "speak instance method defined in Animal class was called"
  end
end

module ExampleModule
  def speak
    puts "speak instance method defined in ExampleModule was called"
  end
end

class Cat < Animal
  include ExampleModule

  def speak
    puts super
  end
end

cat = Cat.new
cat.speak
# output: "speak instance method defined in ExampleModule was called"

# both Animal and ExampleModule define a speak method. But ExampleModule is earlier in the method lookup chain for the Cat class.

# super WITH initialize

# a common use case for super is with initialize. Illustration:

class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  attr_reader :name, :color

  def initialize(name, color)
    super(name)
    @color = color
  end
end

cat = Cat.new('pepa', 'black')
p cat.name # 'pepa'
p cat.color # 'black'

# super with no arguments: forwards *all* arguments given (maybe none!)
# super with explicitly listed arguments: forwards exactly those arguments (maybe none!)

# super # invoke with arguments passed in to current method (maybe none)
# super() # invoke with no arguments
# super(name) # invoke with single argument name (what we did above)
