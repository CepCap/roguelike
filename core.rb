class Core
  def left_tile
    [y, x - 1]
  end

  def right_tile
    [y, x + 1]
  end

  def up_tile
    [y - 1, x]
  end

  def down_tile
    [y + 1, x]
  end
end
