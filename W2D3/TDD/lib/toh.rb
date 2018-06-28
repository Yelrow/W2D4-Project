require 'byebug'

class TowersOfHanoi
  attr_reader :towers
  
  def initialize
    @towers = [[1,2,3],[],[]]
  end
  
  def valid_move?(start_tower, end_tower)
    return false if towers[start_tower].empty?
    return towers[end_tower].empty? || towers[start_tower].first < towers[end_tower].first
  end
  
  def make_move(start_tower, end_tower)
    # byebug
    if valid_move?(start_tower, end_tower)
      towers[end_tower] << towers[start_tower].shift
    else
      raise RuntimeError.new("Invalid move")
    end
    
  end
  
  def win?
    towers[2].length == 3 || towers[1].length == 3
  end
  
  def get_move
    puts "Enter a starting tower (0,1,2)"
    start = gets.chomp.to_i
    puts "Enter an ending tower"
    ending = gets.chomp.to_i
    [start,ending]
  end
  
  def render
    towers.each do |row|
      puts row.to_s
      puts "\n"
    end
  end
  
  def play
    puts "Welcome to the Towers of Hanoi"
    loop do
      render
      input = get_move
      x, y = input
      make_move(x,y)
      if win?
        puts "Congrats, you won!!!!"
        break
      end
      
    end
  end
    
end

