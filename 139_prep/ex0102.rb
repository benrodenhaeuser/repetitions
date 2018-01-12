def compute
  return yield if block_given?
  'Does not compute.'
end

# or

def compute
  return 'Does not compute.' unless block_given?
  yield
end



p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
