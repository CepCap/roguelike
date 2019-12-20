module Helper
  def ivs(name, value)
    instance_variable_set(name, value)
  end

  def ivg(name)
    instance_variable_get(name)
  end

  def txt_draw(text)
    Gosu::Image.from_text(text, 20, font: Constants::FONT, retro: true)
  end

  def debug?
    Gosu.button_down? Gosu::KB_B
  end

  def btn_down?(btn)
    Gosu.button_down?(btn)
  end

  def get_actor(actors, coords)
    actors.find { |actor| coords == [actor.x, actor.y] }
  end

  def bexit
    exit
  end
end
