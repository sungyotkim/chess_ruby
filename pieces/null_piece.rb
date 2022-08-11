require "./piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :symbol

    def initialize
        @symbol = ' '
        @color = :none
    end

    def to_s
        @symbol
    end

    def moves
        []
    end
end