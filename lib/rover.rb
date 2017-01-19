class Rover
  def initialize(orientation, current_position)
    @orientation = orientation
    @current_position = current_position
  end

  def get_current_position
    current_position.get_position
  end

  def get_current_direction
    orientation.direction
  end

  def turn_right
    orientation.change_clockwise
  end

  def turn_left
    orientation.change_anti_clockwise
  end

  private
    attr_reader :orientation, :current_position
end
