class Player
    attr_reader :ship_1,
                :ship_2,
                :player_board,
                :total_health


  def initialize(ship_1, ship_2, player_board)
    @ship_1 = ship_1
    @ship_2 = ship_2
    @player_board = player_board
    @total_health = 5
  end

  def position_ship(ship_obj, coordinate_ary)
    @player_board.place(ship_obj, coordinate_ary)
  end

  def reduce_health_by_1
    @total_health -= 1
  end
end