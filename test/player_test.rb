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

def test_player_can_choose_move
  player = Player.new
  player.mark = "X"
  assert_equal 6, player.choose_move("X 0X0    ")
end

end