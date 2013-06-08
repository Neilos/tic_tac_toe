#!/usr/bin/ruby

require './lib/tic_tac_toe'
require './lib/human_player'
require './lib/player'

players = [Player.new, HumanPlayer.new]
begin
  game = TicTacToe.new("         ", *players.rotate!)
  game.play!
  print "Play again? (Y)/n"
  continue = gets.chomp
end until continue=="n"
