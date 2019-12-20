class Logger
  include Helper

  def initialize
    @logs = []
  end

  def clear_logs
    @logs.map { |el| el unless Time.now.to_i - el[1] > 30 }
  end

  def get_log(action)
    @logs << [action, Time.now.to_i]
  end

  def draw_log
    @logs.each.with_index do |log, index|
      Gosu::Image.from_text(
        log[0], 14, font: Constants::FONT, retro: true
      ).draw(640, index * (20 * count_new_lines(log[0])), 0)
    end
  end

  def count_new_lines(log)
    log.split("\n").count
  end
end
