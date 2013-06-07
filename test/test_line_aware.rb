require 'minitest'
require 'minitest/autorun'
require '../lib/line_aware'

class LineAwareClass
  include LineAware
end

class TestLineAware < MiniTest::Test

def test_can_return_all_rows_columns_and_diagonals
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

def test_can_work_with_arrays_and_strings
  board_array = ["1","2","3","4","5","6","7","8","9"]
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
  assert_equal line_values, line_aware_instance.lines(board_array)
end

def test_line_values
  board_array = ["1","2","3","4","5","6","7","8","9"]
  line_aware_instance = LineAwareClass.new
  line_values = ["3","5","7"]
  assert_equal line_values, line_aware_instance.line_values([2,4,6], board_array)
end

def test_can_return_a_line_matching_particular_combinations_of_values
  line_aware_instance = LineAwareClass.new
  board_string = " 23446789".split('')
  expected =  [[0,1,2]]# = [[" ","4","9"],[" ","4","7"]]
  result = line_aware_instance.lines_matching([" ","2","3"], board_string)
  assert_equal expected, result
end

def test_can_return_lineS_matching_particular_combinations_of_values
  line_aware_instance = LineAwareClass.new
  board_string = "123123123".split('')
  expected = [[2,4,6], [0,4,8], [0,1,2], [3,4,5], [6,7,8]]
  result = line_aware_instance.lines_matching(["1","2","3"], board_string)
  assert_equal expected, result
end

def test_empty_positions_in_lineS_matching_particular_combinations_of_values
  line_aware_instance = LineAwareClass.new
  board_string = " 23123123".split('')
  expected = [0]
  result = line_aware_instance.empty_positions_in_lines_matching([" ","2","3"], board_string)
  assert_equal expected, result
end



end