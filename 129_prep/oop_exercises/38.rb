# Question 1 and 2

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    Greeting.new.greet("Hello!")
  end

  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi  # add class method to make it work

# Question 3

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

tom = AngryCat.new(10, 'Tom')
tim = AngryCat.new(12, 'Tim')

# Question 4

class Cat
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{@type} cat"
  end
end

puts Cat.new("tabby")

# Question 5

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # NameError (undefined method)
tv.model # fine

Television.manufacturer # fine
Television.model # NameError (undefined method)


# Question 6

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end


# Question 7

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
