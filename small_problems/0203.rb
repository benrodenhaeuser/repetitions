# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:
#
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0


def tip(bill, percentage)
  bill * (percentage / 100)
end

def total(bill, tip)
  bill + tip
end

puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
percentage = gets.to_f

tip = tip(bill, percentage)
total = total(bill, tip)

puts "The tip is #{format('%.2f', tip)} dollar(s)."
puts "The total is #{format('%.2f', total)} dollar(s)."
