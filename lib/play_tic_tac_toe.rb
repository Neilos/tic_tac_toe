#!/usr/bin/ruby

require_relative 'tic_tac_toe'
require_relative 'human_player'
require_relative 'player'

players = [Player.new, HumanPlayer.new]
begin
  game = TicTacToe.new("         ", *players.rotate!)
  game.play!
  print "Play again? (Y)/n: "
  continue = gets.chomp
end until continue=="n"
