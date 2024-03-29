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
    end
  end
  describe ".determine_strength" do
    context "when a flush" do
      it "returns flush" do
        flush = Hand.new()
        flush.cards << Card.new(5, "Hearts")
        flush.cards << Card.new(8, "Hearts")
        flush.cards << Card.new(1, "Hearts")
        flush.cards << Card.new(3, "Hearts")
        flush.cards << Card.new(4, "Hearts")
        expect(flush.determine_strength).to eq("Flush")
      end
    end
    context "when a straight" do
      it "returns straight" do
        straight = Hand.new()
        straight.cards << Card.new(5, "Hearts")
        straight.cards << Card.new(6, "Hearts")
        straight.cards << Card.new(7, "Hearts")
        straight.cards << Card.new(8, "Hearts")
        straight.cards << Card.new(9, "Clubs")
        expect(straight.determine_strength).to eq("Straight")
      end
    end
  end
  describe ".same_suit" do
    it "returns true with two cards of same suit" do
      expect(hand.same_suit([Card.new(1,"Clubs"), Card.new(8,"Clubs")])).to eq(true)
    end
    it "returns false with two cards not of same suit" do
      expect(hand.same_suit([Card.new(1,"Clubs"), Card.new(8,"Hearts")])).to eq(false)
    end
  end
end
