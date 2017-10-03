words = %w(to back)
p def could_be
    "Yessss"
  end.to_s.split('_').map { |word|
    word == 'could' ? 'good' : word
  }.zip(words).join(' ')
