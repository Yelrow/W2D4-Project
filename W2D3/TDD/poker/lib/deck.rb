

class Deck
  attr_reader :cards
  
  def initialize
    @cards = create_deck
  end
  
  def shuffle!
    cards.shuffle!
  end
  
  def deal
    cards.pop
  end
  
  private
  
  SUITS = [
    :hearts,
    :spades,
    :clubs,
    :diamonds
  ]
  
  def create_deck
    deck = []
    SUITS.each do |suit|
      (1..13).each do |value|
        deck << Card.new(value, suit)
      end
    end
    deck
  end
end