require 'colorize'
require_relative 'piece.rb'
require './pieces/null_piece.rb'
require './pieces/pawn.rb'
require './pieces/bishop.rb'
require './pieces/rook.rb'
require './pieces/knight.rb'
require './pieces/queen.rb'

class Board
    def initialize
        @board = Array.new(8) { Array.new(8, NullPiece.instance) }
        (0..7).each do |col|
            @board[1][col] = Pawn.new(:black, @board, [1, col])
            @board[6][col] = Pawn.new(:white, @board, [6, col])
            case col
            when 0, 7
                @board[0][col] = Rook.new(:black, @board, [0, col])  
                @board[7][col] = Rook.new(:white, @board, [6, col])  
            when 1, 6
                @board[0][col] = Knight.new(:black, @board, [0, col]) 
                @board[7][col] = Knight.new(:white, @board, [6, col]) 
            when 2, 5
                @board[0][col] = Bishop.new(:black, @board, [0, col]) 
                @board[7][col] = Bishop.new(:white, @board, [6, col]) 
            when 3
                @board[0][col] = Queen.new(:black, @board, [0, col]) 
                @board[7][col] = Queen.new(:white, @board, [6, col]) 
            # when 4
            #     @board[0][col] = Piece.new(:black, @board, [0, col]) #king
            #     @board[7][col] = Piece.new(:white, @board, [6, col]) #king
            end
        end
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end

    def valid_pos?(end_pos)
        if end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
            return false 
        else
            return true
        end
    end

    # def move_piece(start_pos, end_pos)

    # end

    def show
        puts "  0 1 2 3 4 5 6 7"
        @board.each_with_index do |row, i|
            if i.even?
                colored = (0..7).map do |j|
                    if j.even?
                        (row[j].to_s + " ").colorize(:background => :white)
                        
                    else 
                        (row[j].to_s + " ").colorize(:background => :black)
                    end
                end
            else
                colored = (0..7).map do |j|
                    if j.odd?
                        (row[j].to_s + " ").colorize(:background => :white)
                    else 
                        (row[j].to_s + " ").colorize(:background => :black)
                    end
                end
            end
            puts "#{i} #{colored[0]}#{colored[1]}#{colored[2]}#{colored[3]}#{colored[4]}#{colored[5]}#{colored[6]}#{colored[7]}"
        end
    end
end