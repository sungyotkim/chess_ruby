require "./piece.rb"

class Knight < Piece
    include Steppable

    def initialize(color, board, pos)
        super(color, board, pos)
        color == :black ? @symbol = "♞" : @symbol = "♘"
    end

    def to_s
        @symbol
    end

    def move_diffs #array of 8 possible moves
        [
            [-2, -1],
            [-2,  1],
            [-1, -2],
            [-1,  2],
            [ 1, -2],
            [ 1,  2],
            [ 2, -1],
            [ 2,  1]
        ]
    end
end