require_relative "board.rb"
require_relative "cursor.rb"

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render(*start_pos) 
        system("clear")
        pos = self.cursor.cursor_pos #red cursor
    
        if start_pos#if there is an argument, we make a green square to show selected square
            x, y = start_pos 
        end
    
        @board.show(pos, x, y)
    end
    
    def input(*pos) 
        output = self.cursor.get_input
        if output.nil? #keep looping until they press enter
            self.render(*pos)
            input(*pos) #'recursive' call
        else
            return output
        end
    end
    
    def play
        until @board.game_over?
            self.render
            puts "Please choose your first position"
            start_pos = self.input
            self.render(*start_pos)
            puts "Please choose your second position"
            end_pos = self.input(*start_pos) #until the input method obtains an output(when the player presses enter) end_pos is nil
            self.render #we stop passing in start pos into render to get rid of the green square
            @board.move_piece(start_pos, end_pos)
            puts "white is in check!" if @board.in_check?(:white)
            puts "black is in check!" if @board.in_check?(:black) 
        end
    end
end

d= Display.new(Board.new)
d.play