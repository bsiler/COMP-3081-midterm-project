require_relative '../lib/hand'

RSpec.describe Hand do
  let(:hand) { Hand.new() }
  it "constructs" do
    hand = Hand.new()
  end
  context "when initialized" do
    it "has no cards" do
      expect(hand.cards.size).to eq(0)
    end
  end
end
