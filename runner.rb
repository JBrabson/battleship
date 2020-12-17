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

  # Placing Cruiser
  p "You now need to lay out your two ship."
p "The #{player_cruiser.name} is three units long and the #{player_submarine.name} is two units long."
puts player.player_board.render(false)
p "Enter the squares for the #{player_cruiser.name}"
p "Enter first square"
cruiser_coor1 = gets.chomp.upcase
p "Enter second square"
cruiser_coor2 = gets.chomp.upcase
p "Enter third square"
cruiser_coor3 = gets.chomp.upcase
cruiser_coordinates = ["#{cruiser_coor1}", "#{cruiser_coor2}", "#{cruiser_coor3}"]
p "Invalid Coordinates --ERROR--" if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
# Loop for invalid coordinates for cruiser
until player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == true do
  p "You now need to lay out your two ships."
  p "The #{player_cruiser.name} is three units long and the #{player_submarine.name} is two units long."
  puts player.player_board.render(false)
  p "Enter the squares for the #{player_cruiser.name}"
  p "Enter first square"
  cruiser_coor1 = gets.chomp.upcase
  p "Enter second square"
  cruiser_coor2 = gets.chomp.upcase
  p "Enter third square"
  cruiser_coor3 = gets.chomp.upcase
  cruiser_coordinates = ["#{cruiser_coor1}", "#{cruiser_coor2}", "#{cruiser_coor3}"]
  p "Invalid Coordinates --ERROR--" if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
end
player.position_ship(player_cruiser, cruiser_coordinates)
p "Your #{player_cruiser.name} is set and ready to fire."
puts player.player_board.render(true)

# Placing Submarine

p "Enter the squares for the #{player_submarine.name}"
p "Enter first square"
sub_coor1 = gets.chomp.upcase
p "Enter second square"
sub_coor2 = gets.chomp.upcase
submarine_coordinates = ["#{sub_coor1}", "#{sub_coor2}"]
p "Invalid Coordinates --ERROR--" if (player.player_board.valid_placement?(player_submarine, submarine_coordinates) == false)

# Loop for invalid submarine coordinates

until player.player_board.valid_placement?(player_submarine, submarine_coordinates) == true
  p "Enter the squares for the #{player_submarine.name}"
  p "Enter first square"
  sub_coor1 = gets.chomp.upcase
  p "Enter second square"
  sub_coor2 = gets.chomp.upcase
  submarine_coordinates = ["#{sub_coor1}", "#{sub_coor2}"]
  p "Invalid Coordinates --ERROR--" if (player.player_board.valid_placement?(player_submarine, submarine_coordinates) == false)
end
player.position_ship(player_submarine, submarine_coordinates)
p "Your #{player_submarine.name} is set and ready to fire."
puts player.player_board.render(true)
sleep(2)





