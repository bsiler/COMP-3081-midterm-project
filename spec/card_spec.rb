require_relative '../lib/card'

RSpec.describe Card do
  it "constructs properly" do
    card = Card.new(7, "Hearts")
  end
end
