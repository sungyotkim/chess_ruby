require "./piece.rb"

class Bishop < Piece
    include Slideable

    def initialize(color, board, pos)
        super(color, board, pos)
        color == :black ? @symbol = "♝" : @symbol = "♗"
    end

    def to_s
        @symbol
    end

    def move_dirs
        diagonal_dirs
    end
end