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
        moves #need an array of possible moves from the piece, use modules for sliding and stepping pieces
    end
end