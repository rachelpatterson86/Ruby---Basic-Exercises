#HAPPY NUMBERS
# A happy number is a number defined by the following process:
# Starting with any positive integer, replace the number by the sum of the squares of its digits
# , and repeat the process until the number equals 1 (where it will stay), or
# it loops endlessly in a cycle which does not include 1.
# Those numbers for which this process ends in 1 are happy numbers,
#  while those that do not end in 1 are unhappy numbers (or sad numbers).[1]
#
#sad number walkthrough of logic:
# 55
#
# 5   5
# 25+25 = 50
#
# 25 + 0 = 25
# 4+25 = 29
# etc...

#some defined happy numbers
#1, 7, 10, 13, 19, 23, 28, 31, 32, 44, 49, 68

def happy_numbers(number)

  return true if number == 1
  return false if number == 0
  happy = false

  until happy == true
    potential_happy_number = 0
    number.to_s.each_char do |num|
      potential_happy_number += num.to_i**2
    end

    return happy = true if potential_happy_number == 1
    number = potential_happy_number
  end
end

is_happy?(100)  # => true
is_happy?(7)    # => true
is_happy?(44)   # => true
is_happy?(68)   # => true
