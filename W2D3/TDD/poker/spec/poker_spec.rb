require "card"
require "deck"
require "hand"

RSpec.describe Card do
  
  describe "#initialize" do
    it "Creates a card with a value" do
      card = Card.new(3, :hearts)
      expect(card.value).to eq(3)
      
    end
    
    it "Creates a card with a suit" do
      card = Card.new("3", :hearts)
      expect(card.suit).to eq(:hearts)
    end
  end
  
end

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  
  describe "#initialize" do
    it "Creates a deck of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
    
    it "Creates 52 unique cards" do 
      expect(deck.cards.uniq).to match_array(deck.cards)
    end
  end
  
  describe "#shuffle" do 
    it "Shuffles deck" do 
      dup_deck = deck.dup
      expect(deck.shuffle!).to_not match_array(dup_deck)
      end
    end
    
  describe "#deal" do
    it "Removes a card from the top of the deck" do
      deck.deal
      expect(deck.cards.length).to eq(51)
    end
    
    it "Returns a card from the top of the deck" do
      hand = deck.deal
      expect(hand).to be_instance_of(Card)
    end
  end
end

RSpec.describe Hand do
    let (:card_a) {Card.new(8, :diamonds)}
    let (:card_b) {Card.new(9, :diamonds)}
    let (:card_c) {Card.new(10, :diamonds)}
    let (:card_d) {Card.new(11, :diamonds)} 
    let (:card_e) {Card.new(12, :diamonds)}
    let (:cards) { [] } 
    
    before(:each) do
      cards << card_a
      cards << card_b
      cards << card_c
      cards << card_d
      cards << card_e
    end
    subject(:hand) {Hand.new(cards)}  

  describe "#initialize" do
    it "Creates an array of cards provided" do
      
      
      expect(hand.cards.length).to eq(5)
    end
  end
  
  describe "#hand_strength" do
    # it "Correctly identifies royal flush" do
    #   expect(hand.hand_strength).to eq(:royal_flush)
    # end
    
    it "Correctly identifies straight flush" do 
      expect(hand.hand_strength).to eq(:straight_flush)
    end
    
    # it "Correctly identifies four of a kind" do 
    #   expect(hand.hand_strength).to eq(:four_of_a_kind)
    # end
    
    # it "Correctly identifies full house" do 
    #   expect(hand.hand_strength).to eq(:full_house)
    # end
    
    # it "Correctly identifies fa flush" do 
    #   expect(hand.hand_strength).to eq(:flush)
    # end
  end
  
end

