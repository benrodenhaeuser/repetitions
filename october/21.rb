def greetings(array, hash)
  name = array.join(' ')
  full_title = hash[:title] + " " + hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{full_title} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
