require "./piece.rb"

class King < Piece
    def initialize(color, board, pos)
        super(color, board, pos)
        color == :black ? @symbol = "♚" : @symbol = "♔"
    end

    def to_s
        @symbol
    end
end