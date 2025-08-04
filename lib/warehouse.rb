class Warehouse
  def initialize(width: 10, length: 10)
    @width = width
    @length = length
  end

  def contains?(position)
    position.x.between?(0, @width - 1) && position.y.between?(0, @length - 1)
  end
end
