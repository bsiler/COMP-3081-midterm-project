class Hand
  attr_accessor :cards
  def initialize()
    @cards = []
  end
  def determine_strength()
    if same_suit(@cards)
      return "Flush"
    end
  end
  def same_suit(cards)
    same_suit = true
    suit = cards[0].suit
    cards.each do |card|
      if card.suit != suit
        same_suit = false
      end
    end
    return same_suit
  end
end
