# Write a method that will take a short line of text, and print it within a box.

def get_box(string)
  top_line = '+' + '-' * (string.size + 2) + '+'
  bottom_line = top_line
  blank_line = '|' + ' ' * (string.size + 2) + '|'
  string_line = '| ' + string + ' |'

  [top_line, blank_line, string_line, blank_line, bottom_line].join("\n")
end

def print_in_box(string)
  puts get_box(string)
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
