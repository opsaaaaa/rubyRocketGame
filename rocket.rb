
class Bird < Sprite
end

class Rocket < Sprite
  def initialize window
    super
    self.loadAnimation "idle", "zoeRocket/idle.png"
    self.loadAnimation "pufL", "zoeRocket/puffLeft.png"
    self.loadAnimation "pufR", "zoeRocket/puffRight.png"
  end

  def update
    @frame += 1
  end

  def draw
    f = @frame % @animation[@animationMode].size
    image = @animation[@animationMode][f]
    image.draw @x, @y, 1
  end
end
