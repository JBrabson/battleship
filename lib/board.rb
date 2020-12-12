class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
      }
  end

  def valid_coordinate?(coordinate_str)
    @cells.include?(coordinate_str)
  end

  def valid_placement?(ship, coordinate_ary)
    letters = []
    numbers = []
    coordinate_ary.each do |coor|
        letters << coor[0].ord
        numbers << coor[1].to_i
      end
    if (same_number_different_letter?(letters, numbers) || same_letter_different_number(letters, numbers)) && length_valid?(ship, coordinate_ary)
      true
    else
      false
    end
  end

  def length_valid?(ship, coordinate_ary)
    ship.length == coordinate_ary.length
  end

  def same_number_different_letter?(letters, numbers)
    # require 'pry'; binding.pry
    letters.sort.each_cons(1).all? { |x,y| y == x + 1 } && (numbers.uniq.length == 1)
  end

  def same_letter_different_number(letters, numbers)
    (numbers.sort.each_cons(1).all? { |x,y| y == x + 1 }) && letters.sort.each_cons(1).all? { |x,y| y == x }
  end
end

#numbers.sort.each_cons(1).all? { |x,y| y == x }
