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

    context "command sequence N,E,S,W" do
      it "moves the robot back to where it started" do
        robot = Robot.new

        robot.execute("N,E,S,W")

        expect(robot.position).to eq([0, 0])
      end
    end

    context "command sequence N,E,N,E,N,E,N,E" do
      it "moves the robot to the correct position" do
        robot = Robot.new

        robot.execute("N,E,N,E,N,E,N,E")

        expect(robot.position).to eq([4, 4])
      end

    end
  end
end
