require_relative "board.rb"
require_relative "cursor.rb"

class Display
    attr_reader :board, :cursor, :notifications

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @notifications = {}
    end

    def render(*start_pos) 
        system("clear")
        
        pos = self.cursor.cursor_pos #red cursor
        
        if start_pos#if there is an argument, we make a green square to show selected square
            x, y = start_pos 
        end
        
        @board.show(pos, x, y)
        @notifications.each do |_key, val|
            puts val
        end
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

    def reset!
        @notifications.delete(:error)
    end
    
    def uncheck!
        @notifications.delete(:check)
    end
    
    def set_check!
        @notifications[:check] = "Check!"
    end
    
end