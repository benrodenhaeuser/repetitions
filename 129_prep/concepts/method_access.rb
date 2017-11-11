# PUBLIC - PRIVATE - PROTECTED: FIRST PASS

# public methods comprise the interface of a class
# private methods constitute implementation details
# protected methods lie in-between

# EXPLICIT/IMPLICIT RECEIVER

class Example
  def example_method
    another_example_method # receiver left implicit
  end

  def another_example_method
  end
end

example = Example.new
example.example_method # call with explicit receiver: object - '.' - method

# methods without an explicit receiver are called on the current default object
# (whatever self evaluates to)

# PUBLIC METHODS
# comprise the interface of the class

class Employee
  def initialize(name, vacation_days)
    @name = name
    @vacation_days = vacation_days
  end

  def vacation_days
    @vacation_days
  end
end

# the getter that returns the number of vacation days of an employee is part of the interface of the class, that can be used by clients making use of the class.

# can be called with/without explicit receiver

# PRIVATE METHODS
# contain implementation details

class Dog
  def initialize(name, age)
    @name = name
    @age = age
  end

  def medical_record
    <<-TEXT
      name: #{@name}
      age: #{@age}
      age in human years: #{human_years}
      blood type: ...
      ...
    TEXT
  end

  private

  # implementation detail, not accessible from the outside, but can be used to obtain the medical record of animal, which is accessible from the outside.

  def human_years
    @age * 7
  end
end

dog = Dog.new('fido', 9)
puts dog.medical_record

# private methods can only be called with an implicit receiver. as a result, they are only available to be called on an instance of the class which defines them.

# protected methods
# similar to private, but somewhat looser

class Dog

  def initialize(weight)
    @weight = weight
  end

  # method needs to call weight getter with explicit receiver in order to make comparison.
  # but we still do not want to expose the weight to clients.
  def >(other_dog)
    weight > other_dog.weight
  end

  protected

  def weight
    @weight
  end
end

fido = Dog.new(10)
# fido.weight #=> NoMethodError protected method 'weight' called
# cannot call method with explicit receiver from outside the class
tom = Dog.new(5)

# but:
p (fido > tom) # true

# Setting up an example of a protected method

def Animal
  attr_reader :height

  # an animal a is (strictly) smaller than an animal b if a's height is strictly smaller than b's height
  def <(other_animal)
    height < other_animal.height
  end
end

# But what if we do not want the height of an animal to be part of it's public interface?

# It's a secret, for some reason.

# Protected methods are like public methods outside of a class,
# like public methods from inside a class

class Animal
  def initialize(height)
    @height = height
  end

  # an animal a is (strictly) smaller than an animal b if a's height is strictly smaller than b's height
  def <(other_animal)
    height < other_animal.height
  end

  protected

  attr_reader :height
end

# Animal.new.height # => NoMethodError "protected method called"

pepa = Animal.new(10)
camillo = Animal.new(20)
p pepa < camillo # true, since 10 < 20
