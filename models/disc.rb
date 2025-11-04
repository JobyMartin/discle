
class Disc
  attr_reader :name, :brand, :speed, :glide, :turn, :fade

  def initialize(name, brand, speed, glide, turn, fade)
    @name = name
    @brand = brand
    @speed = speed.to_f
    @glide = glide.to_f
    @turn = turn.to_f
    @fade = fade.to_f
  end
end