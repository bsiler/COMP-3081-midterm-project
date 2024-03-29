require_relative '../lib/hand'
require 'pp'
RSpec.describe Hand do
  let(:hand) { Hand.new() }
  it "constructs" do
    hand = Hand.new()
  end
  context "when initialized" do
    it "has no cards" do
      expect(hand.cards.size).to eq(0)
    end
    it "can receive a new card" do
      hand.cards << Card.new(7, "Hearts")
      expect(hand.cards.size).to eq(1)
      pp hand.cards
    end
  end
end
