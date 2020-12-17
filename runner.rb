require "./lib/computer.rb"
require "./lib/player.rb"
require "./lib/ship.rb"
require "./lib/board.rb"
require "./lib/cell.rb"

p "Welcome to Battleship"
sleep(1)
p "Enter p to play. Enter q to quit."
choice = gets.chomp
if choice == "p"
  player_cruiser = Ship.new("Cruiser", 3)
  player_submarine = Ship.new("Submarine", 2)
  enemy_cruiser = Ship.new("Cruiser", 3)
  enemy_submarine = Ship.new("Submarine", 2)
  player_board = Board.new
  computer_board = Board.new
  computer = Computer.new(enemy_cruiser, enemy_submarine)
  player = Player.new(player_cruiser, player_submarine, player_board)
  computer.position_enemy_ship_1(enemy_cruiser)
  computer.position_enemy_ship_2(enemy_submarine)
  p "I have laid out my ships on the grind."