class Board
    def initialize
        @board = Array.new(8) { Array.new(8, nil) }
        (0..7).each do |col|
            @board[1][col] = Piece.new #pawns
            @board[6][col] = Piece.new #pawns
            case col
            when 0, 7
                @board[0][col] = Piece.new  #rook
                @board[7][col] = Piece.new  #rook
            when 1, 6
                @board[0][col] = Piece.new #knight
                @board[7][col] = Piece.new #knight
            when 2, 5
                @board[0][col] = Piece.new #bishop
                @board[7][col] = Piece.new #bishop
            when 3
                @board[0][col] = Piece.new #queen
                @board[7][col] = Piece.new #queen
            when 4
                @board[0][col] = Piece.new #king
                @board[7][col] = Piece.new #king
            end
        end
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end
end