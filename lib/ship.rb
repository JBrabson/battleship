class Ship
  def initialize(name, length)
    @name = name
    @length = length
  end

  def name
    @name
  end

  def length
    @length
  end

  def health
    @length
  end

  def sunk?
    if health >0
      false
    else health == 0
      true
    end
  end

end
