RSpec.describe Robot do
  describe "#execute" do
    it "executes the given command" do
      robot = Robot.new

      robot.execute("N")

      expect(robot.position).to eq([0, 1])
    end

    it "executes a csv of commands" do
      robot = Robot.new

      robot.execute("N,E")

      expect(robot.position).to eq([1, 1])
    end
  end
end
