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

    private
    attr_reader :color, :pos
end