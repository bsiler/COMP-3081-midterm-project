require_relative '../lib/hand'
require 'pp'
RSpec.describe Hand do
  let(:empty_hand) { Hand.new() }
  let(:flush_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(8, "Hearts"),
    Card.new(1, "Hearts"),
    Card.new(3, "Hearts"),
    Card.new(4, "Hearts")
  ]) }
  let(:basic_straight_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(6, "Hearts"),
    Card.new(7, "Hearts"),
    Card.new(8, "Hearts"),
    Card.new(9, "Clubs")
  ])}
  let(:basic_straight_flush_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(6, "Hearts"),
    Card.new(7, "Hearts"),
    Card.new(8, "Hearts"),
    Card.new(9, "Hearts")
  ])}
  let(:ace_straight_hand) { Hand.new([
    Card.new(10, "Hearts"),
    Card.new(11, "Hearts"),
    Card.new(12, "Hearts"),
    Card.new(13, "Clubs"),
    Card.new(1, "Hearts"),
  ])}
  let(:four_of_a_kind_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(5, "Clubs"),
    Card.new(5, "Diamonds"),
    Card.new(5, "Spades"),
    Card.new(6, "Hearts")
  ])}
  it "constructs" do
    hand = Hand.new()
  end
  context "initialized" do
    context "empty" do
      let(:hand) { Hand.new() }
      it "has no cards" do
        expect(empty_hand.cards.size).to eq(0)
      end
      it "can receive a new card" do
        hand.cards << Card.new(7, "Hearts")
        expect(hand.cards.size).to eq(1)
      end
    end
    context "with cards" do
      it "contains cards" do
        hand = Hand.new([Card.new(7, "Hearts"),
                    Card.new(8, "Hearts"),
                    Card.new(9, "Hearts"),
                    Card.new(10, "Hearts"),
                    Card.new(11, "Hearts")])
        expect(hand.cards.size).to eq(5)
      end
    end
  end
  describe ".determine_strength" do
    context "when a straight flush" do
      it "returns straight flush" do
        expect(basic_straight_flush_hand.determine_strength).to eq("Straight Flush")
      end
    end
    context "when a flush" do
      it "returns flush" do
        expect(flush_hand.determine_strength).to eq("Flush")
      end
    end
    context "when a straight" do
      context "with an ace" do
        it "returns straight" do
          expect(ace_straight_hand.determine_strength).to eq("Straight")
        end
      end
      it "returns straight" do
        expect(basic_straight_hand.determine_strength).to eq("Straight")
      end
    end

    context "when four of a kind" do
      it "returns four of a kind" do
        expect(four_of_a_kind_hand.determine_strength).to eq("Four of a Kind")
      end
    end
  end
  describe ".same_suit" do
    it "returns true with two cards of same suit" do
      expect(empty_hand.same_suit([Card.new(1,"Clubs"), Card.new(8,"Clubs")])).to eq(true)
    end
    it "returns false with two cards not of same suit" do
      expect(empty_hand.same_suit([Card.new(1,"Clubs"), Card.new(8,"Hearts")])).to eq(false)
    end
  end
end
