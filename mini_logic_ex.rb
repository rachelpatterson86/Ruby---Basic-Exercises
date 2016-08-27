# code ex in the book

# write a function for a string and reverse the string...

# thought process
# p e o p l e
# 0 1 2 3 4 5
#
# e e o p l p
# 0 1 2 3 4 5

# 'sam'
# 'same'

def rev(str)
  n = str.length / 2
  n.times do |i|
    str[i], str[(str.length - 1) - i] = str[(str.length - 1) - i], str[i]
  end
  str
end

# fibonacci
# 0,1,1,2,3,5...
# 0,1,2,3,4,5...
# f(n)=f(n-1) + f(n-2)
# f(0) = 0
# f(1) = 1
# write a fx, n = 10, gives 10th num of fib seq and n = 100, gives the 100th num
# of fib seq

# 10

# f(10) = f(10 - 1) + f(10 - 2)

# f(10) = f(9) + f(8) = 34 + 21 = 55
# f(9) = f(8) + f(7) = 21 + 13 = 34
# f(8) = f(7) + f(6) = 13 + 8 = 21
# f(7) = f(6) + f(5) = 8 + 5 = 13
# f(6) = f(5) + f(4) = 5 + 3 = 8
# f(5) = f(4) + f(3) = 3 + 2 = 5
# f(4) = f(3) + f(2) = 2 + 1 = 3
# f(3) = f(2) + f(1) = 1 + 1 = 2
# f(2) = f(1) + f(0) = 1 + 0
# f(1) = 1
# f(0) = 0

def f(n)
  return 0 if n.zero?
  return 1 if n == 1
  # n = 3
  f(n - 1) + f(n - 2)
end

# TODO: improve efficiency. No point working on f(n-2)

# Print out * n number of times in asc and desc order like this:

# this is asc order.
# 1 = *
# 2 = **
# 3 = ***
# 4 = ****

def stars_desc(n)
  return if n.zero?
  i = 0
  until i == n
    (n - i).times do
      print '*'
    end
    print "\n"
    i += 1
  end
end

def stars_asc(n)
  return if n.zero?
  i = n
  until i.zero?
    ((n - i) + 1).times do
      print '*'
    end
    print "\n"
    i -= 1
  end
end

# Permutation
# determine if a string is a permutation of another.

# 'cats'
# 'astc'

# nice and clean.
def permutation(s1, s2)
  return false unless s1.length == s2.length
  snew = s1 + s2
  snew.each_char do |c|
    return false unless ((snew.count c) % 2).zero?
  end
  true
end

# longer but clearer perhaps?
def permutation_long(s1, s2)
  return false unless s1.length == s2.length
  n = s1.length
  perm = true
  n.times do |i|
    perm = false if s1.chars.sort[i] != s2.chars.sort[i]
    break unless perm
    return false
  end
  perm if perm == true
end

# isSubstring
# 1.8 Assume you have a method isSubstring which checks if one word is a
# substring of another. Given two strings, si and s2, write code to check if s2
# is a rotation of s1 using only one call to isSubstring (e.g.,'waterbottle'is
# a rotation of 'erbottlewat').
#
# s1 = 'waterbottle'
# s2 = 'erbottlewat'
#
# w a t e r b o t t l e
# 0 1 2 3 4 5 6 7 8 9 10
#
# e r b o t t l e  w a t
# 3 4 5 6 7 8 9 10 0 1 2
# 0 1 2 3 4 5 6 7  8 9 10

# function to test if a num is prime

# s3 = 'waterway'
# s4 = 'waywater'

# check s2 against s1.

# use sort method...
# s1 and s2 same length
# s1 and s2 have same characters

# find the 0 index letter s2

def substring?(s1, s2)
  return false unless s1.chars.sort == s2.chars.sort
  s2.each_char do |j|
    rotation_check = ''
    next unless s1[0] == j
    idx = s2.index(j)
    rotation_check += s2[idx...s2.length]
    rotation_check += s2[0...idx]
    return true if rotation_check == s1
  end
  false
end

# You have 10 pebbles (numbered 1-10). They are by default black. You must alter
# them by painting them white if they are black or painting them black if they
# are white. There are 10 rounds. Every round, you must alter the pebbles that
# are multiples of the current round. The pebbles are by default black.
#
# 1st round, you alter every pebble (paint them all white).
# 2nd round, you alter every other pebble(you paint pebbles # 2,4,6,8,10 black).
# 3rd round, you alter pebbles # 3,6,9.
# 4th round you alter pebbles # 4,8.
# ...
# 10th round, you alter pebble # 10.
# After the 10 rounds, which are painted black & which are painted white?

# @color = [:b,:w]
# limit = 10
def pebble_color_hash(n)
  pebble_arr = (1..n).to_a
  pebble_color = {}
  pebble_arr.each do |i|
    pebble_color[pebble_arr[i - 1]] = @color[0]
  end
  pebble_count(n, pebble_color)
  pebble_color
end

def pebble_count(n, pebble)
  t = 1
  n.times do
    pebble.each_key do |k|
      pebble[k] = assign_color(pebble_hash[k]) if pebble.keys[k - 1] % t.zero?
      puts pebble + t
    end
    t += 1
  end
  puts pebble
end

def assign_color(pebble)
  pebble == @color[0] ? @color[1] : @color[0]
end
pebble_color_hash(limit)

# Sum of multiples
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

# n=1000
def sum_3_5(n)
  sum = 0
  num = 0
  while num < n
    sum += num if (num % 3).zero? || (num % 5).zero?
    num += 1
  end
  sum
end
