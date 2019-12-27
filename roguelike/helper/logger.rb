class Logger
  include Helper

  def initialize
    @logs = []
  end

  def clear_logs
    @logs.delete_if { |el| Time.now.to_i - el[1] > 20 && el[1] != 1 }
  end

  def get_log(action)
    @logs << [action, Time.now.to_i]
  end

  def draw_log
    @logs[0] = ["Time: #{Time.now.strftime('%H:%M:%S')}", 1]
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
