require "./modules/slideable.rb"
require "./modules/steppable.rb"

class Piece
    attr_reader :color, :board, :pos
    
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        false
    end

    def pos=(val)
        @pos = val
    end
    
    def valid_moves
        #need an array of possible moves from the piece, use modules for sliding and stepping pieces
        moves.reject { |end_pos| move_into_check?(end_pos) } #reject positions that would result in check
    end

    private

    def move_into_check?(end_pos)
        test_board = board.dup
        test_board.move_piece!(pos, end_pos)
        test_board.in_check?(color)
    end
end