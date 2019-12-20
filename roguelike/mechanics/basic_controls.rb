module BasicControls
  def controls
    exit if btn_down?(Gosu::KB_ESCAPE)
  end
end
