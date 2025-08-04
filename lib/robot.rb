class Robot
  VALID_MOVE_COMMANDS = {
    "N" => [0, 1],
    "S" => [0, -1],
    "E" => [1, 0],
    "W" => [-1, 0]
  }.freeze

  GRID_X_MAX = 9
  GRID_X_MIN = 0
  GRID_Y_MAX = 9
  GRID_Y_MIN = 0

  def initialize(position: Position.new)
    @position = position
  end

  def execute(command)
    commands = parse_command(command)
    commands = validate_command(commands)

    commands.each { |cmd| move(cmd) }
  end

  def current_position
    @position.to_a
  end

  private

  def parse_command(command)
    command.split(",").map(&:strip)
  end

  def validate_command(commands)
    raise ArgumentError, "Missing command" if commands.empty?

    commands.each do |cmd|
      unless VALID_MOVE_COMMANDS.key?(cmd)
        raise ArgumentError, "Unknown command: #{cmd}"
      end
    end
    commands
  end

  def move(command)
    step = VALID_MOVE_COMMANDS[command]
    new_position = @position.move_by(step)

    if valid_position?(new_position)
      @position = new_position
    else
      raise ArgumentError, "Invalid move"
    end
  end

  def valid_position?(position)
    position.x.between?(GRID_X_MIN, GRID_X_MAX) && position.y.between?(GRID_Y_MIN, GRID_Y_MAX)
  end
end
