require 'minitest'
require 'minitest/autorun'
require '../lib/player'

class PersonTest < MiniTest::Test

def test_play_has_mark
  player = Player.new("X")
  assert_equal "X", player.mark
end

end