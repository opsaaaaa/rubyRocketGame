

class SpriteTopDown < Sprite

  def initialize window
    super
  end

  # def drive hyp
  #   rot = @rotation * Math::PI / 180
  #   opp = hyp * Math.sin(rot)
  #   adj = hyp * Math.cos(rot)
  #   self.move opp, -adj
  # end
  
  def draw
    f = @frame % @animations[@animationMode].size
    image = @animations[@animationMode][f]
    image.draw_rot @x, @y, 1, @rotation
  end
end
