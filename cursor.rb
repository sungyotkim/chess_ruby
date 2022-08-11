require "io/console"

KEYMAP = {
    " " => :space,
    "h" => :left,
    "j" => :down,
    "k" => :up,
    "l" => :right,
    "w" => :up,
    "a" => :left,
    "s" => :down,
    "d" => :right,
    "\t" => :tab,
    "\r" => :return,
    "\n" => :newline,
    "\e" => :escape,
    "\e[A" => :up,
    "\e[B" => :down,
    "\e[C" => :right,
    "\e[D" => :left,
    "\177" => :backspace,
    "\004" => :delete,
    "\u0003" => :ctrl_c,
}

MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
}

class Cursor

    attr_reader :cursor_pos, :board
    attr_accessor :selected

    def initialize(cursor_pos, board) 
        @cursor_pos = cursor_pos
        @board = board
    end

    def get_input
        key = KEYMAP[read_char] #show up/down
        handle_key(key)
    end

    private

    def read_char
        STDIN.echo = false # stops the console from printing return values

        STDIN.raw! # in raw mode data is given as is to the program--the system
                    # doesn't preprocess special characters such as control-c

        input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                                # numeric keycode. chr returns a string of the
                                # character represented by the keycode.
                                # (e.g. 65.chr => "A")

    if input == "\e" then
        input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                    # at most maxlen bytes from a
                                                    # data stream; it's nonblocking,
                                                    # meaning the method executes
                                                    # asynchronously; it raises an
                                                    # error if no data is available,
                                                    # hence the need for rescue

        input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
    end

    #need to add to the below two methods

    def handle_key(key)
        case key
        when :return, :space
            return @cursor_pos #want updated position once user pressed return/space
        when :left
            self.update_pos(:left) 
            return nil #no need to save position as user is likely selecting a space still
        when :right
            self.update_pos(:right)
            return nil
        when :up
            self.update_pos(:up)
            return nil
        when :down
            self.update_pos(:down)
            return nil
        when :ctrl_c
            Process.exit(0) #exit the game
        end
    end

    def update_pos(diff)
        x = @cursor_pos[0] + MOVES[diff][0]
        y = @cursor_pos[1] + MOVES[diff][1]
        if self.board.valid_pos?([x,y]) #check to see if this position is in the board
            @cursor_pos = [x, y] #if so, update
        else
            false #do not update
        end
    end

end