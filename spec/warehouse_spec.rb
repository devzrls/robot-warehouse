require_relative "../lib/warehouse"
require_relative "../lib/position"

RSpec.describe Warehouse do
  let(:warehouse) { Warehouse.new(width: 10, length: 10) }

  describe "#contains?" do
    it "returns true for positions within bounds" do
      position = Position.new(x: 2, y: 1)

      expect(warehouse.contains?(position)).to be true
    end

    it "returns true for position at origin" do
      position = Position.new(x: 0, y: 0)

      expect(warehouse.contains?(position)).to be true
    end

    it "returns true for position at maximum bounds" do
      position = Position.new(x: 9, y: 9)

      expect(warehouse.contains?(position)).to be true
    end

    it "returns false for position with x coordinate too high" do
      position = Position.new(x: 10, y: 1)

      expect(warehouse.contains?(position)).to be false
    end

    it "returns false for position with y coordinate too high" do
      position = Position.new(x: 2, y: 10)

      expect(warehouse.contains?(position)).to be false
    end

    it "returns false for negative x coordinate" do
      position = Position.new(x: -1, y: 1)

      expect(warehouse.contains?(position)).to be false
    end

    it "returns false for negative y coordinate" do
      position = Position.new(x: 2, y: -1)

      expect(warehouse.contains?(position)).to be false
    end
  end

  context "when initialized with custom dimensions" do
    it "returns true for positions within custom bounds" do
      custom_warehouse = Warehouse.new(width: 5, length: 5)
      position = Position.new(x: 3, y: 3)

      expect(custom_warehouse.contains?(position)).to be true
    end

    it "returns false for positions outside custom bounds" do
      custom_warehouse = Warehouse.new(width: 5, length: 5)
      position = Position.new(x: 5, y: 5)

      expect(custom_warehouse.contains?(position)).to be false
    end
  end
end