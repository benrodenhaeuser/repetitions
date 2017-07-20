# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

=begin

idea:
- given argument n
- produce a string consisting of n lines
- each line has length n, and an ascending number of stars right-justified in line, from 1 to n.

implementation details:
- can produce the overall string with inject method
- call inject on range (1..n), pass empty string as initial value, block param num
- on each iteration, add another line to memo-string with num stars right-justified in string of length n, add newline at the end.

how to get a right-justified string?

  string.rjust(n) where string is a sequence of stars.

=end

def triangle(n)
  triangle = (1..n).inject('') do |memo, current_num|
    stars = '*' * current_num
    line = stars.rjust(n) + "\n"
    memo + line
  end
  puts "\n" + triangle + "\n"
end

triangle(5)
triangle(10)
