# # BEWARE THE SEMICOLON!

require 'pry'
require 'set'

words = %w(angus onomatopeia mississippi cookies terminal
           illness communist dictator capitalist marxist darwinism)

# guesses = ['x', 'i']
# comput_word = 'marxist'
# player_word = '   xi  '

# for each letter in comput_word
#   if letter is in guesses
#     print letter
#   else
#     print space, underscore or asterisk, but don't show the letter

def finished?(turns, guesses, answer)
  turns.zero? || complete_word?(guesses, answer)
end

def greeting
  puts 'Welcome to Hangman. You know what to do!'
end

def complete_word?(guesses, answer)
  answer.chars.all? { |l| guesses.include?(l) }
end

def game_over(guesses, answer)
  if complete_word?(guesses, answer)
    puts 'You win!'
  else
    puts "You lose. #{answer} is the answer"
  end
end

def prompt_player(turns)
  puts ''
  puts "What letter would you like to guess? You have #{turns} turns left."
  gets.chomp.downcase
end

def display_partial_word(guesses, answer)
  answer.each_char do |c|
    if guesses.include?(c)
      print c
    else
      print '_'
    end
  end
end

def game(turn_count, guessed, answer)
  until finished?(turn_count, guessed, answer)
    guess = prompt_player(turn_count)
    guessed.add(guess)
    display_partial_word(guessed, answer)
    turn_count -= 1 unless answer.include?(guess)
  end
end

def hangman(words)
  turn_count = ARGV.empty? ? 6 : ARGV[0].to_i
  guessed = Set.new
  answer = words.sample(1)[0]
  greeting
  game(turn_count, guessed, answer)
  game_over(turn_count, guessed, answer)
end

hangman(words)
# prompt_player(turns)
