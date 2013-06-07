#!/usr/bin/ruby

require './lib/tic_tac_toe'
require './lib/human_player'
require './lib/player'

@human_player = HumanPlayer.new
@computer_player = Player.new

game = TicTacToe.new("         ", @human_player, @computer_player)
puts
puts "----------------------------"
puts "You are player 1. You are 'crosses'."
game.play!
