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
    # Array to store the card values, since suit is not important
    card_values = []
    @cards.each do |card|
      card_values << card.value
    end

    # For each unique value, check if it has four occurances
    card_values.uniq.each do |value|
      if card_values.tally[value] == 4
        return "Four of a Kind"
      end
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

  # Helper method for is_straight()

  def in_a_row?(values)
    # Use ghost value for imaginary previous card in order to compare with first card
    last_value = values[0] - 1
    values.each do |value|
      if value != last_value + 1
        return false
      end
      last_value = value
    end
    return true
  end

  def is_straight(cards)
    is_straight = true
    # Extract card values
    card_values = []
    @cards.each do |card|
      card_values << card.value
    end

    # Sort cards in ascending order by value
    sorted_card_values = card_values.sort
    # Deal with specific case where an ace is treated as high
    if sorted_card_values == [1, 10, 11, 12, 13]
      return true
    else
      return in_a_row?(sorted_card_values)
    end
  end
end
