require './player'
require './question'

class Game
  def initialize
    @current_player = nil
    @player1
    @player2
  end

  def start_game
    puts 'Math challenge! Player 1, enter your name!'
    @player1 = Player.new(gets.chomp)

    puts 'Player 2, enter your name!'
    @player2 = Player.new(gets.chomp)

    puts "\n"
    puts "#{@player1.name}, you start first!"
    @current_player = @player1

    # ->some function to keep game on as long as lives > 0
    start_round while (@player1.lives > 0 && @player2.lives > 0)

    # ->some function to end game once player has 0 lives
    end_game
  end
  # -->some function to change current player
  def change_current_player
    if (@current_player == @player1)
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  # -->some function to start new round
  def start_round
    puts "\n"
    puts '---- NEW TURN ----'
    question = Question.new
    puts "#{@current_player.name}: What does #{question.value1} + #{
           question.value2
         } equal?"
    player_answer = gets.chomp.to_i
    if (player_answer == question.answer)
      puts "#{@current_player.name}: Correct!"
    else
      puts "#{@current_player.name}: Oh no wrong :( you lose 1 life :("
      @current_player.lives -= 1
    end
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{
           @player2.lives
         }/3"
    change_current_player
  end

  def end_game
    puts "\n"
    puts ' ----GAME OVER---- '
    puts "#{@current_player.name} wins with a score of #{
           @current_player.lives
         }/3"
    puts 'Goodbye!'
  end
end
