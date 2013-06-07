require 'minitest'
require 'minitest/autorun'
require '../lib/line_aware'

class LineAwareClass
  include LineAware
end

class TestLineAware < MiniTest::Test

def test_lines_returns_all_rows_columns_and_diagonals
  board_string = "123456789"
  line_aware_instance = LineAwareClass.new
  line_values = [
    # backslash
    ["3","5","7"],
    # forwardslash
    ["1","5","9"],
    # columns
    ["1","4","7"],["2","5","8"],["3","6","9"],
    # rows
    ["1","2","3"],["4","5","6"],["7","8","9"]
  ]
  assert_equal line_values, line_aware_instance.lines(board_string)
end



end