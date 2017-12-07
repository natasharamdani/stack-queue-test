require_relative '../mymatrix.rb'

describe "MyMatrix" do
  before :each do
    @matrix = MyMatrix.new(2, 3)
  end

  it "should be able to be initialized" do
    expect(@matrix.class.name).to eq("MyMatrix")
  end

  it "should have row" do
    expect(@matrix.row).to eq(2)
  end

  it "should have column" do
    expect(@matrix.column).to eq(3)
  end

  describe "assignment" do
    before :each do
      @matrix = MyMatrix.new(2, 2)
      @matrix[1, 1] = 1
      @matrix[1, 2] = "a"
      @matrix[2, 1] = 2
      @matrix[2, 2] = "b"
    end

    it "can assign an element" do
      expect(@matrix.matrix).to eq([[1, "a"], [2, "b"]])
    end

    it "can access an element" do
      expect(@matrix[1, 2]).to eq("a")
    end
  end

  it "should show the elements when printed, with nil printed as '-'" do
    matrix = MyMatrix.new(2, 2)
    matrix[1, 1] = 1
    matrix[1, 2] = 2
    matrix[2, 1] = 3

    expect(matrix.to_s).to eq("| 1 2 |\n| 3 - |")
  end

  describe "calculation" do
    before :each do
      @matrix = MyMatrix.new(2, 2)
      @matrix[1, 1] = 1
      @matrix[1, 2] = 2
      @matrix[2, 1] = 3
      @matrix[2, 2] = 4
    end

    it "can do scalar multiplication to a matrix" do
      expect(@matrix * 2).to eq([[2, 4], [6, 8]])
    end

    it "can do additions between two matrixes" do
      another_matrix = MyMatrix.new(2, 2)
      another_matrix[1, 1] = 2
      another_matrix[1, 2] = 3
      another_matrix[2, 1] = 4
      another_matrix[2, 2] = 5

      expect(@matrix + another_matrix).to eq([[3, 5], [7, 9]])
    end
  end
end
