class Goblin < Monster
  def initialize(coords, map)
    @y, @x = coords
    @can_move_tiles = %w[.]
    @symbol = 'g'
    @hp = 5
    @attack = 2
    @map = map
  end

  def take_action(actors)
    send("move_#{Constants::POSSIBLE_MOVEMENTS.sample}")
  end
end
