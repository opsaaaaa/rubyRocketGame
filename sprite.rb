require "gosu"
# a sprite mode has
# an array of images.
# a name
# action?
class Sprite

  def initialize window
    @window = window
    @width = @height = 120
    @animation = Hash.new
    # @mode["idle"] = Gosu::Image.load_tiles @window, "zoeRocketIdle.png", @width, @height, true
    # @mode["pufR"] = Gosu::Image.load_tiles @window, "zoeRocketPufL.png", @width, @height, true
    # @mode["pufL"] = Gosu::Image.load_tiles @window, "zoeRocketPufR.png", @width, @height, true
    # center Image
    @x = @window.width/2 - @width/2
    @y = @window.height/2 - @height/2
    @frame = 0
    @animationMode = "idle"
  end

  def loadAnimation name, image
    @animation[name] = Gosu::Image.load_tiles @window, "assets/sprites/" + image, @width, @height, true
  end

  def setAnimation mode
    @animationMode = mode
  end

end

# @rocketMode = Sprite.new ["idle" => "zoeRocketIdle.png"]

# @idle = Sprite::animation "zoeRocketIdle.png", 120, 120
