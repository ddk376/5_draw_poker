require_relative 'card'
require 'byebug'
class Hand

  ROYAL_VALUES = [:ace, :king, :queen, :jack, :ten]
  NUM_OF_CARDS = 5
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    deck.take(5)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
  end

  def busted?
  end

  def hit(deck)
  end

  def beats?(other_hand)
  end

  def return_cards(deck)
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end

  def is_royal_flush?
    suits = self.cards.map {|card| card.suit}
    return true if self.cards.all? {|card| ROYAL_VALUES.include?(card.value)} &&
      suits.uniq.length == 1
    false
  end

  def is_straight_flush?
    #anyorder
    suits = self.cards.map {|card| card.suit}
    values = self.cards.map {|card| card.value }
    return true if suits.uniq.length == 1 && is_sequence? && !is_royal_flush?
    false
  end

  def is_4_of_a_kind?
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    return true if hand_values.any?{|key, value| value == 4}
    false
  end

  def is_full_house?
    #three mathcing cards, two mathcing cards
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    return true if hand_values.any?{|key, value| value == 3} &&
    hand_values.any?{|key, value| value == 2}
    false
  end

  def is_flush?
    #all same suit but no in order
    suits = self.cards.map {|card| card.suit}
    return true if suits.uniq.length == 1 && !is_sequence?
    false
  end

  def is_straight?
    #in order but not same suit
    suits = self.cards.map {|card| card.suit}
    return true if suits.uniq.length > 1 && is_sequence?
    false
  end

  def is_3_of_a_kind?
    #three same, two different
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    keys_with_value_of_one = hand_values.select {|key, value| value == 1}
    return true if hand_values.any?{|key, value| value == 3} &&
    hand_values.length == 3 && keys_with_value_of_one.length == 2
    false
  end

  def is_2_pairs?
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    keys_with_value_of_two = hand_values.select {|key, value| value == 2}
    return true if hand_values.length == 3 && keys_with_value_of_two.length == 2
    false
  end

  def is_1_pair?
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    keys_with_value_of_two = hand_values.select {|key, value| value == 2}
    return true if hand_values.length == 4 && keys_with_value_of_two.length == 1
    false
  end

  def is_high_card?
    # NOT IN SEQUENCE
    suits = self.cards.map {|card| card.suit}
    values = self.cards.map {|card| card.value }
    hand_values = Hash.new{|hash, key| hash[key] = 0}
    values.each { |card| hand_values[card] += 1 }
    return true if hand_values.length == 5 && suits.uniq.length == 4 && !is_sequence?
    false
  end

  def is_sequence?
    # debugger
    arr = Card.values
    values = cards.map {|el| Card::CARD_VALUE[el.value] }
    values.bubble_sort!{ |num1, num2| num1 <=> num2 }
    values = values.map {|el| Card::CARD_VALUE.invert[el]}
    until values.first == arr.first
      arr = arr.rotate
    end
    NUM_OF_CARDS.times do
      return false if values.first != arr.first
      values.rotate!
      arr = arr.rotate
    end
    true
  end

end

class Array

  def bubble_sort!(&prc)
    prc ||= Proc.new{ |num1, num2| num1 <=> num2 }
    sorted = false
    until sorted
      sorted = true
      self.length.times do |idx|
        break if idx == (length - 1)
        if prc.call(self[idx], self[idx + 1]) == 1
          self[idx], self[idx + 1] = self[idx + 1], self[idx]
          sorted = false
        end
      end
    end
    self
  end

  def bubble_sort &prc
    arr = self.dup
    arr.bubble_sort!(&prc)
  end

end
