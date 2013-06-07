
module LineAware


LINE_INDEXES = [
  # backslash
  [2,4,6],
  # forwardslash
  [0,4,8],
  # columns
  [0,3,6],[1,4,7],[2,5,8],
  # rows
  [0,1,2],[3,4,5],[6,7,8]
]

def lines(board)
  LINE_INDEXES.map{ |line| line.map{ |index| board[index] } }
end

def lines_containing(search_values = [], board)
  lines(board).select{|line_values| search_values - line_values == []}
end

end