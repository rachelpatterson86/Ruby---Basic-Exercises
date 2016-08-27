GAME_LEVELS = {
  1 => 'Human v. Human',
  2 => 'Human v. Computer(Easy)',
  3 => 'Human v. Computer(Hard)'
}.freeze

@spaces = 1.upto(9).to_a
@win_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                     [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
@turns = 9

def board
  grid_h = "--- + --- + ---\n"
  i = 0                                       #    1  |  2  |  3
  @spaces.each_slice(3) do |row|              #   --- + --- + ---
    i += 1                                    #    4  |  5  |  6
    puts ' ' + row.join('  |  ')              #   --- + --- + ---
    puts grid_h unless i == 3                 #    7  |  8  |  9
  end
  puts "\n"
end

def before_game_setup
  welcome
  select_game_level
  select_xo
  puts "\nSelect any number on the board for where you would like to go!\n"
  board
end

def after_move_setup(input)
  move = input.to_i
  player_move_on_space(move)
  win_arr(move)
  board
end

# TODO: THINK of ways to use meta programing for the validation?
def welcome
  puts "Welcome to Tic Tac Toe: The all American game! \n What Tic Tac Toe game
    would you like to play? Select 1, 2 or 3...\n\n"

  GAME_LEVELS.each do |opt, msg|
    puts "#{opt} is #{msg}"
  end
end

def select_game_level
  input = gets.chomp.to_i
  until GAME_LEVELS.key?(input)
    puts "#{input} is not an option. Select 1, 2, or 3. Butt Nugget.\n\n"
    input = gets.chomp.to_i
  end
  puts "You've picked #{input}, #{GAME_LEVELS[input]} mode!"
  puts "Let's get started...\n\n"
  @game_level = input
end

def select_xo
  puts "But first... do you want to be 'X' or 'O'?\n\n"
  input = gets.chomp
  until input =~ /^[xo]$/i
    puts "#{input} is not an option. Select 'X' or 'O'. Ya Boob.\n\n"
    input = gets.chomp
  end
  assign_piece(input)
end

def assign_piece(input)
  @player1 = input.upcase!
  case @player1
  when 'X'
    @player2 = 'O'
  when 'O'
    @player2 = 'X'
  end
  puts "You are '#{@player1}'. Your opponent is '#{@player2}'.\n\n"
end

def player_move
  input = gets.chomp
  until valid_move?(input)
    puts "#{input} is not an option. Select an available number. Useless.\n\n"
    input = gets.chomp
  end
  after_move_setup(input)
end

def valid_move?(player_move_input)
  @spaces.any? { |s| s == player_move_input.to_i }
end

def player_move_on_space(player_move)
  @spaces[player_move - 1] = @player
end

def win_arr(player_move)
  @win_combinations.each do |combo|
    combo.each do |space|
      combo[combo.index(space)] = @player if space == player_move
    end
  end
end

def game_over?
  return unless @turns < 5
  if player_win?
    puts "#{@player} wins! Thanks for playing."
    true
  elsif gameboard_full?
    puts "Board is full and it's a tie! Thanks for playing."
    true
  end
end

def player_win?
  @win_combinations.any? { |combo| combo.uniq.length == 1 }
end

def gameboard_full?
  @turns.eql?(0)
end

def play_game_mode_1
  player_move
end

def play_game_mode_2
  @player == @player1 ? player_move : generate_dumb_computer_move
end

def generate_dumb_computer_move # play random value from @spaces
  avail_comp_move = []
  @spaces.each do |i|
    avail_comp_move << i if i.class == Fixnum
  end
  comp_move = avail_comp_move.sample
  after_move_setup(comp_move)
end

# TODO: play game mode 3 = minimax algorithm...

def game_level_move
  send "play_game_mode_#{@game_level}"
end

def player_turn
  @player == @player1 ? @player2 : @player1
end

def tic_tac_toe
  before_game_setup
  until game_over?
    @player = player_turn
    send "play_game_mode_#{@game_level}"
    @turns -= 1
  end
end

tic_tac_toe
