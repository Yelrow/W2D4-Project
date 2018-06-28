require "toh"

RSpec.describe TowersOfHanoi do
  subject(:toh) { TowersOfHanoi.new }
  
  describe "#initialize" do
    it "Creates a tower variable with value[[1,2,3],[],[]]" do
      expect(toh.towers).to match_array([[1,2,3],[],[]])
    end
    
  end
  
  describe "#valid_move?" do
    it "Return true if the move is valid" do
      expect(toh.valid_move?(0,1)).to be_truthy
    end
  end
  
  describe "#make_move" do 
    
    it "Should move a disk if it is a valid move" do
      toh.make_move(0,1)
      expect(toh.towers[1]).to eq([1])
    end
    
    it "Should raise RuntimeError if move is invalid" do
      toh.make_move(0,1)
      expect { toh.make_move(0,1) }.to raise_error(RuntimeError)
      
    end
  end
  
  describe "#win" do
    it "Correctly tests if the towers are in a winning formation" do
      toh.make_move(0,1)
      toh.make_move(0,2)
      toh.make_move(1,2)
      toh.make_move(0,1)
      toh.make_move(2,0)
      toh.make_move(2,1)
      toh.make_move(0,1)
      expect(toh.win?).to be_truthy
    end
  end
  
  describe "#get_move" do
    it "should get valid input" do 
      expect(toh.get_move).to be_instance_of(Array)
    end
  end
  
  #TowersOfHanoi.play tested w/ end-to-end testing
end