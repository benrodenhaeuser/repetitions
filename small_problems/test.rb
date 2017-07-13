string = 'ben'
p string.chars.map { |char| char * 2 }.join == 'bbeenn'
p string.each_char.map { |char| char * 2 }.join == 'bbeenn'

e = Enumerator.new do |y|
  y << 1
  y << 2
  y << 3
end

p e


names = %w[ben julia tom]
e = names.enum_for(:select)
p e

selection = e.each do |name|
  name.start_with?('b')
end

p selection
