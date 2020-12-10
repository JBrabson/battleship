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
end
