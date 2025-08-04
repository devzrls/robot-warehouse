class CommandError < StandardError
  def initialize(command)
    super("Unknown command: #{command}")
  end
end
