require_relative "../lib/position"

RSpec.describe Position do
  let(:position) { Position.new(x: 1, y: 2) }
  let(:same) { Position.new(x: 1, y: 2) }
  let(:different) { Position.new(x: 3, y: 4) }

  describe "#move_by" do
    it "returns a new position moved by the given step" do
      step = [1, -1]
      new_position = position.move_by(step)

      expect(new_position).to eq(Position.new(x: 2, y: 1))
      expect(new_position).not_to be_equal(position)
    end

    it "does not mutate the original position" do
      original_x, original_y = position.x, position.y
      position.move_by([5, 5])

      expect(position.x).to eq(original_x)
      expect(position.y).to eq(original_y)
    end
  end

  describe "#to_a" do
    it "returns coordinates as an array" do
      expect(position.to_a).to eq([1, 2])
    end
  end

  describe "#hash" do
    it "is the same as another instance of the same value" do
      expect(position.hash).to eq same.hash
    end

    it "is the different from another instance of a different value" do
      expect(position.hash).not_to eq different.hash
    end
  end

  describe "#eql?" do
    it "two instances are eql if they have the same value" do
      expect(position).to be_eql same
    end

    it "two instances are not eql if they have a different value" do
      expect(position).not_to be_eql different
    end
  end

  describe "#==" do
    it "two instances are == if they have the same value" do
      expect(position).to eq same
    end

    it "two instances are not == if they have a different value" do
      expect(position).not_to eq different
    end
  end

  describe "#equal?" do
    it "is equal if two object share the same identity" do
      expect(position).to be_equal position
    end

    it "is not equal if two different objects share the same value" do
      expect(position).not_to be_equal same
    end
  end
end
