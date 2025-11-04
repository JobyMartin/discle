require_relative "../models/game.rb"

RSpec.describe DiscleGame do
  describe "#analyze_guess" do
    it "returns four greens' indexes" do
      game = DiscleGame.new
      game.analyze_guess([2, 3, 0, 1])
      expect(game.result.greens).to eq([0, 1, 2, 3])
      expect(game.result.yellows).to eq([])
    end

    # it "returns greens' and yellows' indexes" do
    #   game = DiscleGame.new
    #   game.analyze_guess([2, 3, 1, 0])
    #   expect(game.result.greens).to eq([0, 1])
    #   expect(game.result.yellows).to eq([2, 3])
    # end
  end

  describe "#win?" do
    it 'returns true when the guess is correct' do
      game = DiscleGame.new
      expect(game.win?([2, 3, 0, 1])).to eq(true)
    end

    it 'returns false when the guess is correct' do
      game = DiscleGame.new
      expect(game.win?([2, 3, 0, 2])).to eq(false)
    end
  end
  
  # describe "#turn" do
  #   it "takes a guess and returns the guess and the result after analyzing" do
  #     game = DiscleGame.new
  #     expect(game.turn([2.0, 3.0, 0.0, 1.0])).to eq(
        
  #     )
  #   end
  # end

  describe "#display_final_result" do
    it "takes the guess and returns the final win" do
      game = DiscleGame.new
      expect(game.display_final_result([2, 3, 0, 1])).to eq('You win!')
    end

    it "takes the guess and returns the final loss" do
      game = DiscleGame.new
      expect(game.display_final_result([2, 3, 0, 2])).to eq('Close but no cookie: 2 3 0 1 try again!')
    end
  end

  describe "#display_speed_hint" do
    it "returns slower when the speed in the guess is lower" do
      game = DiscleGame.new
      expect(game.display_speed_hint([4, 3, 0, 1])).to eq('slower')
    end

    it "returns faster when the speed in the guess is higher" do
      game = DiscleGame.new
      expect(game.display_speed_hint([1, 3, 0, 1])).to eq('faster')
    end
  end
end