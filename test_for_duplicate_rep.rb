# test if given array contains a duplicate value



=begin

this should be possible going through the array only once.

- we iterate over the array once
- if we encounter an element that we have already encountered, we return true.
- every element we encounter is flagged in a hash (e.g., we put "1 => true" if we encounter 1).
- after the iteration is complete, return false (if we got to this point: no duplicates!)

=end

def duplicate?(array)
  seen = {}
  array.each do |elem|
    return true if seen[elem]
    seen[elem] = true
  end
  false
end

p duplicate?([]) == false
p duplicate?([1]) == false
p duplicate?([1, 2, 3, 4, 5, 1]) == true
