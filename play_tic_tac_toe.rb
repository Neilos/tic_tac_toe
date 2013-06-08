#!/usr/bin/ruby

require './lib/tic_tac_toe'
require './lib/human_player'
require './lib/player'

@human_player = HumanPlayer.new
@computer_player = Player.new

game = TicTacToe.new("         ", @human_player, @computer_player)
game.play!
