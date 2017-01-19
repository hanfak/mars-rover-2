class Position
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def get_position
    "#{x_coordinate} #{y_coordinate}"
  end

  def set_x(displacement)
    @x_coordinate += displacement
  end

  def set_y(displacement)
    @y_coordinate += displacement
  end

  private
    attr_reader :x_coordinate, :y_coordinate
end
