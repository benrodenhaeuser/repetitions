class Person
  attr_accessor :first_name, :last_name

  def initialize(name_str)
    self.name = name_str
  end

  def name
    (first_name + " " + last_name).strip
  end

  def name=(name_str)
    names = name_str.split(' ')
    self.first_name = names[0]
    self.last_name = names[1].to_s
  end

  def to_s
    name
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}" # will print an identifier string for the object
