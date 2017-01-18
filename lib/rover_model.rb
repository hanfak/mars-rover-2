class RoverModel
  def initialize(rover, plateau)
    @rover = rover
  end

  def get_location_vector
    rover.get_current_position + " " + rover.get_current_direction
  end

  private
    attr_reader :rover
end
