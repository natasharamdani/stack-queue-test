require_relative '../car_wash.rb'

describe "CarWash" do
  before :each do
    @carwash = CarWash.new(3)
  end

  it "should be able to be initialized" do
    expect(@carwash.class.name).to eq("CarWash")
  end

  it "should have n x n parking spaces" do
    expect(@carwash.space).to eq(9)
  end

  it "should show the parking spaces when printed" do
    expect(@carwash.to_s).to eq("| - - - |\n| - - - |\n| - - - |")
  end

  describe "park" do
    before :each do
      @carwash.park("A")
      @carwash.park("B")
      @carwash.park("C")
      @carwash.park("D")
    end

    it "can park car in the nearest space from top left" do
      expect(@carwash.to_s).to eq("| A B C |\n| D - - |\n| - - - |")
    end

    it "will return a message when the space is full" do
      @carwash.park("E")
      @carwash.park("F")
      @carwash.park("G")
      @carwash.park("H")
      @carwash.park("I")

      expect(@carwash.park("J")).to eq("Parking space is full")
    end
  end

  describe "wash" do
    before :each do
      @carwash.park("A")
      @carwash.park("B")
      @carwash.park("C")
      @carwash.park("D")
    end

    it "can wash car" do
      @carwash.wash # A
      expect(@carwash.to_s).to eq("| - B C |\n| D - - |\n| - - - |")
    end

    it "will picks the first car that comes" do
      @carwash.wash # A
      @carwash.wash # B
      @carwash.park("E")
      @carwash.wash # C
      expect(@carwash.to_s).to eq("| E - - |\n| D - - |\n| - - - |")
    end

    it "will return a message when the parking space is empty" do
      @carwash.wash # A
      @carwash.wash # B
      @carwash.wash # C
      @carwash.wash # D

      expect(@carwash.wash).to eq("Parking space is empty")
    end
  end

  describe "display" do
    before :each do
      @carwash.park("A")
      @carwash.park("B")
      @carwash.park("C")
      @carwash.park("D")
      @carwash.park("E")

      @carwash.wash
      @carwash.wash
    end

    it "can print the history of cars that have been washed" do
      expect(@carwash.history).to eq("These cars have been washed: A, B")
    end

    it "can print the order of cars to be washed" do
      expect(@carwash.order).to eq("The order of cars to be washed next are: C, D, E")
    end
  end
end
