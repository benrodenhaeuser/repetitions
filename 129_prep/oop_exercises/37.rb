# Question 1

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
oracle.predict_the_future #=> the return value of this line is a string composed of "You will" plus a random element of the array `oracle.choices`.

# Question 2

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# same as in question 1, but the choices are taken from the implementation of `choices` within RoadTrip class.


# Question 3

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# To find an object's ancestors, call the ancestors method on the object's class.
# For instance:

orange = Orange.new
p orange.class.ancestors

# Lookup chain for `Orange`:

# Orange - Taste - Object - Kernel - BasicObject

# Lookup chain for `HotSauce`:

# HotSauce - Taste - Object- Kernel - BasicObject


# Question 4

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end


# Question 5

# - local variable (no prefix)
# - instance variable (prefixed with @)
# - class variable (prefixed with @@)


# Question 6

class Television
  def self.manufacturer # class method (method name prefixed with `self`)
    # method logic
  end

  def model # instance method (method name has no prefix)
    # method logic
  end
end


# Question 7

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

# the @@cats_count variable counts the number of instance of the `Cat` class that have been created. Initially it is 0, with each new object of class `Cat` it is incremented by 1. To test, create a number of `Cat` objects and call `Cats.cats_count`.

# Question 8

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# Question 9

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Starting Bingo game!"
  end
end

# if we were to add a `play` instance method to the `Bingo` class, this method would be used by Ruby whenever we send the message `play` to a `Bingo` instance.

Bingo.new.play #=> "Starting Bingo game!"
