require_relative '../lib/hand'
require 'pp'
RSpec.describe Hand do
  let(:empty_hand) { Hand.new() }
  let(:basic_straight_flush_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(6, "Hearts"),
    Card.new(7, "Hearts"),
    Card.new(8, "Hearts"),
    Card.new(9, "Hearts")
  ])}
  let(:full_house_hand) { Hand.new([
    Card.new(5, "Hearts"),
    Card.new(5, "Clubs"),
    Card.new(5, "Spades"),
    Card.new(8, "Hearts"),
    Card.new(8, "Spades")
  ])}
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
  let(:three_of_a_kind_hand) { Hand.new([
    Card.new(1, "Hearts"),
    Card.new(2, "Clubs"),
    Card.new(5, "Diamonds"),
    Card.new(5, "Spades"),
    Card.new(5, "Hearts")
  ])}
  let(:two_pair_hand) { Hand.new([
    Card.new(1, "Hearts"),
    Card.new(1, "Clubs"),
    Card.new(5, "Diamonds"),
    Card.new(5, "Spades"),
    Card.new(9, "Hearts")
  ])}
  let(:one_pair_hand) { Hand.new([
    Card.new(1, "Hearts"),
    Card.new(2, "Clubs"),
    Card.new(5, "Diamonds"),
    Card.new(5, "Spades"),
    Card.new(9, "Hearts")
  ])}
  let(:high_card_hand) { Hand.new([
    Card.new(1, "Hearts"),
    Card.new(2, "Clubs"),
    Card.new(8, "Diamonds"),
    Card.new(4, "Spades"),
    Card.new(12, "Hearts")
  ])}
  let(:high_card_hand_no_ace) { Hand.new([
    Card.new(2, "Hearts"),
    Card.new(3, "Clubs"),
    Card.new(8, "Diamonds"),
    Card.new(4, "Spades"),
    Card.new(12, "Hearts")
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
  describe "#determine_strength" do
    context "when a straight flush" do
      it "returns straight flush" do
        expect(basic_straight_flush_hand.determine_strength).to eq("Straight Flush")
      end
    end
    context "when four of a kind" do
      it "returns four of a kind" do
        expect(four_of_a_kind_hand.determine_strength).to eq("Four of a Kind")
      end
    end
    context "when a full house" do
      it "returns full house" do
        expect(full_house_hand.determine_strength).to eq("Full House")
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
    context "when three of a kind" do
      it "returns three of a kind" do
        expect(three_of_a_kind_hand.determine_strength).to eq("Three of a Kind")
      end
    end
    context "when two pair" do
      it "returns two pair" do
        expect(two_pair_hand.determine_strength).to eq("Two Pair")
      end
    end
    context "when one pair" do
      it "returns one pair" do
        expect(one_pair_hand.determine_strength).to eq("One Pair")
      end
    end
    context "when high card" do
      it "returns high card" do
        expect(high_card_hand.determine_strength).to eq("High Card")
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
  describe ".beats?" do
    it "pair beats high card" do
      expect(one_pair_hand.beats?(high_card_hand)).to eq(true)
    end
    it "straight does not beat flush" do
      expect(basic_straight_hand.beats?(flush_hand)).to eq(false)
    end
    it "highest card wins if tie" do
      expect(high_card_hand.beats?(high_card_hand_no_ace)).to eq(true)
    end
  end
end
