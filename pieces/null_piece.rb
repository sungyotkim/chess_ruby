require "./piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
        @symbol = ' '
    end

    def to_s
        @symbol
    end

    def moves
        []
    end
end