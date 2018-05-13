

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
    @speed = 5
    @rotSpeed = 5
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

  def update
    self.drive @speed if @pressBttns[:thrust]
    self.turn -@rotSpeed if @pressBttns[:turnLeft]
    self.turn @rotSpeed if @pressBttns[:turnRight]
    @frame += 1
  end

end
