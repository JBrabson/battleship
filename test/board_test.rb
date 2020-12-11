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
end
