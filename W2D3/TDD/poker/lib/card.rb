

class Card
  attr_reader :value, :suit
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end
  
  def to_s
    "#{value} of #{suit}"
  end
  
  def ==(card)
    return self.value == card.value && self.suit == card.suit
  end
end