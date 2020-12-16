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


end
