require_relative '../helper/helper'

module PlayerControls
  include Helper

  def controls
    player_move_up
    player_move_down
    player_move_right
    player_move_left
  end

  Constants::POSSIBLE_MOVEMENTS.each do |move|
    instance_variable_set("@move_#{move}_count", 0)
  end

  Constants::POSSIBLE_MOVEMENTS.each do |move|
    define_method("player_move_#{move}") do
      if btn_down?(Gosu.const_get("KB_#{move.upcase}"))
        ivs("@move_#{move}_count", ivg("@move_#{move}_count") + 1)
        if (ivg("@move_#{move}_count") % 15).zero? || ivg("@move_#{move}_count") == 1
          send("move_#{move}")
          self.acted = true
        end
      else
        instance_variable_set("@move_#{move}_count", 0)
      end
    end
  end
end
