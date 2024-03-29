require 'Card'
require 'pp'
class Deck
  attr_reader :cards
  def initialize()
    @cards = []
    suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
    suits.each do |suit|
      (1..13).each do |value|
        @cards << Card.new(value, suit)
      end
    end
  end
end
