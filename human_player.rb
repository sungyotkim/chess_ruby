require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

  def make_move(board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      display.render

      if start_pos
        puts "#{color}'s turn. Move to where?"
        end_pos = display.input("#{color}'s turn. Move to where?", *start_pos)

        if end_pos == 'undo' #reset both to deselect and restart since user chose undo
          start_pos = nil 
          end_pos = nil
        end
        display.reset! if end_pos
        display.render
      else
        puts "#{color}'s turn. Move from where?"
        start_pos = display.input("#{color}'s turn. Move from where?")
        start_pos = nil if start_pos == 'undo' #reset start pos if user presses escape since there is no selection to cancel
        display.reset! if start_pos
        display.render(*start_pos)
      end
    end

    [start_pos, end_pos]
  end
end