require 'minitest'
require 'minitest/autorun'
require '../lib/player'

class PersonTest < MiniTest::Test

def test_player_has_mark
  player = Player.new
  player.mark = "X"
  assert_equal "X", player.mark
end

def test_player_is_line_aware
  player = Player.new
  assert_kind_of LineAware, player
end

def test_player_can_choose_winning_move
  player = Player.new
  player.mark = "X"
  assert_equal 6, player.choose_move("X 0X0    ")
end

def test_player_can_block_winning_move_by_other_player
  player = Player.new
  player.mark = "0"
  assert_equal 6, player.choose_move("X 0X0    ")
end

def test_player_can_advance_their_position
  player = Player.new
  player.mark = "X"
  assert_equal 4, player.choose_move("X 0    0 ")
end

def test_player_to_s_returns_right_number
  player1 = Player.new
  player1.mark = "X"
  assert_equal "1", player1.to_s

  player2 = Player.new
  player2.mark = "0"
  assert_equal "2", player2.to_s
end

end