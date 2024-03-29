class Hand
  attr_accessor :cards
  def initialize()
    @cards = []
  end
  def determine_strength()
    same_suit = true
    suit = @cards[0].suit
    @cards.each do |card|
      if card.suit != suit
        same_suit = false
      end
    end
    if same_suit
      return "Flush"
    else
      return "Not Flush"
    end
  end
end
