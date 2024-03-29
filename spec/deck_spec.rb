require_relative '../lib/deck'
require_relative '../lib/card'

RSpec.describe Deck do
  let(:deck) { Deck.new() }
  it "constructs" do
    deck = Deck.new()
  end
  context "when initialized" do
    it "has cards" do
      deck.cards
    end
    it "has 52 cards" do
      expect(deck.cards.size).to eq(52)
    end
  end
  describe ".shuffle" do
    it "changes cards from initial order" do
      shuffle_deck = Deck.new()
      shuffle_deck.shuffle()
      expect(deck).to_not eq(shuffle_deck)
    end
  end
end
