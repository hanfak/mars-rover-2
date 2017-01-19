class Position
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
  end

  def get_position
    "#{x_coordinate} #{y_coordinate}"
  end

  def set_x(displacement)
    check_unit_amount(displacement)
    @x_coordinate += displacement
  end

  def set_y(displacement)
    check_unit_amount(displacement)
    @y_coordinate += displacement
  end

  private
    attr_reader :x_coordinate, :y_coordinate

    def check_unit_amount(displacement)
      raise 'Can only change by unit amount' unless displacement.abs == 1
    end
end
