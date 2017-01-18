class Position
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def get_position
    "#{x_coordinate} #{y_coordinate}"
  end

  private
    attr_reader :x_coordinate, :y_coordinate
end
