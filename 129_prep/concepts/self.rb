# Notes on self

# self is an expression that evaluates – like all Ruby expressions – to an
# object.

# More precisely: `self` evaluates to the current default object.
# what `self` evaluates to depends on the place where `self` is evaluted
# (the current "context")

# the current default object is the object on which any unprefixed method is invoked.

# instance method: self is the object on which method is invoked

class Animal
  def initialize(name)
    @name = name
  end

  def instance_method
    self # the instance on which method is called
  end
end

animal = Animal.new('kitty')
p animal.instance_method #=> #<Animal:0x007fa642846be8 @name="kitty">

# class method: self is the class to which method belongs

class Animal
  def self.class_method
    self
  end
end

p Animal.class_method #=> Animal

# in the top-level context: self evaluates to main

p self # => main

# HOW IS SELF USED?

# 1.) METHOD CALLS

# What is the significance of the current default object? It's the object on
# which unprefixed method calls are invoked (usually).

# In many cases, self can be omitted/is optional,
# so that method is implicitly called on current default object

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name_with_explicit_self
    puts self.name
  end

  def current_default_implicitly
    puts name
  end
end

animal = Animal.new('kitty')
animal.name_with_explicit_self #=> kitty is output
animal.current_default_implicitly #=> kitty is output

# However, sometimes we have to use self.
# Namely: for setter methods

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def give_new_name_wrong_way(new_name)
    name = new_name
  end

  def give_new_name_right_way(new_name)
    self.name = new_name
  end
end

animal = Animal.new('kitty')
animal.give_new_name_wrong_way('pepa')
puts animal.name #=> pepa??? NO! still kitty
animal.give_new_name_right_way('pepa')
puts animal.name #=> pepa

# And sometimes, we are not allowed to use self
# Namely: for private methods

class Animal
  def initialize(name)
    @name = name
  end

  def give_me_encrypted_name_wrong_way
    self.encrypt_name
  end

  def give_me_encrypted_name_right_way
    encrypt_name
  end

  private

  def encrypt_name
    # fancy encryption: implementation omitted!
    'epqtjqga§#' # let's pretend this is the encrypted name
  end
end

animal = Animal.new('kitty')
# animal.give_me_encrypted_name_wrong_way # exception! private method called
puts animal.give_me_encrypted_name_right_way

# The previous two points raise a question:
# What about private setters?

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def invoke_private_setter(new_name)
    # how to do it?
    # name = new_name # cannot work, see above
    self.name = new_name # seems illegal, see above. BUT: it is legal!
  end

  private

  attr_writer :name
end

animal = Animal.new('kitty')
p animal.invoke_private_setter('pepa')
p animal.name # pepa


# 2.) RETURN VALUES
# Another common use for self is as a return value

class BinaryTree
  include Enumerable

  # methods to model binary tree omitted

  # would like to iterate over tree, yielding all its nodes
  # have to provide each method for enumerable to work
  def each
    # meat of implementation omitted
    # would like each to return the calling object:
    self
  end
end

# 3.) CALLING CLASS METHODS FROM INSTANCE METHODS
# Another case of disambiguation.

class Post
  def self.author
    "Jimmy"
  end

  def initialize(date)
    @date = date
  end

  def byline
    "Written on #{@date} by #{class.author}"
  end
end

# The above is not going to work, because Ruby will interpret `class` as the `class` keyword (rather than the `class` method that is available on the `Post` instance). So we have to use `self` to get our intention across:

class Post
  def self.author
    "Jimmy"
  end

  def initialize(date)
    @date = date
  end

  def byline
    "Written on #{@date} by #{self.class.author}"
  end
end
