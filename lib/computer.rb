class Computer
	attr_reader :computer_board

	def initialize(ship_1, ship_2)
		@ship_1 = ship_1
		@ship_2 = ship_2
		@computer_board = Board.new
		@possible_three_place = [["A1, A2", "A3"], ["B3", "C3", "D3"], ["D2", "D3", "D4"]]
		@possible_two_place = [["B1", "C1"], ["B4", "C4"], ["B2", "C2"]]
	end

end
