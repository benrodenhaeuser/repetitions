# recursive

def gcd_rec(x, y)
  if x == y
    x
  elsif x < y
    gcd_rec(x, y - x)
  else
    gcd_rec(x - y, y)
  end
end

# iterative

def gcd_it(x, y)
  while x != y
    if x < y
      y -= x
    else
      x -= y
    end
  end
  x
end

p gcd_rec(9, 6) # 3
p gcd_rec(111, 259) # 37

p gcd_it(9, 6) # 3
p gcd_it(111, 259) # 37

# faster with mod

def gcd_rec(x, y)
  if y == 0
    x
  else
    gcd_rec(y, x % y)
  end
end

p gcd_rec(9, 6) # 3
p gcd_rec(111, 259) # 37
