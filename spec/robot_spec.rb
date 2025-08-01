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

    context "invalid commands" do
      it "raises an error for unknown commands" do
        robot = Robot.new

        expect { robot.execute("X") }.to raise_error(ArgumentError, "Unknown command: X")
      end

      it "raises an error for multiple unknown commands" do
        robot = Robot.new

        expect { robot.execute("N,X,T,E") }.to raise_error(ArgumentError, "Unknown command: X")
      end

      it "raises an error for blank commands" do
        robot = Robot.new

        expect { robot.execute("") }.to raise_error(ArgumentError, "Missing command")
      end

      it "raises an error if sequence contains empty commands" do
        robot = Robot.new

        expect { robot.execute("N,,E") }.to raise_error(ArgumentError, "Unknown command: ")
      end
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
