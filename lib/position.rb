class Position
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
    freeze
  end

  def to_a
    [@x, @y]
  end

  def move_by(step)
    Position.new(x: x + step[0], y: y + step[1])
  end

  def ==(other)
    x == other.x && y == other.y
  end
  alias_method :eql?, :==

  def hash
    [self.class, x, y].hash
  end
end
