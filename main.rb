#testing file

require_relative 'board.rb'

b = Board.new
b.move_piece!([6,6], [4,6])
# b.move_piece([6,5], [5,5])
# b.move_piece([1,4], [3,4])
# b.move_piece([0,3], [4,7])
b.show([0,0])
d = b.dup
p d.class
# d.show([0,0])
# # p d[[1,0]]
# d.move_piece!([1,0], [2,0])
# d.show([0,0])
# puts d.pieces
# p b.pieces[39].moves
# puts b.pieces[60]
# p b.pieces[60].pos
# p b.pieces[60].valid_moves
# p b.in_check?(:white)
# p b.checkmate?(:white)
# puts b.move_piece([1,0], [2,0])