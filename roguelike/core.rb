require 'gosu'
require 'pry'
require 'zeitwerk'
require_relative 'loader'

class Core < Gosu::Window
  include Helper
  include BasicControls
  include Constants

  def initialize
    super 1080, 480

    @logger = Logger.new
    @map = Map1.new
    @player = Player.new(@map)
    @npcs = []
    rand(3..8).times do
      @actors = @npcs + [@player]
      @npcs << Monster.generate(@actors, @map)
    end
  end

  def update
    controls
    @player.controls
    @map.get_actors(@actors)
    return unless @player.acted?

    @npcs.each do |npc|
      @map.get_actors(@actors)
      npc.take_action(@player)
    end
  end

  def draw
    @logger.draw_log
    @logger.clear_logs
    @map.draw_body
  end
end

Core.new.show
