require "tdd"

RSpec.describe Array do
  
    describe "#my_uniq" do
      it "removes non-unique values in array" do
        example_array = [1,2,3,3,4,5,5,1]
        expect(example_array.my_uniq).to match_array(example_array.uniq)
      end
      
      it "doesn't remove any elements in a unique array" do
        example_array = [1,2,3,4,5]
        expect(example_array.my_uniq).to match_array(example_array)
      end
      
      it "doesn't call built-in uniq method" do
        example_array = [1,2,3,4,5]
        expect(example_array).not_to receive(:uniq)
        example_array.my_uniq
      end
  end
    
  describe "#two_sum" do
    it "sorts indexes from small to big" do
      example_array = [1,-1,3,2,-2,4,2]
      expect(example_array.two_sum).to match_array([[0,1],[3,4],[4,6]])
    end
    
    it "returns an empty array if no two elements sum to zero" do
      example_array = [1,3,5,-2,-4]
      expect(example_array.two_sum).to match_array([])
    end
  end

  describe "#my_transpose" do 
    let (:example_array)  { [[1,2,3], [4,5,6], [7,8,9]] }
    it "doesn't call built in transpose method" do
      expect(example_array).not_to receive(:transpose)
      example_array.my_transpose
      
    end
    
    it "successfully transposes square array" do
      expect(example_array.my_transpose).to match_array(example_array.transpose)
    end
    
    it "successfully transposes non-square array" do
      example_array = [[1,2,3], [4,5,6]]
      expect(example_array.my_transpose).to match_array(example_array.transpose) 
    end
  end

  describe "#pick_days" do
    it "Correctly picks best days to buy and sell stocks" do
        stock_prices = [97.3, 98.0, 95.5, 99.1, 98.5, 98.9, 100.1]
        expect(stock_prices.pick_days).to match_array([2,6])
    end
    
    it "Will return [] if there are no opportunities given" do
      stock_prices = [100.1, 99.8, 99.5, 98.9, 97.7, 96.5]
      expect(stock_prices.pick_days).to match_array([])
    end
  end
end