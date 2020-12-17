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

# Loop for Turn!

until player.total_health == 0 || computer.total_health == 0 do
    p "=============COMPUTER BOARD============="
    puts computer.computer_board.render
    sleep(1)
    p "==============PLAYER BOARD=============="
    puts player.player_board.render(true)
    sleep(1)
    # Player shoots
    p "Enter the coordinate for your shot:"
    shot_input = gets.chomp.upcase
    p "Please enter a valid coordinate:" if player.player_board.valid_coordinate?(shot_input)
    computer.computer_board.cells[shot_input].fire_upon
    p "Shooting Computer"
    sleep(1)
    if computer.computer_board.cells[shot_input].render == "H"
      computer.reduce_health_by_1
      p "Good Job. Your shot #{shot_input} was a direct hit."
    elsif computer.computer_board.cells[shot_input].render == "X"
      ship_name = computer.computer_board.cells[shot_input].ship.name
      computer.reduce_health_by_1
      p "My #{ship_name} now rests in the Davy Jones locker."
    else
      p "Your #{shot_input} was a total miss!!! Better luck next time."
    end
    # Computer shoots
    player.player_board.cells[computer.computer_shot].fire_upon
    if player.player_board.cells[computer.computer_shot].render == "H"
      ship_name = player.player_board.cells[computer.computer_shot].ship.name
      player.reduce_health_by_1
      p "I hit your #{ship_name} on #{computer.computer_shot}!!!"
    elsif player.player_board.cells[computer.computer_shot].render == "X"
      ship_name = player.player_board.cells[computer.computer_shot].ship.name
      player.reduce_health_by_1
      p "Your #{ship_name} is fish food!!!"
    else
      p "My aim is off. Gotta hit the range."
    end


  end


  require "pry"; binding.pry


elsif choice == "q"
p "Come Back Soon"

else
  p "Sorry"

end



