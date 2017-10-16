# Question 1

# These are all objects. We can call the `#class` method on them.


# Question 2

# To make the go_fast method availabel to Car and Truck, include the Speed module in both classes. Test it by instantiating objects of the respective classes.

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def self.acknowledge
    puts "acknowledged!"
  end

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Truck.new.class.acknowledge # class returns the class object.
Car.new.go_fast




# Question 3

# The code on line 3 contains an example of String interpolation, recognizable by the `#` symbol followed by a pair of braces. The code between the braces is interpolated into the string. In this case, `self.class` is interpolated. In the context of an instance method, `self` evaluates to the object on which the instance method is called. The `class` method which is available on all objects (it is defined in the `Kernel` module, which is included in `Object`) returns the class of the object on which it is called. For a `Truck` instance `truck`, `truck.class` returns the class object `Truck`. String interpolation implicitly converts this object to a String, `"Truck"`, that is then interpolated into the string.


# Question 4

# Call the `new` method on the class.

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

AngryCat.new
a_cat = AngryCat.new


# Question 5

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The Pizza class has an instance variable @name. The Fruit class does not have an instance variable. Can verify by calling instance_variables on an instance of the class.

p Fruit.new('bla').instance_variables #=> []
p Pizza.new('bla').instance_variables #=> [:@name]


# Question 6

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end


big_cube.instance_variable_get("@volume")


# Question 7

# This depends on the class of the object. If the class does not define a custom `to_s` method, the `Kernel#to_s` method is used, which prints the object's class and an encoding of the object id. But many classes define custom `to_s` methods. If the class of our object is among the classes built into Ruby, we can look up the implementation of `to_s` in the docs. If it is a custom class, we would have to look in the code.

# Question 8

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# `self` references the calling object, i.e., the instance of the `Cat` class on which `make_one_year_older` is invoked.

# Question 9

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# `self` within `self.cats_count` references the `Cat` class. This is an example of a class method. Within a class method, `self` always evaluates to the class.

# Question 10

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bag.new('green', 'nylon')

# that is, we need to call `new` on the `Bag` class, passing exactly two arguments. 
