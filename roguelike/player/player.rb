class Player
  include Movement
  include TileCheck
  include PlayerControls

  %i[x y can_move_tiles acted].each do |el|
    attr_accessor el
  end

  attr_reader :symbol

  def initialize(map)
    @map = map
    @can_move_tiles = %w[.]
    @x = 10
    @y = 10
    @hp = 30
    @attack = 10
    @symbol = '@'
  end

  def acted?
    return @acted unless @acted

    @acted = false
    true
  end

  def can_move?
    @can_move
  end
end
