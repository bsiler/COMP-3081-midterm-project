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
  describe ".determine_strength" do
    it "can determine flush" do
      flush = Hand.new()
      flush.cards << Card.new(5, "Hearts")
      flush.cards << Card.new(8, "Hearts")
      flush.cards << Card.new(1, "Hearts")
      flush.cards << Card.new(3, "Hearts")
      flush.cards << Card.new(4, "Hearts")
      expect(flush.determine_strength).to eq("Flush")
    end
  end
end
