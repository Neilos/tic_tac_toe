#!/usr/bin/ruby

require_relative 'tic_tac_toe'
require_relative 'human_player'
require_relative 'player'

print "Enter your name: "
human_name = gets.chomp
human = HumanPlayer.new(human_name)
computer = Player.new("Matthew Broderick")
players = [computer, human]
scores = {computer:0, human:0, draw:0}
begin
  game = TicTacToe.new("         ", *players.rotate!)
  game.play!
  if game.game_won?
    game.winner==human ? scores[:human] += 1 : scores[:computer] += 1
  else
    scores[:draw] += 1
  end
  puts "The scores are: \n#{computer} - #{scores[:computer]}\n#{human} - #{scores[:human]}\n(draws - #{scores[:draw]})"
  print "Play again? (Y)/n: "
  continue = gets.chomp
end until continue=="n"
