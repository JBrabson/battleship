require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_cells
    board = Board.new
    assert_equal 16, board.cells.length
    assert_instance_of Cell, board.cells["A1"]
    assert_instance_of Cell, board.cells["A2"]
    assert_instance_of Cell, board.cells["A3"]
    assert_instance_of Cell, board.cells["A4"]
    assert_instance_of Cell, board.cells["B1"]
    assert_instance_of Cell, board.cells["B2"]
    assert_instance_of Cell, board.cells["B3"]
    assert_instance_of Cell, board.cells["B4"]
    assert_instance_of Cell, board.cells["C1"]
    assert_instance_of Cell, board.cells["C2"]
    assert_instance_of Cell, board.cells["C3"]
    assert_instance_of Cell, board.cells["C4"]
    assert_instance_of Cell, board.cells["D1"]
    assert_instance_of Cell, board.cells["D2"]
    assert_instance_of Cell, board.cells["D3"]
    assert_instance_of Cell, board.cells["D4"]
  end

  def test_it_can_validate_coordinates
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_validates_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_confirms_coordinates_consecutive
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_confirms_coordinates_not_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_of_length_valid_helper
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.length_valid?(cruiser, ["A1", "A2"])
    assert_equal false, board.length_valid?(submarine, ["A2", "A3", "A4"])
  end

  def test_confirms_placement_valid
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
    assert_equal true, board.valid_placement?(submarine, ["D1", "D2"])
    assert_equal true, board.valid_placement?(cruiser, ["C2", "C3", "C4"])
    assert_equal true, board.valid_placement?(cruiser, ["X2", "X3", "X4"])
  end

  def test_split_coordinate_array_helper
    board = Board.new
    coordinates = ["A1", "C3"]
    letters = [65, 67]
    numbers = [1, 3]
    expected = letters, numbers
    assert_equal expected, board.split_coordinate_array(coordinates)
  end

  def test_same_number_different_letter_helper
    board = Board.new
    letters = [65, 66, 67]
    numbers = [1, 1, 1]
    assert_equal true, board.same_number_different_letter?(letters, numbers)
    letters = [65, 66, 67]
    numbers = [1, 1, 2]
    assert_equal false, board.same_number_different_letter?(letters, numbers)
  end

  def test_same_letter_different_number_helper
    board = Board.new
    letters = [65, 65, 65]
    numbers = [1, 2, 3]
    assert_equal true, board.same_letter_different_number?(letters, numbers)
    letters = [65, 66, 65]
    numbers = [2, 3, 4]
    assert_equal false, board.same_letter_different_number?(letters, numbers)
  end

  def test_it_can_place_ship_on_board_cell
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_2.ship
    actual = cell_3.ship == cell_2.ship
    assert_equal true, actual
  end

  def test_placement_is_valid_helper
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    coordinates = ["A1", "A2", "A3"]
    assert_equal true, board.placement_is_valid?(cruiser, coordinates)
  end
end
