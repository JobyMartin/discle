
class Result
  attr_reader :greens, :yellows
  
  def initialize(greens, yellows)
    @greens = greens
    @yellows = yellows
  end
  
  def format_result(guess)
    result = {}

    guess.each_with_index do |num, index|
      if @greens.include?(index)
        result[index] = "green"
      elsif @yellows.include?(index)
        result[index] = "yellow"
      else
        result[index] = "black"
      end
    end

    result
  end
end
