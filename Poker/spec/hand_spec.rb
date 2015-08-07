require 'hand'
require 'card'

describe Hand do

  let(:royal_flush) {Hand.new([Card.new(:hearts, :ace), Card.new(:hearts, :king),
    Card.new(:hearts, :queen), Card.new(:hearts, :jack), Card.new(:hearts, :ten)])}
  let(:straight_flush) {Hand.new([Card.new(:spades, :eight), Card.new(:spades, :seven),
    Card.new(:spades, :six), Card.new(:spades, :five), Card.new(:spades, :four)])}
  let(:four_of_a_kind) {Hand.new([Card.new(:diamonds, :five), Card.new(:clubs, :five),
    Card.new(:spades, :five), Card.new(:hearts, :five), Card.new(:hearts, :three)])}
  let(:full_house) {Hand.new([Card.new(:hearts, :king), Card.new(:diamonds, :king),
    Card.new(:spades, :king), Card.new(:hearts, :five), Card.new(:clubs, :five)])}
  let(:flush) {Hand.new([Card.new(:spades, :king), Card.new(:spades, :jack),
    Card.new(:spades, :nine), Card.new(:spades, :seven), Card.new(:spades, :three)])}
  let(:straight) {Hand.new([Card.new(:spades, :queen), Card.new(:diamonds, :jack),
    Card.new(:clubs, :ten), Card.new(:spades, :nine), Card.new(:hearts, :eight)])}
  let(:three_of_a_kind) {Hand.new([Card.new(:spades, :queen), Card.new(:hearts, :queen),
    Card.new(:diamonds, :queen), Card.new(:spades, :five), Card.new(:clubs, :nine)])}
  let(:two_pair) {Hand.new([Card.new(:hearts, :king), Card.new(:spades, :king),
    Card.new(:clubs, :jack), Card.new(:diamonds, :jack), Card.new(:diamonds, :nine)])}
  let(:one_pair) {Hand.new([Card.new(:clubs, :ace), Card.new(:diamonds, :ace),
    Card.new(:hearts, :nine), Card.new(:spades, :six), Card.new(:diamonds, :four)])}
  let(:high_card) {Hand.new([Card.new(:diamonds, :ace), Card.new(:hearts, :seven),
    Card.new(:clubs, :five), Card.new(:diamonds, :three), Card.new(:spades, :deuce)])}

  describe "#is_royal_flush?" do
    it "validates royal flush" do
      expect(royal_flush.is_royal_flush?).to eq(true)
      expect(straight_flush.is_royal_flush?).to eq(false)
      expect(four_of_a_kind.is_royal_flush?).to eq(false)
      expect(full_house.is_royal_flush?).to eq(false)
      expect(flush.is_royal_flush?).to eq(false)
      expect(straight.is_royal_flush?).to eq(false)
      expect(three_of_a_kind.is_royal_flush?).to eq(false)
      expect(two_pair.is_royal_flush?).to eq(false)
      expect(one_pair.is_royal_flush?).to eq(false)
      expect(high_card.is_royal_flush?).to eq(false)
    end

  end

  describe "#is_straight_flush?" do
    it "validates straight flush" do
      expect(royal_flush.is_straight_flush?).to eq(false)
      expect(straight_flush.is_straight_flush?).to eq(true)
      expect(four_of_a_kind.is_straight_flush?).to eq(false)
      expect(full_house.is_straight_flush?).to eq(false)
      expect(flush.is_straight_flush?).to eq(false)
      expect(straight.is_straight_flush?).to eq(false)
      expect(three_of_a_kind.is_straight_flush?).to eq(false)
      expect(two_pair.is_straight_flush?).to eq(false)
      expect(one_pair.is_straight_flush?).to eq(false)
      expect(high_card.is_straight_flush?).to eq(false)
    end
  end

  describe "#is_4_of_a_kind?" do
    it "validates 4 of a kind" do
      expect(royal_flush.is_4_of_a_kind?).to eq(false)
      expect(straight_flush.is_4_of_a_kind?).to eq(false)
      expect(four_of_a_kind.is_4_of_a_kind?).to eq(true)
      expect(full_house.is_4_of_a_kind?).to eq(false)
      expect(flush.is_4_of_a_kind?).to eq(false)
      expect(straight.is_4_of_a_kind?).to eq(false)
      expect(three_of_a_kind.is_4_of_a_kind?).to eq(false)
      expect(two_pair.is_4_of_a_kind?).to eq(false)
      expect(one_pair.is_4_of_a_kind?).to eq(false)
      expect(high_card.is_4_of_a_kind?).to eq(false)
    end
  end

  describe "#is_full_house?" do
    it "validates full house" do
      expect(royal_flush.is_full_house?).to eq(false)
      expect(straight_flush.is_full_house?).to eq(false)
      expect(four_of_a_kind.is_full_house?).to eq(false)
      expect(full_house.is_full_house?).to eq(true)
      expect(flush.is_full_house?).to eq(false)
      expect(straight.is_full_house?).to eq(false)
      expect(three_of_a_kind.is_full_house?).to eq(false)
      expect(two_pair.is_full_house?).to eq(false)
      expect(one_pair.is_full_house?).to eq(false)
      expect(high_card.is_full_house?).to eq(false)
    end
  end

  describe "#is_flush?" do
    it "validates flush" do
      expect(royal_flush.is_flush?).to eq(false)
      expect(straight_flush.is_flush?).to eq(false)
      expect(four_of_a_kind.is_flush?).to eq(false)
      expect(full_house.is_flush?).to eq(false)
      expect(flush.is_flush?).to eq(true)
      expect(straight.is_flush?).to eq(false)
      expect(three_of_a_kind.is_flush?).to eq(false)
      expect(two_pair.is_flush?).to eq(false)
      expect(one_pair.is_flush?).to eq(false)
      expect(high_card.is_flush?).to eq(false)
    end
  end

  describe "#is_straight?" do
    it "validates straight" do
      expect(royal_flush.is_straight?).to eq(false)
      expect(straight_flush.is_straight?).to eq(false)
      expect(four_of_a_kind.is_straight?).to eq(false)
      expect(full_house.is_straight?).to eq(false)
      expect(flush.is_straight?).to eq(false)
      expect(straight.is_straight?).to eq(true)
      expect(three_of_a_kind.is_straight?).to eq(false)
      expect(two_pair.is_straight?).to eq(false)
      expect(one_pair.is_straight?).to eq(false)
      expect(high_card.is_straight?).to eq(false)
    end
  end

  describe "#is_3_of_a_kind?" do
    it "validates 3 of a kind" do
      expect(royal_flush.is_3_of_a_kind?).to eq(false)
      expect(straight_flush.is_3_of_a_kind?).to eq(false)
      expect(four_of_a_kind.is_3_of_a_kind?).to eq(false)
      expect(full_house.is_3_of_a_kind?).to eq(false)
      expect(flush.is_3_of_a_kind?).to eq(false)
      expect(straight.is_3_of_a_kind?).to eq(false)
      expect(three_of_a_kind.is_3_of_a_kind?).to eq(true)
      expect(two_pair.is_3_of_a_kind?).to eq(false)
      expect(one_pair.is_3_of_a_kind?).to eq(false)
      expect(high_card.is_3_of_a_kind?).to eq(false)
    end
  end

  describe "#is_2_pairs?" do
    it "validates 2 pairs" do
      expect(royal_flush.is_2_pairs?).to eq(false)
      expect(straight_flush.is_2_pairs?).to eq(false)
      expect(four_of_a_kind.is_2_pairs?).to eq(false)
      expect(full_house.is_2_pairs?).to eq(false)
      expect(flush.is_2_pairs?).to eq(false)
      expect(straight.is_2_pairs?).to eq(false)
      expect(three_of_a_kind.is_2_pairs?).to eq(false)
      expect(two_pair.is_2_pairs?).to eq(true)
      expect(one_pair.is_2_pairs?).to eq(false)
      expect(high_card.is_2_pairs?).to eq(false)
    end
  end

  describe "#is_1_pair?" do
    it "validates 1 pair" do
      expect(royal_flush.is_1_pair?).to eq(false)
      expect(straight_flush.is_1_pair?).to eq(false)
      expect(four_of_a_kind.is_1_pair?).to eq(false)
      expect(full_house.is_1_pair?).to eq(false)
      expect(flush.is_1_pair?).to eq(false)
      expect(straight.is_1_pair?).to eq(false)
      expect(three_of_a_kind.is_1_pair?).to eq(false)
      expect(two_pair.is_1_pair?).to eq(false)
      expect(one_pair.is_1_pair?).to eq(true)
      expect(high_card.is_1_pair?).to eq(false)
    end
  end

  describe "#is_high_card?" do
    it "validates high card" do
      expect(royal_flush.is_high_card?).to eq(false)
      expect(straight_flush.is_high_card?).to eq(false)
      expect(four_of_a_kind.is_high_card?).to eq(false)
      expect(full_house.is_high_card?).to eq(false)
      expect(flush.is_high_card?).to eq(false)
      expect(straight.is_high_card?).to eq(false)
      expect(three_of_a_kind.is_high_card?).to eq(false)
      expect(two_pair.is_high_card?).to eq(false)
      expect(one_pair.is_high_card?).to eq(false)
      expect(high_card.is_high_card?).to eq(true)
    end
  end
end
