=begin

Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

Numerical Score Letter  Grade
90 <= score <= 100      'A'
80 <= score < 90        'B'
70 <= score < 80        'C'
60 <= score < 70        'D'
0 <= score < 60          'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.


step 1: average the three numbers



=end

def grade_average(grade1, grade2, grade3)
  [grade1, grade2, grade3].inject(&:+) / 3
end


def get_grade(grade1, grade2, grade3)
  score = grade_average(grade1, grade2, grade3)

  case
  when 90 <= score && score <= 100 then 'A'
  when 80 <= score && score <   90 then 'B'
  when 70 <= score && score <   80 then 'C'
  when 60 <= score && score <   70 then 'D'
  when 0  <= score && score <   60 then 'F'
  end

end

# more idiomatic solution: we can use a range with a case statement


def get_grade(grade1, grade2, grade3)
  score = grade_average(grade1, grade2, grade3)

  case score
  when (90..100) then 'A'
  when (80..90)  then 'B'
  when (70..80)  then 'C'
  when (60..70)  then 'D'
  else                'F'
  end

end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
