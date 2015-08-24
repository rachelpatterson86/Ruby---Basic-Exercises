#HAPPY NUMBERS
# A happy number is a number defined by the following process: Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers, while those that do not end in 1 are unhappy numbers (or sad numbers).[1]

#sad number walkthrough of logic:
# 55
#
# 5   5
# 25+25 = 50
#
# 25 + 0 = 25
# 4+25 = 29
# 4 + 81 = 85
# 64 + 25 = 89
# 64 + 81 = 145
# 1 + 16 + 25 = 42
# 16 + 4 =20
# 4 + 0 = 4
# 16 = 16
# 1+36 = 37
# 9 + 49 = 58
# 25 + 64 = 89
#
# 10
# 1 = 1

require 'pry'

#2am coding is not ideal.  This should be refactored.

def is_happy?(n)
  s = n.to_s
  int = 0
  happy = false
  unless happy
    l=s.chars.length
      l.times do |i|
        digit = s[i].to_i
        int += digit * digit
      end
    if int == 1
      happy = true
    else
      s = int.to_s
    end
  end
end

is_happy?(100)
