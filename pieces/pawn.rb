require "./piece.rb"

class Pawn < Piece
    def initialize(color, board, pos)
        super(color, board, pos)
        color == :black ? @symbol = "♟" : @symbol = "♙"
    end

    def to_s
        @symbol
    end

    def at_start_row?
        if self.color == :white
            return true if self.pos[0] == 6
        else
            return true if self.pos[0] == 1
        end
        false
    end
end