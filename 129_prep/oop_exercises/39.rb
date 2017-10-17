# Question 1

# Ben is right. There is an attribute reader for the @balance variable, and line 9 of the code snippet correctly calls that reader method.

# Question 2

# self is missing in line 11. Line 11 will actually initialize a locvar! Also, need a setter! Alternatively, use @quantity on line 11.

# Question 3

# There is nothing wrong technically. However, we do change the public interface of the `InvoiceEntry` class when doing it this way. If we want to avoid this, we could define a private setter, or access the ivar directly.

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private

  attr_writer :quantity
end

test = InvoiceEntry.new('bla', 10)
test.update_quantity(50)
p test.quantity


class Test
  def initialize(value)
    self.value = value
  end

  private

  def value=(value)
    @value = value
  end
end

# test = Test.new #=> #<Test:0x007fb5828b7f10 @value=10>


# Question 4

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Question 5

class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type
    @glazing = glazing
  end

  def to_s
    string = ""
    @filling_type ? string << @filling_type : string << "Plain"
    string << " with #{@glazing}" if @glazing
    string
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
  # => "Plain"

puts donut2
  # => "Vanilla"

puts donut3
  # => "Plain with sugar"

puts donut4
  # => "Plain with chocolate sprinkles"

puts donut5
  # => "Custard with icing"


# Question 6

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# Explain the difference!

# create_template: While the first version of the method assigns "template 14231" to the instance variable @template, the second version calls the setter method template= which then makes the same assignment. The return value of both methods is the same. Note that "self" in the second version is not optional
# show_template: both versions call the getter method. In the second version, we choose to call the `template` setter with an explicit receiver. This is completely optional here and makes no difference. Again, the return value is the same.
