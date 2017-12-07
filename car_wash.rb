class CarWash
  attr_accessor :n, :space, :carwash, :parked, :washed

  def initialize(n)
    @n = n
    @space = n * n
    @carwash = Array.new(n) { Array.new(n) }
    @parked = []
    @washed = []
  end

  def to_s
    string = ""
    @n.times do |row|
      string += "| "
      @n.times do |column|
        car = @carwash[row][column]
        car == nil ? string += "-" : string += car
        string += " " if column < @n
      end
      string += "|"
      string += "\n" if row < @n - 1
    end
    string
  end

  def park(car)
    full = false

    catch :parked do
      @n.times do |row|
        @n.times do |column|
          if @carwash[row][column] == nil
            @carwash[row][column] = car

            @parked.push(car)

            throw :parked
          end # if
          full = true if column == @n - 1 && row == @n - 1
        end # column
      end # row
    end # parked

    "Parking space is full" if full
  end

  def wash
    empty = false
    car = @parked.first
    return "Parking space is empty" if @parked.empty?

    catch :washed do
      @n.times do |row|
        @n.times do |column|
          if @carwash[row][column] == car
            @carwash[row][column] = nil

            @parked.shift
            @washed.push(car)

            throw :washed
          end # if
        end # column
      end # row
    end # washed
  end

  def order
    "The order of cars to be washed next are: #{@parked.join(', ')}"
  end

  def history
    "These cars have been washed: #{@washed.join(', ')}"
  end
end


carwash = CarWash.new(3)