require_relative 'board.rb'

def Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: 'Player1',
      black: 'Player2'
    }
    @current_player = :white
  end
end