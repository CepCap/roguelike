class Monster
  include Movement
  include TileCheck

  %i[x y can_move_tiles symbol map].each do |el|
    attr_accessor el
  end

  def self.generate(coords, map)
    loop do
      @gen_coords = [rand(1..22), rand(1..30)]
      break unless coords.include? @gen_coords
    end

    Object.const_get(Constants::MONSTER_TYPES.sample).new(@gen_coords, map)
  end

  def initialize
    @can_move_tiles = %w[.]
  end
end
