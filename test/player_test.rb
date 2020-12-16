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

  def test_it_has_attributes
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    player_board = Board.new
    player_1 = Player.new(player_cruiser, player_submarine, player_board)
    assert_equal player_cruiser, player_1.ship_1
    assert_equal player_submarine, player_1.ship_2
    assert_equal player_board, player_1.player_board
  end

  def test_it_can_place_ships_on_its_board
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)
    player_board = Board.new
    player_1 = Player.new(player_cruiser, player_submarine, player_board)
    user_input_ship_1 = ["A1", "A2", "A3"]
    player_1.position_ship(player_cruiser, user_input_ship_1)
    user_input_ship_2 = ["B3", "C3"]
    player_1.position_ship(player_submarine, user_input_ship_2)
    assert_equal player_cruiser, player_1.player_board.cells["A1"].ship
    assert_equal player_submarine, player_1.player_board.cells["C3"].ship
  end
end
