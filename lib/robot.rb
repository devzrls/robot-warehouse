require_relative "boundary_error"
require_relative "command_error"

class Robot
  VALID_MOVE_COMMANDS = {
    "N" => [0, 1],
    "S" => [0, -1],
    "E" => [1, 0],
    "W" => [-1, 0]
  }.freeze

  def initialize(position: Position.new, warehouse: Warehouse.new)
    @warehouse = warehouse
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
    raise CommandError.new("") if commands.empty?

    commands.each do |cmd|
      unless VALID_MOVE_COMMANDS.key?(cmd)
        raise CommandError.new(cmd)
      end
    end
    commands
  end

  def move(command)
    step = VALID_MOVE_COMMANDS[command]
    new_position = @position.move_by(step)

    if @warehouse.contains?(new_position)
      @position = new_position
    else
      raise BoundaryError.new(command, @position)
    end
  end
end
