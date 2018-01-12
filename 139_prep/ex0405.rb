items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*stuff, last_one|
  puts stuff.join(', ')
  puts last_one
end

gather(items) do |first_one, *stuff, last_one|
  puts first_one
  puts stuff.join(', ')
  puts last_one
end

gather(items) do |first_one, *stuff|
  puts first_one
  puts stuff.join(', ')
end

gather(items) do |first_one, second_one, third_one, fourth_one|
  puts [first_one, second_one, third_one, fourth_one].join(', ')
end
