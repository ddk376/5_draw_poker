class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el if !result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    self.length.times do |idx1|
      ((idx1 + 1)...self.length).each do |idx2|
         result << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    result
  end


  def my_transpose
    dup_arr = Array.new(self[0].length) { Array.new(self.length) }
    length.times do |row|
      self[0].length.times do |col|
        dup_arr[col][row] = self[row][col]
      end
    end

    dup_arr
  end

  def stockpicker
    max = 0
    return_arr = []
    self.length.times do |idx1|
      ((idx1 + 1)...self.length).each do |idx2|
        if self[idx2] - self[idx1] > max
          max = self[idx2] - self[idx1]
          return_arr = [idx1, idx2]
        end
      end
    end
    return_arr

  end


end

class Hanoi

  attr_accessor :towers
  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def valid_move?(from, to)
     piece = towers[from].last
     if piece != nil && (towers[to].last == nil || piece < towers[to].last)
         return true
     end
     return false
   end

   def move_piece(from, to)
     piece = towers[from].pop
     towers[to].push(piece)
   end

  def win?
    if towers[1].length == 3 ||towers[2].length == 3
      return true
    else
      false
    end
  end

end
