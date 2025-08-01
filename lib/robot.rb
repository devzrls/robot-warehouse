class Robot
  VALID_COMMANDS = %w[N S E W].freeze
  GRID_X_MAX = 9
  GRID_X_MIN = 0
  GRID_Y_MAX = 9
  GRID_Y_MIN = 0

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
  end

  def execute(command)
    commands = command_parser(command)
    commands = command_validator(commands)

    commands.each do |cmd|
      case cmd
      when "N"
        if @y < GRID_Y_MAX
          @y += 1
        else
          break
        end
      when "S"
        if @y > GRID_Y_MIN
          @y -= 1
        else
          break
        end
      when "E"
        if @x < GRID_X_MAX
          @x += 1
        else
          break
        end
      when "W"
        if @x > GRID_X_MIN
          @x -= 1
        else
          break
        end
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

  def command_validator(commands)
    raise ArgumentError, "Missing command" if commands.empty?

    commands.each do |cmd|
      unless VALID_COMMANDS.include?(cmd)
        raise ArgumentError, "Unknown command: #{cmd}"
      end
    end
    commands
  end
end
