class Robot
  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def execute(command)
    commands = command_parser(command)

    commands.each do |cmd|
      case cmd
      when "N"
        @y += 1
      when "S"
        @y -= 1
      when "E"
        @x += 1
      when "W"
        @x -= 1
      end
    end
  end

  def position
    [@x, @y]
  end

  private

  def command_parser(command)
    command.split(",").map(&:strip)
  end
end
