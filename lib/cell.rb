class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @been_hit = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_obj)
    @ship = ship_obj
  end

  def fired_upon?
    @been_hit
  end
end