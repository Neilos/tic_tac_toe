require_relative 'line_aware'
require_relative 'tic_tac_toe'

class Player
  include LineAware
  attr_accessor :mark

  def initialize(name)
    @name = name
    @mark = TicTacToe::CROSS
  end

  def choose_move(board)
    return opening_play_on board if opening_play_on board
    return winning_move_on board if winning_move_on board
    return blocking_move_on board if blocking_move_on board
    return force_win_on board if force_win_on board
    return open_move_on board if open_move_on board
    return progressive_move_on board if progressive_move_on board
    return last_resort_move_on board if last_resort_move_on board
  end

  def to_s
    @name
  end


private
  
  def opening_play_on(board)
    return corners.sample if board.count(TicTacToe::SPACE)==9
    return centre.first if board.count(TicTacToe::SPACE)==8 && board[centre.first]==TicTacToe::SPACE
  end

  def winning_move_on(board)
    moves = empty_positions_in_lines_matching [mark, mark, TicTacToe::SPACE], board 
    moves.sample unless moves.count==0
  end

  def blocking_move_on(board)
    moves = empty_positions_in_lines_matching [other_players_mark, other_players_mark, TicTacToe::SPACE], board 
    moves.sample  unless moves.count==0
  end

  # def pre_emptive_blocking_move_on(board)
  #   moves = empty_positions_in_lines_matching [TicTacToe::SPACE, other_players_mark, TicTacToe::SPACE], board 
  #   moves.sample  unless moves.count==0
  # end

  def force_win_on(board)
    moves = empty_positions_in_lines_matching [mark, TicTacToe::SPACE, TicTacToe::SPACE], board
    #get duplicates
    moves.select!{|i| moves.count(i) > 1}
    moves.sample unless moves.count==0
  end

  def open_move_on(board)
    moves = empty_positions_in_lines_matching [TicTacToe::SPACE, TicTacToe::SPACE, TicTacToe::SPACE], board
    moves.sample unless moves.count==0
  end

  def progressive_move_on(board)
    moves = empty_positions_in_lines_matching [mark, TicTacToe::SPACE, TicTacToe::SPACE], board
    moves.sample unless moves.count==0
  end

  def last_resort_move_on(board)
    moves = empty_positions_in_lines_matching [mark, other_players_mark, TicTacToe::SPACE], board
    moves.sample unless moves.count==0
  end

  def other_players_mark
    mark==TicTacToe::NOUGHT ? TicTacToe::CROSS : TicTacToe::NOUGHT
  end

end
