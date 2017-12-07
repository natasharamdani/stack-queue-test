class MyMatrix
  attr_accessor :row, :column, :matrix

  def initialize(row, column)
    @row = row
    @column = column
    @matrix = Array.new(row) { Array.new(column) }
  end

  def []=(row, column, element)
    @matrix[row-1][column-1] = element
  end

  def [](row, column)
    element = @matrix[row-1][column-1]
  end

  def to_s
    string = ""
    @row.times do |row|
      string += "| "
      @column.times do |column|
        element = @matrix[row][column]
        element == nil ? string += "-" : string += element.to_s
        string += " " if row < @row
      end
      string += "|"
      string += "\n" if row < @row - 1
    end
    string
  end

  def *(number)
    @row.times { |row| @column.times { |column| @matrix[row][column] *= number } }
    @matrix
  end

  def +(another_matrix)
    @row.times { |row| @column.times { |column| @matrix[row][column] += another_matrix[row-1, column-1] } }
    @matrix
  end
end
