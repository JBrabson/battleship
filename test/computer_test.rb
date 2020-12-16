require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/computer"

class ComputerTest < Minitest::Test

	def test_it_exists
		cruiser = Ship.new("Cruiser", 3)
		submarine = Ship.new("Submarine", 2)
		computer = Computer.new(cruiser, submarine)
    assert_instance_of Computer, computer
  end

	def test_it_has_attributes
		cruiser = Ship.new("Cruiser", 3)
		submarine = Ship.new("Submarine", 2)
		computer = Computer.new(cruiser, submarine)
		assert_equal cruiser, computer.ship_1
		assert_equal submarine, computer.ship_2
		assert_instance_of Board, computer.computer_board
		assert_equal [["A1, A2", "A3"], ["B3", "C3", "D3"], ["D2", "D3", "D4"]], computer.possible_three_place
		assert_equal [["B1", "C1"], ["B4", "C4"], ["B2", "C2"]], computer.possible_two_place
	end

	# def test_places_enemy_ship_1
	# 	cruiser = Ship.new("Cruiser", 3)
	# 	submarine = Ship.new("Submarine", 2)
	# 	computer = Computer.new(cruiser, submarine)
	# 	possible_coordinates = [["A1, A2", "A3"], ["B3", "C3", "D3"], ["D2", "D3", "D4"]]
	# 	assert_equal true, possible_coordinates.include?(computer.position_enemy_ship_1(cruiser, possible_coordinates))
	# end
end
