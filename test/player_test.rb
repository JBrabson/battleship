require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"

class PlayerTest < Minitest::Test

  def test_it_exists
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    player_board = Board.new
    player_1 = Player.new(player_cruiser, player_submarine, player_board)
    assert_instance_of Player, player_1
  end
end
