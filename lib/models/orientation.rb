class Orientation
  attr_reader :direction

  TURNS = { 'W' => 'N', 'N' => 'E', 'E' => 'S', 'S' => 'W' }

  def initialize(direction)
    @direction = check_direction(direction) || direction
  end

  def change_clockwise
    @direction = TURNS[@direction]
  end

  def change_anti_clockwise
    @direction = TURNS.invert[@direction]
  end

  private
    def check_direction(direction)
      raise "Not a direction" unless ['N','S','E','W'].include? direction
    end
end
