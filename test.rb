# Version with each and select

require 'benchmark'

def list_squared(m, n)
  result = []
    (m..n).each do |number|
      sum_of_squared_divisors =
        find_divisors(number).map { |divisor| divisor**2 }.inject(:+)
      if Math.sqrt(sum_of_squared_divisors) % 1 == 0
        result << [number, sum_of_squared_divisors]
      end
    end
   result
end

def find_divisors(number)
  (1..number).select do |num|
    number % num == 0
  end
end

puts Benchmark.realtime { list_squared(250, 50000) }
