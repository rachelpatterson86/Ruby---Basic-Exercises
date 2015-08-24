#if number is divisible by 3 print Fizz, if 5 print buzz if 3 & 5 print fizzbuzz
num = 100
def fizz_buzz(num)
n=1
  while n <= num do
    if n%3 == 0 && n%5 == 0
      puts "fizzbuzz"
    elsif n%3 == 0
      puts "fizz"
    elsif n%5 == 0
      puts "buzz"
    else
      puts n
    end
    n += 1
  end
end

fizz_buzz(num)
