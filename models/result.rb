
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
  
  # def analyze_guess(guess)
  #   greens = []
  #   yellows = []
  
  #   if guess == @flight_numbers
  #     @result = Result.new(guess, [])
  #   else
  #     guess.each_with_index do |num, i|
  #       if num.to_f == @flight_numbers[i]
  #         greens << num.to_f
  #       elsif @flight_numbers.include?(num.to_f)
  #         yellows << num.to_f
  #       end
  #     end
  #     @result = Result.new(greens, yellows)
  #   end
  # end

end
