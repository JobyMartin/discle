require 'json'
require_relative 'disc.rb'
require_relative 'result.rb'
require 'irb'

class DiscleGame
  attr_reader :disc, :result, :flight_numbers
  attr_accessor :guesses, :results, :turns, :guess

  def initialize
    @discs = parse_file
    @selected_disc = nil
    @disc = nil
    @flight_numbers = nil
    # @flight_numbers = [2, 3, 0, 1]
    @guesses = []
    @guess = nil
    @results = []
    @turns = 1
  end

  def parse_file
    file = File.read('discs.json')
    JSON.parse(file)
  end

  def select_disc
    # Optional filtering of discs to one brand
    discs = []
    @discs.each do |disc|
      next unless disc['brand'] == 'Innova' && disc['name'] == 'Toro' 
      discs << disc
    end
    @selected_disc = discs.sample
    # @flight_numbers = [@selected_disc['speed'], @selected_disc['glide'], @selected_disc['turn'], @selected_disc['fade']].map(&:to_f)
  end

  def create_disc
    @disc = Disc.new(@selected_disc['name'], @selected_disc['brand'], @selected_disc['speed'], @selected_disc['glide'], @selected_disc['turn'], @selected_disc['fade'])
    @flight_numbers = [@disc.speed, @disc.glide, @disc.turn, @disc.fade]
  end

  def analyze_guess(guess)
    greens = []
    yellows = []
    # binding.irb
    if guess == @flight_numbers
      @result = Result.new([0, 1, 2, 3], [])
    else
      guess.each_with_index do |num, i|
        # binding.irb
        if num.to_f == @flight_numbers[i]
          greens << i
        # elsif @flight_numbers.include?(num.to_f)
        # # elsif num.to_f == 
        #   yellows << i
        end
      end
      @result = Result.new(greens, yellows)
    end
  end

  def win?(guess)
    guess == @flight_numbers
  end

  def reset
    @guesses = []
    @results = []
    @turns = 1
  end

  def turn(guess)
    @guesses << guess
    analyze_guess(guess)
    @results << @result.format_result(guess)
  end

  def display_final_result(guess)
    win?(guess) ? 'You win!' : "Close but no cookie: #{@flight_numbers.map(&:to_i).join(", ")} try again!"
  end

  def display_speed_hint(guess)
    if guess[0] > @flight_numbers[0]
      'slower'
    elsif guess[0] < @flight_numbers[0]
      'faster'
    end
  end
end

# game = DiscleGame.new
# game.setup
# game.play