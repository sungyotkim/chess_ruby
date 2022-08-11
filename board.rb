require 'colorize'
require_relative 'piece.rb'
require './pieces/null_piece.rb'

class Board
    def initialize
        @board = Array.new(8) { Array.new(8, NullPiece.instance) }
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

    # def valid_pos?(end_pos)

    # end

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