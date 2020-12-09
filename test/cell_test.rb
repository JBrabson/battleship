require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"

class Test < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_it_attributes
    cell = Cell.new("B4")
    assert_equal "B4", cell.coordinate
    assert_equal nil, cell.ship
  end

  def test_cell_is_empty_by_default
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
  end
end