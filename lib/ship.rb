class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @shot = false
  end

  def sunk?
    if health > 0
      false
    else health == 0
      true
    end
  end

  def hit
    @health -= 1
    @shot = true
  end
end
