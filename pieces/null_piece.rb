require "./piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    
    def initialize
        @symbol = ' '
    end

    def to_s
        @symbol
    end
end