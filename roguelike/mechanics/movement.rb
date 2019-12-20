module Movement
  Constants::POSSIBLE_MOVEMENTS.each do |move|
    define_method("move_#{move}") do
      self.y, self.x = send("tile_#{move}") if can_move_to?(send("tile_#{move}"))
    end
  end

  def can_move_to?(tile)
    @can_move_tiles.include? @map.body[tile[0]][tile[1]]
  end
end
