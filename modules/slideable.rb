module Slideable
    def diagonal_dirs #bishops, queen
        [
            [1, 1],
            [1, -1],
            [-1, -1],
            [-1, 1]
        ]   
    end

    def horizontal_dirs #rooks, queen
        [
            [0, 1],
            [1, 0],
            [0, -1],
            [-1, 0]
        ]   
    end

    def move_dirs
        #to be taken from subclasses
    end

    def moves 
        possible_moves = []
        start_pos = self.pos
        current_color = self.color
        move_dirs.each do |(dx, dy)|
            cur_x, cur_y = start_pos
            until cur_x + dx < 0 || cur_y + dy < 0 || cur_x + dx > 7 || cur_y + dy > 7 #loop until you reach end of board
                new_pos = [cur_x + dx, cur_y + dy]
                row, col = new_pos
                if @board[row][col].is_a?(NullPiece) #if position is empty, keep going
                    possible_moves << new_pos
                else #not an empty piece
                    if @board[row][col].color != current_color #enemy color can be eaten, so include
                        possible_moves << new_pos
                        break #stop the loop, can't go past the enemy's position
                    else
                        break #stop the loop, can't go where allies are
                    end
                end
                cur_x += dx
                cur_y += dy
            end
        end
        possible_moves #return possible moves after going through all directional positions
    end
end