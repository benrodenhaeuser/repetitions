class Pet
  def speak
    'bark!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end

end

class Cat < Pet
end 
