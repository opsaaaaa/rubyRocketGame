require "gosu"

class HellowWorldGame < Gosu::Window
  def initialize with=800, height=600, fullscreen=false
    super
    self.caption = "hellow world!"

    @image = Gosu::Image.from_text self,
      "hello world and stuff",
      Gosu.default_font_name,
      100
  end

  def button_down id
    close if id == Gosu::KbEscape
  end

  def update
  end

  def draw
    @image.draw 0, 0, 0
  end

end

HellowWorldGame.new.show
