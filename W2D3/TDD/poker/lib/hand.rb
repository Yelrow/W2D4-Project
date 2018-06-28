require 'byebug'

class Hand
  attr_reader :cards
  
  def initialize(card_array)
    @cards = card_array
  end
  
  def hand_strength
    case 
    when royal_flush? 
      return :royal_flush
    when straight_flush? 
      return :straight_flush
    when four_of_a_kind?
      return :four_of_a_kind
    when full_house?
      return :full_house
    when flush? 
      return :flush
    when straight? 
      return :straight
    when three_of_a_kind?
      return :three_of_a_kind 
    when two_pair?
      return :two_pair
    when pair?
      return :pair
    else
      return :high_card
    end
  end
  
  private 
  
  def straight?
    dup_cards = cards.dup
    dup_cards.sort_by! {|card| card.value}
    return false unless dup_cards.uniq.length == cards.length
    k = 0
    while k < dup_cards.length - 1
      return false unless dup_cards[k + 1].value - dup_cards[k].value == 1
    end
    true
    
    
  end
  
  def royal_flush?
    cards.each {|card| return false if card.value.between?(2,9)}
    flush?
  end
  
  def straight_flush?
    flush? && straight?
  end
  
  def four_of_a_kind?
    # byebug
    helper_hash = duplicate_check
    helper_hash.each_value {|v| return true if v == 4}
    false
  end
  
  def full_house?
    helper_hash = duplicate_check
    helper_hash.each_value {|v| return false unless v == 2 || v == 3}
    true
  end
  
  def flush?
    cards.all? {|card| card.suit == cards[0].suit} 
    
  end
  
  def duplicate_check
    helper_hash = Hash.new(0)
    cards.each {|card| helper_hash[card.value] += 1}
    helper_hash
  end
  

  
  POKER_VALUES = {
    :high_card => 1,
    :pair => 2,
    :two_pair => 3,
    :three_of_a_kind => 4,
    :straight => 5, 
    :flush => 6,
    :full_house => 7,
    :four_of_a_kind => 8,
    :straight_flush => 9,
    :royal_flush => 10 
  }
  
end