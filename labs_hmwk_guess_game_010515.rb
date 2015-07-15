#NUMBER GUESSING GAME
#Create a number guessing game. Game should pick a random number between 1 and
#100 and ask you for a guess. If the guess is less than the number, inform the
#user and let them guess again. If the guess is greater than the number, inform
#the user and let them guess again. If the guess is correct, inform the user.

Hint 1: Use .to_i to convert user input to a number. What is it by default?

Hint 2: Use rand(number) to get a random number between 0 and number
puts "Select any number from 1 to 100!"

answer = rand(101)
guess = ""

while guess != answer do
  guess = gets.to_i
  answer = rand(101)
  if !guess.between?(1,100)
    puts "#{answer} was the number. Did you follow directions? That is NOT the input needed. Try again"
  elsif guess != answer #entering again?
    puts "Guess again! You are no Miss Cleo. #{answer} was the number!"
  else
    puts "That's awesome. #{answer} was the number! You are psychic."
  end
end
