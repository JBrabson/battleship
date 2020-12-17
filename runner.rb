require "./lib/computer.rb"
require "./lib/player.rb"
require "./lib/ship.rb"
require "./lib/board.rb"
require "./lib/cell.rb"
require "./lib/text.rb"

txt = Text.new
txt.welcome
sleep(1)
txt.play
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
  txt.ship_layout
  puts player.player_board.render(false)
  txt.place_cruiser
  txt.coordinate_1
  cruiser_coor1 = gets.chomp.upcase
  txt.coordinate_2
  cruiser_coor2 = gets.chomp.upcase
  txt.coordinate_3
  cruiser_coor3 = gets.chomp.upcase
  cruiser_coordinates = ["#{cruiser_coor1}", "#{cruiser_coor2}", "#{cruiser_coor3}"]
  if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
    txt.invalid_coordinate
  end
  until player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == true do
    txt.place_cruiser
    puts player.player_board.render(false)
    txt.coordinate_1
    cruiser_coor1 = gets.chomp.upcase
    txt.coordinate_2
    cruiser_coor2 = gets.chomp.upcase
    txt.coordinate_3
    cruiser_coor3 = gets.chomp.upcase
    cruiser_coordinates = ["#{cruiser_coor1}", "#{cruiser_coor2}", "#{cruiser_coor3}"]
    if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
      txt.invalid_coordinate
    end
  end
  player.position_ship(player_cruiser, cruiser_coordinates)
  txt.set
  puts player.player_board.render(true)
  txt.place_submarine
  txt.coordinate_1
  sub_coor1 = gets.chomp.upcase
  txt.coordinate_2
  sub_coor2 = gets.chomp.upcase
  submarine_coordinates = ["#{sub_coor1}", "#{sub_coor2}"]
  if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
    txt.invalid_coordinate
  end
  until player.player_board.valid_placement?(player_submarine, submarine_coordinates) == true
    txt.place_submarine
    txt.coordinate_1
    sub_coor1 = gets.chomp.upcase
    txt.coordinate_2
    sub_coor2 = gets.chomp.upcase
    submarine_coordinates = ["#{sub_coor1}", "#{sub_coor2}"]
    if (player.player_board.valid_placement?(player_cruiser, cruiser_coordinates) == false)
      txt.invalid_coordinate
    end
  end
  player.position_ship(player_submarine, submarine_coordinates)
  txt.set
  puts player.player_board.render(true)
  sleep(2)
  until player.total_health == 0 || computer.total_health == 0 do
    p "=============COMPUTER BOARD============="
    puts computer.computer_board.render
    sleep(1)
    p "==============PLAYER BOARD=============="
    puts player.player_board.render(true)
    sleep(1)
    # Player shoots
    txt.take_aim
    shot_input = gets.chomp.upcase
    if (player.player_board.valid_coordinate?(shot_input) == false)
      txt.invalid_coordinate
    end
    until (player.player_board.valid_coordinate?(shot_input) == true) do
      txt.take_aim
      shot_input = gets.chomp.upcase
    end
    computer.computer_board.cells[shot_input].fire_upon
    txt.fire
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
    if player.total_health == 0
      txt.lost
    elsif computer.total_health == 0
      txt.win
      sleep(2)
      txt.winner
    end
  end
elsif choice == "q"
  txt.lost
else
  txt.final_message
end