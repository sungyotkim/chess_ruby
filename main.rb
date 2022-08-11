#testing file

require_relative 'board.rb'

b = Board.new
b.show 
p b[[1,0]].valid_moves