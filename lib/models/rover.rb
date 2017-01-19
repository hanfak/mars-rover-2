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

  def move_forward
    current_position.set_x(-1) if get_current_direction == 'W'
    current_position.set_x(1) if get_current_direction == 'E'
    current_position.set_y(1) if get_current_direction == 'N'
    current_position.set_y(-1) if get_current_direction == 'S'
  end

  private
    attr_reader :orientation, :current_position
end
