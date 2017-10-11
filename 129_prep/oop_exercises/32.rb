class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# have not defined a setter
# need to change attr_reader to attr_accessor
