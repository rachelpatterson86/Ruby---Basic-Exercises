#panlindrome



#All of these methods can do into a palindrome class but that was not the purpose of this
  #exercise. The purpose was to do a fun little exercise.

#Perhaps I should include digits.
s1 = 'evil olive'
s2 = 'racecar'
s3 = 'racecars'

#My first go around did not include palindrome testing with string that have
  #non-abc chars until i realized that strings like 'evil olive' are also considered
  #palindromes. so I created the first two methods.

def non_abc_check(str)
  is_nil = str =~ /[^a-zA-Z]/
  if is_nil.nil? == false #I could use ! instead of ==false but I think being explicit is better since I'm verifying for truth with .nil?
    remove_special_char(str)
  else
    rev(str)
  end
end

def remove_special_char(str)
  str_a = str.chars
  str_a.delete_if do |char|
    char =~ /[^a-zA-Z]/
  end
  clean_str = str_a.join
  clean_str
  rev(clean_str)
end

#created my own reverse function rather than using .reverse because, why not.
def rev(str)
  n = str.length/2 + 1
  str_a = str.chars
  rev_a = Array.new(str.length)

  n.times do |i|
    rev_a[i], rev_a[(rev_a.length - 1) - i] = str_a[(str_a.length - 1) - i], str_a[i]
  end

  rev = rev_a.join
  palindrome?(str,rev)
end

def palindrome?(str,rev_s)
  str == rev_s
end
