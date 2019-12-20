class Map1
  include Helper

  attr_accessor :body

  def initialize
    regen_body
    redraw
  end

  def get_actors(actors)
    regen_body
    actors.each do |actor|
      @body[actor.y][actor.x] = actor.symbol
    end
    redraw
  end

  def regen_body
    @body = ([
      ('#' * 32) + "\n",
      Array.new(22, '#' + ('.' * 30) + "#\n"),
      ('#' * 32) + "\n"
    ].flatten.map { |el| el.split('') })
  end

  def redraw
    @body_to_draw = @body.join('')
  end

  def draw_body
    txt_draw(@body_to_draw).draw(0, 0, 0)
  end
end
