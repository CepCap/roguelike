class Goblin < Monster
  def initialize(coords, map)
    @y, @x = coords
    @symbol = 'g'
    @hp = 5
    @attack = 2
    @map = map
    @can_move_tiles = %w[.]
  end

  def take_action(player)
    send("move_#{Constants::POSSIBLE_MOVEMENTS.sample}")
    if [tile_left, tile_right, tile_up, tile_down].any? [player.y, player.x]
      attack(player)
    end
  end
end
