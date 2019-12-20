module TileCheck
  def tile_left
    [y, x - 1]
  end

  def tile_right
    [y, x + 1]
  end

  def tile_up
    [y - 1, x]
  end

  def tile_down
    [y + 1, x]
  end
end
