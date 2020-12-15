class Player
    attr_reader :ship_1,
                :ship_2,
                :player_board


  def initialize(ship_1, ship_2, player_board)
    @ship_1 = ship_1
    @ship_2 = ship_2
    @player_board = player_board
  end

end
