class Text

	def initialize
	end

	def welcome
		p "Welcome to BATTLESHIP."
	end

	def play
		p "Enter p to play and let the battle commence or q to quit and return more prepared."
	end

	def ship_layout
		p "I've set my ships to sea. It is time for you to place yours."
		p "Your Cruiser will float three units long."
		sleep(1)
		p "Your Submarine will float at two units."
		sleep(2)
		p "Sinking your own ships would be a bad thing. Take care not to overlap coordinates."
		sleep(1)
	end

	def place_cruiser
		p "Let's set your cruiser to sea."
	end

	def place_submarine
		p "Let's put your submarine on some water."
	end

	def coordinate_1
		p "Enter first coordinate."
	end

	def coordinate_2
		p "Enter second coordinate."
	end

	def coordinate_3
		p "Enter third coordinate."
	end

	def set
		p "Aye, aye. Battleships have been placed and ready for fire."
	end

	def fire
		p ["Fire!", "Release the Torpedo!", "Bombs Away!", "Pay the iron price!", "Winter is coming.", "I love dancing... on your ship's watery grave.", "Who ordered a torpedo sandwich?"].sample
	end

	def ship_sunk
		p "Like vacations? Awesome. Safe travels on your one-way trip to Davy Jones' Locker!"

	def take_aim
		sleep(1)
		p "Aim your cannons! Choose a coordinate to fire on the enemy's board."
	end

	def computer_aim
		sleep(1)
		p "Zeroing in on your ships..."
	end

	def ships_overlap
		p "--ERROR--"
		p "Ships don't work that way, compadre. Choose another coordinate."
	end

	def invalid_coordinate
		sleep(1)
		p "The sea is vast. But not that vast. Choose another coordinate."
	end

	def win
		p "-*-*-* W I N N E R *-*-*-"
		p "--YOU SANK MY SHIPS!--"
		p "*** NEW CHAMPION IN THE ARENA ***"
	end

	def winner
		puts """##      ## #### ##    ## ##    ## ######## ########
##  ##  ##  ##  ###   ## ###   ## ##       ##     ##
##  ##  ##  ##  ####  ## ####  ## ##       ##     ##
##  ##  ##  ##  ## ## ## ## ## ## ######   ########
##  ##  ##  ##  ##  #### ##  #### ##       ##   ##
##  ##  ##  ##  ##   ### ##   ### ##       ##    ##
 ###  ###  #### ##    ## ##    ## ######## ##     ##  """
  end

	def lost
		puts "  ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ███▀▀▀██┼███▀▀▀███┼███▀█▄█▀███┼██▀▀▀"
 		puts "  ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼█┼┼┼██┼██┼┼┼"
 		puts "  ██┼┼┼▄▄▄┼██▄▄▄▄▄██┼██┼┼┼▀┼┼┼██┼██▀▀▀"
 		puts "  ██┼┼┼┼██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██┼┼┼"
 		puts "  ███▄▄▄██┼██┼┼┼┼┼██┼██┼┼┼┼┼┼┼██┼██▄▄▄"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ███▀▀▀███┼▀███┼┼██▀┼██▀▀▀┼██▀▀▀▀██▄┼"
 		puts "  ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██┼┼┼┼██┼┼┼┼┼██┼"
 		puts "  ██┼┼┼┼┼██┼┼┼██┼┼██┼┼██▀▀▀┼██▄▄▄▄▄▀▀┼"
 		puts "  ██┼┼┼┼┼██┼┼┼██┼┼█▀┼┼██┼┼┼┼██┼┼┼┼┼██┼"
 		puts "  ███▄▄▄███┼┼┼─▀█▀┼┼─┼██▄▄▄┼██┼┼┼┼┼██▄"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼██┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼████▄┼┼┼▄▄▄▄▄▄▄┼┼┼▄████┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼▀▀█▄█████████▄█▀▀┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼█████████████┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼██▀▀▀███▀▀▀██┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼██┼┼┼███┼┼┼██┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼█████▀▄▀█████┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼┼███████████┼┼┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼▄▄▄██┼┼█▀█▀█┼┼██▄▄▄┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼▀▀██┼┼┼┼┼┼┼┼┼┼┼██▀▀┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼▀▀┼┼┼┼┼┼┼┼┼┼┼"
 		puts "  ┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼┼"
	end

	def final_message
		p "Thank you. Please come again. (When you're ready for a real battle.)"
end
