
class Bird < Sprite
end

class Rocket < Sprite
  def initialize window
    super
    self.loadAnimation "idle", "zoeRocket/idle.png"
    self.loadAnimation "puffLeft", "zoeRocket/puffLeft.png"
    self.loadAnimation "puffRight", "zoeRocket/puffRight.png"
    self.loadAnimation "thrust", "zoeRocket/thrust.png"
    self.loadAnimation "thrustSmall", "zoeRocket/thrustSmall.png"
    self.loadAnimation "thrustLeft", "zoeRocket/thrustLeft.png"
    self.loadAnimation "thrustRight", "zoeRocket/thrustRight.png"
    @thrustTimer = 0
    @pressBttns = {
      :thrust => false,
      :turnLeft => false,
      :turnRight => false
    }
  end

  def pressBttn bttn, pressed
    if pressed
      @pressBttns[bttn] = true
    else
      @pressBttns[bttn] = false
    end
  end



  def button_up id
    self.pressBttn :turnRight, false if id == Gosu::KbRight
    self.pressBttn :turnLeft, false if id == Gosu::KbLeft
    self.pressBttn :thrust, false if id == Gosu::KbUp
  end

  def button_down id
    self.pressBttn :turnRight, true if id == Gosu::KbRight
    self.pressBttn :turnLeft, true if id == Gosu::KbLeft
    self.pressBttn :thrust, true if id == Gosu::KbUp
  end

  def update

    case
    when @pressBttns[:thrust]
      if @thrustTimer < 15
        self.setAnimation "thrustSmall"
        @thrustTimer += 1
      else
        if @pressBttns[:turnLeft]
          self.setAnimation "thrustLeft"
        elsif @pressBttns[:turnRight]
          self.setAnimation "thrustRight"
        else
          self.setAnimation "thrust"
        end
      end
    else
      if @thrustTimer > 1
        self.setAnimation "thrustSmall"
        @thrustTimer += -1
      else
        if @pressBttns[:turnLeft]
          self.setAnimation "puffLeft"
        elsif @pressBttns[:turnRight]
          self.setAnimation "puffRight"
        else
          self.setAnimation "idle"
        end
      end

    end
    @frame += 1
  end

  def draw
    f = @frame % @animations[@animationMode].size
    image = @animations[@animationMode][f]
    image.draw @x, @y, 1
  end
end
