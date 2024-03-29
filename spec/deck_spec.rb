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
  end
end
