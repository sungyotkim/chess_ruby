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

    private
    attr_reader :symbol, :color
end