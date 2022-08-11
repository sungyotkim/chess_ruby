require "./modules/slideable.rb"
require "./modules/steppable.rb"

class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?(pos)
        @board[pos[0]][pos[1]].is_a?(NullPiece)
    end

    def pos=(val)
        @pos = val
    end
    
    def valid_moves
        moves #need an array of possible moves from the piece, use modules for sliding and stepping pieces
    end

    private
    attr_reader :color, :pos
end