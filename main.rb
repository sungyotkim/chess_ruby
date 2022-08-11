#testing file

require_relative 'board.rb'

b = Board.new
b.show 
p b[[0,1]].valid_moves