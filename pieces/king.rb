require "./piece.rb"

class King < Piece
    include Steppable

    def initialize(color, board, pos)
        super(color, board, pos)
        color == :black ? @symbol = "♚" : @symbol = "♔"
    end

    def to_s
        @symbol
    end

    def move_diffs
        [
            [0, -1],
            [-1, -1],
            [-1, 0],
            [-1, 1],
            [0, 1],
            [1, 1],
            [1, 0],
            [1, -1]
        ]
    end
end