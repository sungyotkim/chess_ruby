module Steppable
    def move_diffs #knight, king
        #to be overwritten by subclasses
    end

    def moves # need to get an array of possible moves
        possible_moves = []
        current_color = self.color
        cur_x, cur_y = pos

        move_diffs.each do |(dx, dy)| #king and knight moves differently so we iterate through their potential moves
            new_pos = [cur_x + dx, cur_y + dy]

            if new_pos.all? { |coord| coord.between?(0, 7) } #as long as the move is within the board, we add it
                possible_moves << new_pos
            end
        end

        #need to check if these spots are occupied and keep if they are of an opposing color
        possible_moves.select { |pos| @board[pos[0]][pos[1]].is_a?(NullPiece) || @board[pos[0]][pos[1]].color != current_color }
    end
end