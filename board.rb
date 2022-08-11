require 'colorize'
require_relative 'piece.rb'
require './pieces/null_piece.rb'
require './pieces/pawn.rb'
require './pieces/bishop.rb'
require './pieces/rook.rb'
require './pieces/knight.rb'
require './pieces/queen.rb'
require './pieces/king.rb'

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
            when 4
                @board[0][col] = King.new(:black, @board, [0, col]) 
                @board[7][col] = King.new(:white, @board, [6, col]) 
            end
        end
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @board[row][col]
    end

    def []=(pos, piece)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @board[row][col] = piece
    end

    def valid_pos?(end_pos)
        if end_pos[0] < 0 || end_pos[0] > 7 || end_pos[1] < 0 || end_pos[1] > 7
            return false 
        else
            return true
        end
    end

    def move_piece(start_pos, end_pos)
        raise "There is no piece at this position" if self[start_pos].is_a?(NullPiece)
        raise "End position is out of board range" if !valid_pos?(end_pos)

        piece = self[start_pos]
        raise RuntimeError "Invalid move" if !piece.valid_moves.include?(end_pos)

        begin    
        rescue RuntimeError
            p "Please another move"
            retry
        end

        self[start_pos] = NullPiece.instance #replace with empty instance
        self[end_pos] = piece
        piece.pos = end_pos #update to new position
    end

    def show(pos, *selected) #pos is cursor's position
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

            if i == pos[0] #adds red square to where the player's cursor is 
                colored[pos[1]] = (row[pos[1]].to_s + " ").colorize(:background => :red)
            end

            if selected #adds a green square to where the player previously selected
                if i == selected[0] 
                    colored[selected[1]] = (row[selected[1]].to_s + " ").colorize(:background => :green)
                end
            end

            puts "#{i} #{colored[0]}#{colored[1]}#{colored[2]}#{colored[3]}#{colored[4]}#{colored[5]}#{colored[6]}#{colored[7]}"
        end
    end

    def empty?(pos)
        self[pos].is_a?(NullPiece)
    end

    def find_king(color)
        king_pos = pieces.find { |p| p.color == color && p.is_a?(King) }
        king_pos || (raise 'king not found?')
    end

    def pieces
        @board.flatten.reject(&:empty?)
    end

    def in_check?(color)
        king_pos = find_king(color).pos #find the same color king's position
        pieces.any? do |piece|
            piece.color != color && piece.moves.include?(king_pos) #check all other pieces that aren't the color and return true if equal to king's position
        end
    end

    def checkmate?(color)
        return false unless in_check?(color)
    
        pieces.select { |p| p.color == color }.all? do |piece|
            piece.valid_moves.empty?
        end
    end

    def game_over?
        (checkmate?(:black) || checkmate?(:white)) ? true : false
    end
end