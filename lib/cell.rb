class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @been_fired = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship_obj)
    @ship = ship_obj
  end

  def fired_upon?
    @been_fired
  end

  def fire_upon
    if @ship != nil
      @ship.hit
      @ship.shot
    end
    @been_fired = true
  end

  def render(reveal = false)
    if ship_is_dead
      "X"
    elsif @ship.nil? && @been_fired == true
      "M"
    elsif reveal == true && @ship != nil
      "S"
    elsif @been_fired == true && @ship != nil
      "H"
    else
      "."
    end
  end

  def ship_is_dead
    @ship != nil && @ship.sunk?
  end
end