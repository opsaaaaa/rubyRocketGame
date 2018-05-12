
require "rubygems"
require "gosu"
require "./sprite"
require "./rocket"

class SpriteGame < Gosu::Window

  def initialize width = 800, height = 600, fullscreen=false
    super
    self.caption = "rocketGame"
    @rocket = Rocket.new self
  end

  def button_down id
    close if id == Gosu::KbEscape
    @rocket.setAnimation "pufL" if id == Gosu::KbLeft
    @rocket.setAnimation "pufR" if id == Gosu::KbRight
  end

  def update
    @rocket.update
  end

  def draw
    @rocket.draw
  end
end

SpriteGame.new.show
