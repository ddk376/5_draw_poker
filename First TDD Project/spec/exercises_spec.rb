require 'exercises'

describe Array do
  describe "#my_uniq" do
    it "removes duplicates from an Array" do
      expect([1, 1, 2, 3].my_uniq).to eq([1, 2, 3])
    end

    it "returns unique elements in the order they appeared" do
      expect([3, 3, 2, 1].my_uniq).to eq([3, 2, 1])
    end

  end

  describe "#two_sum" do
    it "ordering matters" do
      expect([-1, 0, 2, -2, 1].two_sum).not_to eq([[2, 3], [0, 4]])
    end

    it "finds all pairs wehre elements at the positions add to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

  end

  describe "#my_transpose" do
    let(:row) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }
    let(:result) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]}
    it " convert between the row-oriented and column-oriented positions" do
      expect(row.my_transpose).to eq(result)
    end
  end

  describe "#stockpicker" do
    it "return most profitable days" do
      expect([2,1,3,5,6,8,4,4].stockpicker).to eq([1,5])
    end
  end

end


describe Hanoi do
  let(:hanoi) { Hanoi.new }
  let(:hanoi1) { [[3,2],[1],[]] }

  describe "#initialize" do
    it 'initializes a 2d array of length 3' do
       expect(hanoi.towers).to eq([[3,2,1],[],[]])
    end
  end

  describe "#move_piece" do
    before(:each) do
      hanoi.move_piece(0,1)
    end
    it "executes the move" do
      expect(hanoi.towers).to eq(hanoi1)
    end
  end

  describe "#valid_move?" do
    it "checks valid move" do
      allow(hanoi).to receive(:towers).and_return([[3,2],[1],[]])
      expect(hanoi.valid_move?(0,2)).to eq(true)
      expect(hanoi.valid_move?(0,1)).to eq(false)
    end
  end



  describe "#win?" do

    it "checks if the game is not won when there's still elements in the first tower" do
      allow(hanoi).to receive(:towers).and_return([[1],[3,2],[]])
      expect(hanoi.win?).to eq(false)
    end


    it "checks the game is won" do
      allow(hanoi).to receive(:towers).and_return([[],[3,2,1],[]])
      expect(hanoi.win?).to eq(true)
    end
  end

end
