class Hand
  attr_accessor :cards
  def initialize(cards = [])
    @cards = cards
  end
  def determine_strength()
    if same_suit(@cards)
      return "Flush"
    end
    if is_straight(@cards)
      return "Straight"
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

  def is_straight(cards)
    is_straight = true
    cards.sort_by {|card| card.value}
    last_value = cards[0].value - 1
    cards.each do |card|
      if card.value != last_value + 1
        is_straight = false
      end
      last_value = card.value
    end
    return is_straight
  end
end
