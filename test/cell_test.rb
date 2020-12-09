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

  def test_it_can_place_ship_on_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

  def test_it_knows_it_has_been_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.fired_upon?
  end

  def test_it_can_fire_upon_cells
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end

  def test_it_can_render
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render
  end
end