# panlindrome

# All of these methods can go into a palindrome class but that was not the
# purpose of this exercise. The purpose is to have fun.

# Perhaps I should include digits.
# 'evil olive'
# 'racecar'
# 'racecars'

# My first go around did not include palindrome testing with string that have
# non-abc chars until i realized that strings like 'evil olive' are also
# considered palindromes. so I created the first two methods.

def non_abc_check(str)
  if str =~ /[^a-zA-Z]/
    letters_only_str = remove_special_char(str)
    rev(letters_only_str)
  else
    rev(str)
  end
end

def remove_special_char(str)
  str_a = str.chars
  str_a.delete_if do |char|
    char =~ /[^a-zA-Z]/
  end
  str_a.join
end

# created my own reverse function rather than using .reverse because, why not.

def rev(str)
  n = (str.length / 2) + 1
  rev_a = {}

  n.times do |i|
    rev_a[i]                      = str[str.length - i]
    rev_a[(rev_a.length - 1) - i] = str[i]
  end

  palindrome?(str, rev_a.join)
end

def palindrome?(str, rev_s)
  str == rev_s
end
