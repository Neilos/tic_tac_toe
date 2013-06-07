
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

def line_values(line, board)
  line.map{|position| board[position]}
end

def lines_matching(search_values=[], board)
  LINE_INDEXES.select{ |line| search_values.permutation.to_a.include? line_values(line, board) }
end

def empty_positions_in_lines_matching(search_values=[], board)
  result = []
  lines_matching(search_values, board).each do |line|
    line.each do |position|
      result << position if board[position] == " "
    end
  end
  result.uniq
end

end