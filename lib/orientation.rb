class Orientation
  attr_reader :direction

  RIGHT_TURNS = { 'W' => 'N', 'N' => 'E', 'E' => 'S', 'S' => 'W' }

  def initialize(direction)
    @direction = check_direction(direction) || direction
  end

  def change_clockwise
    @direction = RIGHT_TURNS[@direction]
  end

  private
    def check_direction(direction)
      raise "Not a direction" unless ['N','S','E','W'].include? direction
    end
end
