# write a method to determine whether a number is a prime

def prime?(number)
  (2...number).each { |n| return false if number % n == 0 }
  true
end

p prime?(13)
p prime?(4)
p prime?(17)
