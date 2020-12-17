class Computer
	attr_reader :computer_board,
							:ship_1,
							:ship_2,
							:possible_three_place,
							:possible_two_place,
							:total_health

	def initialize(ship_1, ship_2)
		@ship_1 = ship_1
		@ship_2 = ship_2
		@computer_board = Board.new
		@possible_three_place = [["A1, A2", "A3"], ["B3", "C3", "D3"], ["D2", "D3", "D4"]]
		@possible_two_place = [["B1", "C1"], ["B4", "C4"], ["B2", "C2"]]
		@total_health = 5
		@targets = @computer_board.cells.keys
	end

	def position_enemy_ship_1(ship_1, coordinate_ary)
		coordinate_ary = @possible_three_place.sample
		computer_board.place(ship_1, coordinate_ary)
	end

	def position_enemy_ship_2(ship_2, coordinate_ary)
		coordinate_ary = @possible_two_place.sample
		computer_board.place(ship_2, coordinate_ary)
	end

	def reduce_health_by_1
		@total_health -= 1
	end

	def computer_shot
		@targets.shuffle!.pop
	end
end