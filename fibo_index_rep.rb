# find the smallest index such that the fibonacci number at that index
# has a given number of digits

def fibo(n)
  f = []
  f[0] = 0
  f[1] = 1

  i = 2

  while i <= n
    f[i] = f[i - 1] + f[i - 2]
    i +=1
  end

  f[n]
end

def smallest_fibo(number_of_digits)
  return 0 if number_of_digits == 1

  f = []
  f[0] = 0
  f[1] = 1

  i = 2

  loop do
    f[i] = f[i - 1] + f[i - 2]
    break i if f[i].digits.count == number_of_digits
    i +=1
  end
end

p smallest_fibo(1) # 0

p smallest_fibo(7) # 31
p fibo(smallest_fibo(7)).digits.count == 7 # true
p fibo(smallest_fibo(7) - 1).digits.count == 6 # true
