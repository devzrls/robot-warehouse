class Robot
  VALID_COMMANDS = %w[N S E W].freeze

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
