require 'sinatra'
require_relative './models/game.rb'
# require_relative './models/result.rb'
require "irb"

game = DiscleGame.new

get '/' do
  game.select_disc
  game.create_disc
  game.reset
  @disc_name = game.disc.name
  @disc_brand = game.disc.brand
  erb :index
end

post '/guess' do
  @guess = params[:guess].values.to_a.map(&:to_f)
  # game.guess = @guess
  @disc_name = game.disc.name
  @disc_brand = game.disc.brand

  unless game.turns >= 4 || game.win?(@guess)
    game.turns += 1
    game.turn(@guess)
    @guesses = game.guesses
    @results = game.results
    @speed_hint = game.display_speed_hint(@guess)
    erb :index
  else
    game.turn(@guess)
    @guesses = game.guesses
    @results = game.results
    @end_message = game.display_final_result(@guess)
    erb :index
  end
end
