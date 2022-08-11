require_relative "board.rb"
require_relative "cursor.rb"

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end
end