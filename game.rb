# require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'human_player.rb'

class Game
  attr_reader :board, :display, :current_player, :players

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move(board)
        @board.move_piece(current_player, start_pos, end_pos)
        swap_turn!
        notify_players
      rescue StandardError => e
        @display.notifications[:error] = e.message
        retry
      end
    end

    display.render
    puts "#{current_player} is checkmated"
  end

  def swap_turn!
    self.current_player == :white ? @current_player = :black : @current_player = :white
  end

  def notify_players
    if board.in_check?(current_player)
      display.set_check!
    else
      display.uncheck!
    end
  end

end

if $PROGRAM_NAME == __FILE__
  Game.new.play
end
