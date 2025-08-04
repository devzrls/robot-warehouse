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
    commands = parse_command(command)
    commands = validate_command(commands)

    commands.each { |cmd| move(cmd) }
  end

  def position
    [@x, @y]
  end

  private

  def parse_command(command)
    command.split(",").map(&:strip)
  end

  def validate_command(commands)
    raise ArgumentError, "Missing command" if commands.empty?

    commands.each do |cmd|
      unless VALID_COMMANDS.include?(cmd)
        raise ArgumentError, "Unknown command: #{cmd}"
      end
    end
    commands
  end

  def move(command)
    case command
    when "N"
      move_north
    when "S"
      move_south
    when "E"
      move_east
    when "W"
      move_west
    end
  end

  def move_north
    if @y < GRID_Y_MAX
      @y += 1
    else
      raise ArgumentError, "Invalid move"
    end
  end

  def move_south
    if @y > GRID_Y_MIN
      @y -= 1
    else
      raise ArgumentError, "Invalid move"
    end
  end

  def move_east
    if @x < GRID_X_MAX
      @x += 1
    else
      raise ArgumentError, "Invalid move"
    end
  end

  def move_west
    if @x > GRID_X_MIN
      @x -= 1
    else
      raise ArgumentError, "Invalid move"
    end
  end 
end
