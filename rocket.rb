

class Rocket < SpriteTopDown
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
    @speed = 0.01
    @rotSpeed = 0.01
    @pressBttns = {
      :thrust => false,
      :turnLeft => false,
      :turnRight => false
    }
    @velocity = {
      :x => 0,
      :y => 0,
      :rot => 0
    }
  end

  def pressBttn bttn, pressed

    if pressed
      @pressBttns[bttn] = true
    else
      @pressBttns[bttn] = false
    end

    if @pressBttns[:thrust]
      if @pressBttns[:turnLeft]
        self.setAnimation "thrustLeft"
      elsif @pressBttns[:turnRight]
        self.setAnimation "thrustRight"
      else
        self.setAnimation "thrust"
      end
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

  def motion
    # self.drive
    self.move @velocity[:x], @velocity[:y]
    self.turn @velocity[:rot]
  end


  def addVelocity key, value
    @velocity[key] += value
  end

  def drive hyp, deg
    rad = deg * Math::PI / 180
    opp = hyp * Math.sin(rad)
    adj = hyp * Math.cos(rad)
    return {:y => adj, :x => opp}
  end

  def update
    m = self.drive @speed, @rotation
    self.motion
    self.addVelocity :x, m[:x] if @pressBttns[:thrust]
    self.addVelocity :y, -m[:y] if @pressBttns[:thrust]
    self.addVelocity :rot, -@rotSpeed if @pressBttns[:turnLeft]
    self.addVelocity :rot, @rotSpeed if @pressBttns[:turnRight]
    @frame += 1
  end

end
