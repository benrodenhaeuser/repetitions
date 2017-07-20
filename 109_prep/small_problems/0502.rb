# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

=begin

let's think about the case of positive number first.

given number_of_minutes, we get the number_of_minutes after midnight by doing

number_of_minutes = number_of_minutes % MINUTES_IN_A_DAY


MINUTES_IN_A_DAY = 60 * 24

number_of_minutes = - 3

how to get to 23:57?

=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY


def time_of_day(minutes)
  time_in_minutes = minutes % MINUTES_PER_DAY
  hours, minutes = time_in_minutes.divmod(MINUTES_PER_HOUR)

  hours_string = "%02i" % hours
  minutes_string = "%02i" % minutes

  "#{hours_string}:#{minutes_string}"
end

# actually, the last three lines can be simplified to:
# format('%02d:%02d', hours, minutes)

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
