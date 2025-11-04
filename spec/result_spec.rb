require_relative "../models/result.rb"

RSpec.describe Result do
  describe "#format_result" do
    it "takes the guess, the greens, and yellows and returns one result hash of indexes" do
      result = Result.new([0, 1], [3])
      # disc is 2, 3, 0, 2
      expect(result.format_result([2, 3, 4, 0])).to eq(
        {
          0 => 'green',
          1 => 'green',
          2 => 'black',
          3 => 'yellow'
        }
      )
    end

    it "handles yellows and greens being the same number" do
      result = Result.new([0, 1], [2, 3])
      # disc is 2, 3, 0, 2
      expect(result.format_result([2, 3, 2, 0])).to eq(
        {
          0 => 'green',
          1 => 'green',
          2 => 'yellow',
          3 => 'yellow'
        }
      )
    end
  end
end