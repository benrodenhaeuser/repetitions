# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

=begin

approach: start with after_midnight

- we are given a time like "12:34" as a string
- retrieve the two integers we are interested in: hours, minutes
- return (hours * 60) + minutes

before_midnight can be defined in terms of after_midnight

=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY


def after_midnight(time_string)
  hours = time_string[0..1].to_i
  minutes = time_string[-2..-1].to_i
  ((hours * MINUTES_PER_HOUR) + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_string)
  (MINUTES_PER_DAY - after_midnight(time_string)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
