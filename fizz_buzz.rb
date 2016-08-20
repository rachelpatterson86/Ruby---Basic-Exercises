# if number is divisible by 3 print Fizz, if 5 print buzz if 3 & 5 print
# fizzbuzz

def fizzbuzz(max_number)
  1.upto(max_number).each do |num|
    next puts 'fizzbuzz' if (num % 15).zero?
    next puts 'fizz' if (num % 3).zero?
    next puts 'buzz' if (num % 5).zero?
    puts num
  end
end

fizzbuzz(100)
