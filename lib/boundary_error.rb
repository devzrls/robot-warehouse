class BoundaryError < StandardError
  def initialize(command, position)
    super("Cannot move #{command} from [#{position.x}, #{position.y}]")
  end
end
