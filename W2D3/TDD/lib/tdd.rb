require 'byebug'
class Array 
  
  def my_uniq
    answer = []
    self.each {|el| answer << el unless answer.include?(el)}
    answer 
  end
  
  def two_sum
    answer = []
    self.each_index do |idx|
      (idx+1...length).each do |el|
        answer << [idx,el] if self[idx] + self[el] == 0 
      end
    end
    answer 
  end
  
  def my_transpose
    width = self.length
    height = self.first.length
    answer = Array.new(height) {Array.new(width)}
    self.each_with_index do |row, x|
      row.each_with_index do |sq, y|
        answer[y][x] = sq
      end
    end
    answer
  end
  
  def pick_days
    range = 0
    answer = []
    self.each_index do |start_idx|
      (start_idx+1...length).each do |end_idx|
        temp_range = self[end_idx] - self[start_idx]
        if temp_range > range
          range = temp_range
          answer = [start_idx, end_idx]
        end
      end
    end
    answer
  end
end