require_relative '../lib/card'

RSpec.describe Card do
  let(:card) { Card.new(7, "Hearts") }

  it "constructs properly" do
    card = Card.new(7, "Hearts")
  end
  it "can read suit" do
    expect(card.suit).to eq("Hearts")
  end
end
