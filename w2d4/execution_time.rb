require 'byebug'

def my_min(array)
  
  sorted = false
  until sorted
    sorted = true
    array.each_with_index do |el, i|
      break if el == array[-1]
      if array[i] > array[i+1]
        sorted = false
        array[i], array[i+1] = array[i+1], array[i]
      end
    end
  end
  array.first
end

def my_min_more_betterer(array)
  min = nil
  array.each do |el|
    if min.nil? || min > el
      min = el
    end
  end
  min
end

def largest_contiguous_subsum(list)
  count = 1
  array = []
  until count == list.length+1
    array << list.each_cons(count).to_a
    count += 1
  end
  p array.flatten(1).max_by{|x| x.reduce(:+)}.sum
end

def awesome_largest_contiguous_subsum(list)
  sum = 0
  back_counter = list.length - 1
  list.each_with_index do |el, idx|
    range_num = list[idx..back_counter].sum
    sum = range_num if range_num > sum
    list[idx] < list[back_counter] ? next : back_counter -= 1
  end
  sum
end

def terrible_anagram?(first_word, second_word)
  first_word.split("").permutation.to_a.map {|x| x.join}.include?(second_word)
end

def second_anagram?(first_word, second_word)
  # byebug
  first_word_array = first_word.chars
  second_word_array = second_word.chars
  first_word.chars.each_with_index do |ch, idx|
    if second_word_array.include?(ch)
      second_word_array.delete_at(second_word_array.index(ch))
    end
  end
  second_word.chars.each_with_index do |ch, idx|
    if first_word_array.include?(ch)
      first_word_array.delete_at(first_word_array.index(ch))
    end
  end
  
  first_word_array.empty? && second_word_array.empty?
    
end

def third_anagram(first_word, second_word)
  first_word.chars.sort == second_word.chars.sort
end

def fourth_anagram(first_word, second_word)
  hash_one = Hash.new(0)
  hash_two = Hash.new(0)
  first_word.chars {|c| hash_one[c] += 1}
  second_word.chars {|c| hash_two[c] += 1}
  
  hash_one.each do |k,v|
    return false unless hash_two[k] == v
  end
  true
end

def fourth_anagram_one_hash(first_word, second_word)
  hash = Hash.new(0)
  first_word.chars {|c| hash[c] += 1}
  second_word.chars {|c| hash[c] -= 1}
  hash.all?{|k,v| v == 0}
end

def bad_two_sum(array, target)
  array.each_index do |i|
    break if i == array.length - 1
    (i+1...array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
  # time complexity O(n^2)
end

def okay_two_sum?(array, target)
  array.sort!
  back_idx = array.length - 1
  array.each_index do |front_idx|
    sum = array[front_idx] + array[back_idx]
    case sum <=> target
    when 1 
      back_idx -=1
    when 0
      return true
    end
  end
  false
end

def super_sweet_two_sum?(array, target)
  # byebug
  hash = Hash.new(0)
  array.each do |el|
    comp = target - el
    return true if hash[el] > 0
    hash[comp] += 1
  end
  return false
end

arr = [0, 1, 5, 7]
puts super_sweet_two_sum?(arr, 10)


  
  
  
  
  
  