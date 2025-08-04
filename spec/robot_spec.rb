RSpec.describe Robot do
  describe "#execute" do
    it "executes the given command" do
      robot = Robot.new

      robot.execute("N")

      expect(robot.current_position).to eq([0, 1])
    end

    it "executes csv commands" do
      robot = Robot.new

      robot.execute("N,E")

      expect(robot.current_position).to eq([1, 1])
    end

    context "command sequence N,E,S,W" do
      it "moves the robot back to where it started" do
        robot = Robot.new

        robot.execute("N,E,S,W")

        expect(robot.current_position).to eq([0, 0])
      end
    end

    context "command sequence N,E,N,E,N,E,N,E" do
      it "moves the robot to the correct position" do
        robot = Robot.new

        robot.execute("N,E,N,E,N,E,N,E")

        expect(robot.current_position).to eq([4, 4])
      end
    end

    context "invalid commands" do
      it "raises an error for unknown commands" do
        robot = Robot.new

        expect { robot.execute("X") }.to raise_error(CommandError, "Unknown command: X")
      end

      it "raises an error for multiple unknown commands" do
        robot = Robot.new

        expect { robot.execute("N,X,T,E") }.to raise_error(CommandError, "Unknown command: X")
      end

      it "raises an error for blank commands" do
        robot = Robot.new

        expect { robot.execute("") }.to raise_error(CommandError, "Unknown command: ")
      end

      it "raises an error if sequence contains empty commands" do
        robot = Robot.new

        expect { robot.execute("N,,E") }.to raise_error(CommandError, "Unknown command: ")
      end
    end

    context "boundaries" do
      it "terminates execution if robot hits negative x boundary" do
        robot = Robot.new

        expect { robot.execute("W") }.to raise_error(BoundaryError, "Cannot move W from [0, 0]")

        expect(robot.current_position).to eq([0, 0])
      end

      it "terminates execution if robot hits negative y boundary" do
        robot = Robot.new

        expect { robot.execute("S") }.to raise_error(BoundaryError, "Cannot move S from [0, 0]")

        expect(robot.current_position).to eq([0, 0])
      end

      it "terminates execution if robot hits positive x boundary" do
        robot = Robot.new

        expect { robot.execute(10.times.map { "E" }.join(",")) }.to raise_error(BoundaryError, "Cannot move E from [9, 0]")

        expect(robot.current_position).to eq([9, 0])
      end

      it "terminates execution if robot hits positive y boundary" do
        robot = Robot.new

        expect { robot.execute(10.times.map { "N" }.join(",")) }.to raise_error(BoundaryError, "Cannot move N from [0, 9]")

        expect(robot.current_position).to eq([0, 9])
      end
    end
  end
end
