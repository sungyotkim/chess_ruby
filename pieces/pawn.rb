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

    def forward_dir
        if self.color == :white 
            return [-1, 0]
        else
            return [1, 0]
        end
    end

    def moves
        arr = []
        if self.at_start_row?
            # p "hello"
            # p start_move
            # p side_attacks
            arr += start_move if !start_move.nil?
            arr += side_attacks if !side_attacks.nil? #can attack even if front is blocked
        else
            arr << forward_steps if !forward_steps.nil? #this returns one array so we push it
            arr += side_attacks if !side_attacks.nil? #can attack even if front is blocked
        end
        arr
    end

    def start_move
        arr = []
        start_pos = self.pos
        row, col = start_pos
        dx, dy = forward_dir

        forward_one = [(row + dx), (col + dy)]
        forward_two = [(row + dx + dx),( col + dy + dy)] #pawns can move 2 spaces if at the starting position

        # if @board[forward_one[0]][forward_one[1]].is_a?(NullPiece) 
        #     arr << forward_one
        # end
        
        if @board[forward_two].is_a?(NullPiece) && @board[forward_one].is_a?(NullPiece) #can only move if front two spots are empty
            arr << forward_two
        elsif @board[forward_one].is_a?(NullPiece) 
            arr << forward_one
        end

        return arr
    end

    def forward_steps
        start_pos = self.pos
        row, col = start_pos
        dx, dy = forward_dir

        if row + dx >= 0 && row + dx < 8
            if @board[[(row + dx), col]].is_a?(NullPiece) #can only move if empty spot in front
                return [(row + dx), col]
            else
                return []
            end
        end
    end

    def side_dir
        if self.color == :white 
            return [[-1, -1], [-1, 1]]
        else
            return [[1, -1], [1, 1]]
        end
    end

    def side_attacks
        start_pos = self.pos
        current_color = self.color
        row, col = start_pos
        arr = []
        side_dir.each do |dx, dy|
            if !@board[[(row + dx),(col + dy)]].is_a?(NullPiece) && !@board[[(row + dx),(col + dy)]].nil? && @board[[(row + dx),(col + dy)]].color != current_color #check to see if side attack is possible
                arr << [(row + dx), (col + dy)]
            end
        end
        arr
    end
end